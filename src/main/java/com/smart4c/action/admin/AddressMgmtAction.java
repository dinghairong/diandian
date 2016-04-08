package com.smart4c.action.admin;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.smart4c.bean.AreaDetail;
import com.smart4c.dao.AreaDetailDao;

public class AddressMgmtAction extends ActionSupport implements ServletResponseAware,ServletRequestAware{
	
	@Autowired
	private AreaDetailDao adDao;
	
	private HttpServletResponse response;
	private HttpServletRequest request;
	private String province;
	private String city;
	private String term;
	
	public String getCities() throws UnsupportedEncodingException {
		List<String> cities = adDao.getCites(URLDecoder.decode(province, "UTF-8"), URLDecoder.decode(term,"UTF-8"));//new String(province.getBytes("ISO-8859-1"), "utf-8")
		JSONArray cityArr = new JSONArray();
		for (String city :cities) {
			JSONObject obj = new JSONObject();
			obj.put("label", city);
			obj.put("value", city);
			cityArr.add(obj);
		}
		
		response.setContentType("application/json;charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.write(cityArr.toString());
			out.flush();
			out.close();
		} catch (Exception e) {}
		
		return null;
	}
	
	public String getCounties() throws UnsupportedEncodingException {
		
		List<String> counties = adDao.getCounties(URLDecoder.decode(province, "UTF-8"), URLDecoder.decode(city, "UTF-8"), URLDecoder.decode(term,"UTF-8"));
		JSONArray countyArr = new JSONArray();
		for (String county : counties) {
			JSONObject obj = new JSONObject();
			obj.put("label", county);
			obj.put("value", county);
			countyArr.add(obj);
		}
		
		response.setContentType("application/json;charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.write(countyArr.toString());
			out.flush();
			out.close();
		} catch (Exception e) {}
		
		return null;
	}
	
	public String getDefaultCityCounty() throws UnsupportedEncodingException {
		JSONObject ret = new JSONObject();
		do {
			AreaDetail a = adDao.getDefaultArea(URLDecoder.decode(province, "UTF-8"));
			if (a == null) {
				ret.put("ret", 1);
				ret.put("msg", "无法获取默认城市及县区信息！");
				break;
			}
			ret.put("city", a.getCity());
			ret.put("county", a.getCounty());
			ret.put("cid", a.getId());
			ret.put("ret", 0);
		} while(false);
		
		response.setContentType("application/json;charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.write(ret.toString());
			out.flush();
			out.close();
		} catch (Exception e) {}
		
		return null;
	}
	
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.response = arg0;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request = arg0;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}
}
