package com.smart4c.util;

import java.io.UnsupportedEncodingException;
import java.security.SignatureException;

import org.apache.commons.codec.digest.DigestUtils;

public class MD5 {
	/**
     * 加密字符串
     * @param text 需要加密的字符串
     * @param input_charset 编码格式
     * @return 加密结果
     */
    public static String encode2Md5(String source, String input_charset) {
        return DigestUtils.md5Hex(getContentBytes(source, input_charset));
    }
    
    /**
     * 加密字符串
     * @param text 需要加密的字符串
     * @param okMd5 已加密的字符串
     * @param input_charset 编码格式
     * @return 加密结果
     */
    public static boolean verify(String source, String okMd5,String input_charset) {
    	String mytext = DigestUtils.md5Hex(getContentBytes(source, input_charset));
    	if(mytext.equals(okMd5)) {
    		return true;
    	}
    	else {
    		return false;
    	}
    }

    /**
     * @param content
     * @param charset
     * @return
     * @throws SignatureException
     * @throws UnsupportedEncodingException 
     */
    private static byte[] getContentBytes(String content, String charset) {
        if (charset == null || "".equals(charset)) {
            return content.getBytes();
        }
        try {
            return content.getBytes(charset);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("MD5签名过程中出现错误,指定的编码集不对,您目前指定的编码集是:" + charset);
        }
    }
}
