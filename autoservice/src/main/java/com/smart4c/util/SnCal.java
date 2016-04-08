package com.smart4c.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.NoSuchAlgorithmException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

import net.sf.json.JSONObject;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
 
//java版计算signature签名
public class SnCal {
        public static void main(String[] args) throws UnsupportedEncodingException,
                        NoSuchAlgorithmException {
                SnCal snCal = new SnCal();
                String sn = snCal.getSn("百度大厦", "json", "/geocoder/v2/?", "WTiEvqqkMxoXoBNwYutdd7km", "KnfpTRfiM5VNxDKU1nX9FvdP31sRKF90");
                HttpClient client = new HttpClient();
                // 设置 Http 连接超时为5秒
                client.getHttpConnectionManager().getParams().setConnectionTimeout(5000);
                client.getHostConfiguration().setHost("api.map.baidu.com", 80, "http");
                StringBuffer params = new StringBuffer();
                params.append("address=" + URLEncoder.encode("百度大厦", "UTF-8"));
                params.append("&output=json");
                params.append("&ak=WTiEvqqkMxoXoBNwYutdd7km");
                params.append("&sn="+sn);
                
                GetMethod method = new GetMethod("/geocoder/v2/?" + params.toString());
                // 设置 get 请求超时为 5 秒
                method.getParams().setParameter(HttpMethodParams.SO_TIMEOUT, 5000);
                // 设置请求重试处理，用的是默认的重试处理：请求三次
                method.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,	new DefaultHttpMethodRetryHandler());
                method.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, "UTF-8"); // added on Aug 4th, 2015 用来设置返回的字符串的编码
                try {
					client.executeMethod(method);
					if (HttpStatus.SC_OK == method.getStatusCode()) {
						JSONObject rsp = JSONObject.fromObject(new String(method.getResponseBody(), "UTF-8"));
						if (rsp.getInt("status") != 0) {
							MiscUtils.getLogger().info(rsp.getString("message"));
						}
					}
					
				} catch (HttpException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					MiscUtils.getLogger().error(e.toString());
				} finally {
					method.releaseConnection();
				}
                
                
        }
 
        // 对Map内所有value作utf8编码，拼接返回结果
        public String toQueryString(Map<?, ?> data)
                        throws UnsupportedEncodingException {
                StringBuffer queryString = new StringBuffer();
                for (Entry<?, ?> pair : data.entrySet()) {
                        queryString.append(pair.getKey() + "=");
                        queryString.append(URLEncoder.encode((String) pair.getValue(),
                                        "UTF-8") + "&");
                }
                if (queryString.length() > 0) {
                        queryString.deleteCharAt(queryString.length() - 1);
                }
                return queryString.toString();
        }
 
        // 来自stackoverflow的MD5计算方法，调用了MessageDigest库函数，并把byte数组结果转换成16进制
        public String MD5(String md5) {
                try {
                        java.security.MessageDigest md = java.security.MessageDigest
                                        .getInstance("MD5");
                        byte[] array = md.digest(md5.getBytes());
                        StringBuffer sb = new StringBuffer();
                        for (int i = 0; i < array.length; ++i) {
                                sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100)
                                                .substring(1, 3));
                        }
                        return sb.toString();
                } catch (NoSuchAlgorithmException e) {
                }
                return null;
        }
        
        public String getSn(String addr, String output, String prefix, String ak, String sk) throws UnsupportedEncodingException {
        	// 计算sn跟参数对出现顺序有关，所以用LinkedHashMap保存<key,value>，此方法适用于get请求，如果是为发送post请求的url生成签名，请保证参数对按照key的字母顺序依次放入Map。以get请求为例：http://api.map.baidu.com/geocoder/v2/?address=百度大厦&output=json&ak=yourak，paramsMap中先放入address，再放output，然后放ak，放入顺序必须跟get请求中对应参数的出现顺序保持一致。
            LinkedHashMap<String, String> paramsMap = new LinkedHashMap<String, String>();
            paramsMap.put("address", addr);
            paramsMap.put("output", output);
            paramsMap.put("ak", ak);

            // 调用下面的toQueryString方法，对LinkedHashMap内所有value作utf8编码，拼接返回结果address=%E7%99%BE%E5%BA%A6%E5%A4%A7%E5%8E%A6&output=json&ak=yourak
            String paramsStr = toQueryString(paramsMap);

            // 对paramsStr前面拼接上/geocoder/v2/?，后面直接拼接yoursk得到/geocoder/v2/?address=%E7%99%BE%E5%BA%A6%E5%A4%A7%E5%8E%A6&output=json&ak=yourakyoursk
            String wholeStr = new String(prefix + "?" + paramsStr + sk);

            // 对上面wholeStr再作utf8编码
            String tempStr = URLEncoder.encode(wholeStr, "UTF-8");

            // 调用下面的MD5方法得到最后的sn签名7de5a22212ffaa9e326444c75a58f9a0
            return MD5(tempStr);
        }
}