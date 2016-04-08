package com.smart4c.action.hongxi;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smart4c.bean.Order;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.smart4c.action.common.HttpPostSms;
import com.smart4c.bean.AreaDetail;
import com.smart4c.bean.Company;
import com.smart4c.bean.User;
import com.smart4c.common.SmartProperties;
import com.smart4c.dao.AreaDetailDao;
import com.smart4c.dao.CompanyDao;
import com.smart4c.dao.OrderDao;
import com.smart4c.dao.ServiceShopDao;
import com.smart4c.dao.UsersDao;
import com.smart4c.util.MiscUtils;

import net.sf.json.JSONObject;

public class HelpAction extends ActionSupport implements ServletResponseAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static String baseChars = "0123456789";
	private static final SmartProperties SmartProp = SmartProperties.getInstance();
	
	private HttpServletResponse response;
	
	private String province;
	private String city;
	private String account;
	private String password;
	private String phone;
	private String imagecode;
	private String smscode;
	private String servicecode;
	
	private String mobile;
	private String checkmobile;
	
	private int userid;
	private int sp_id;
	
	@Autowired
	private AreaDetailDao areaDetailDao;
	
	@Autowired
	private UsersDao userDao;
	
	@Autowired
	private CompanyDao companyDao;
	
	@Autowired
	private ServiceShopDao serviceShopDao;
	
	@Autowired
	private OrderDao orderDao;
	
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}
	
	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getSp_id() {
		return sp_id;
	}

	public void setSp_id(int sp_id) {
		this.sp_id = sp_id;
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

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getImagecode() {
		return imagecode;
	}

	public void setImagecode(String imagecode) {
		this.imagecode = imagecode;
	}

	public String getSmscode() {
		return smscode;
	}

	public void setSmscode(String smscode) {
		this.smscode = smscode;
	}

	public String getServicecode() {
		return servicecode;
	}

	public void setServicecode(String servicecode) {
		this.servicecode = servicecode;
	}

	public String getCheckmobile() {
		return checkmobile;
	}

	public void setCheckmobile(String checkmobile) {
		this.checkmobile = checkmobile;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public static String getRandomString(int num) {
		if (num < 1) {
			num = 1;
		}
		int len = baseChars.length();
		StringBuffer randomStr = new StringBuffer();
		Random random = new Random();
		for(int i=0; i<num; i++){
			randomStr.append(baseChars.charAt(random.nextInt(len)));
		}
		return randomStr.toString();
	}
	
	public String getCityByProvince(){
		try {
			province = java.net.URLDecoder.decode(province,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<AreaDetail> city_list = areaDetailDao.findAllCityByProvince(province);
		List<AreaDetail> county_list = areaDetailDao.findAllCountyByCity(city_list.get(0).getCity());
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		StringBuilder html = new StringBuilder("");
		StringBuilder html2 = new StringBuilder("");
		List<String> isRepeat = new ArrayList<String>();
		List<String> isRepeat2 = new ArrayList<String>();
		
		for(int i = 0;i < city_list.size();i ++){
			if(!isRepeat.contains(city_list.get(i).getCity())){
				html.append("<option value=\"" + String.valueOf(city_list.get(i).getId()) + "\">" + city_list.get(i).getCity() + "</option>");
				isRepeat.add(city_list.get(i).getCity());
			}
		}
		
		for(int i = 0;i < county_list.size();i ++){
			if(!isRepeat.contains(county_list.get(i).getCounty())){
				html2.append("<option value=\"" + String.valueOf(county_list.get(i).getId()) + "\">" + county_list.get(i).getCounty() + "</option>");
				isRepeat2.add(county_list.get(i).getCity());
			}
		}
		ret.put("html", html.toString());
		ret.put("html2", html2.toString());
		if(city_list.size() > 0){
			ret.put("getcity",city_list.get(0).getCity());
		}
		try {		
			PrintWriter out = response.getWriter();
			out.print(ret.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	public String getCountyByProvinceandCity(){
		try {
			
			city = java.net.URLDecoder.decode(city,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<AreaDetail> county_list = areaDetailDao.findAllCountyByCity(city);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		StringBuilder html = new StringBuilder("");
		List<String> isRepeat = new ArrayList<String>();
		
		for(int i = 0;i < county_list.size();i ++){
			if(!isRepeat.contains(county_list.get(i).getCounty())){
				html.append("<option value=\"" + String.valueOf(county_list.get(i).getId()) + "\">" + county_list.get(i).getCounty() + "</option>");
				isRepeat.add(county_list.get(i).getCity());
			}
		}
		ret.put("html", html.toString());
		if(county_list.size() > 0){
			ret.put("getcounty",county_list.get(0).getCounty());
		}
		try {		
			PrintWriter out = response.getWriter();
			out.print(ret.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	public String checkPhone(){
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		String imgcode = (String)httpRequest.getSession().getAttribute("imagecode");
		
		if(userDao.findUserByPhone(phone) == null){
			ret.put("errCode", 1);
		}else if(!imgcode.equalsIgnoreCase(imagecode)){
			ret.put("errCode", 2);
		}else{
			ret.put("result", "ok");
		}
		try {		
			PrintWriter out = response.getWriter();
			out.print(ret.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	public String checkCompanyPhone(){
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		String imgcode = (String)httpRequest.getSession().getAttribute("imagecode");
		
		if(companyDao.findCompanyByPhone(phone) == null){
			ret.put("errCode", 1);
		}else if(!imgcode.equalsIgnoreCase(imagecode)){
			ret.put("errCode", 2);
		}else{
			ret.put("result", "ok");
		}
		try {		
			PrintWriter out = response.getWriter();
			out.print(ret.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	public String checkPeoplePhone(){
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		String imgcode = (String)httpRequest.getSession().getAttribute("imagecode");
		
		if(userDao.findUserByPhone(phone) == null){
			ret.put("errCode", 1);
		}else{
			if(companyDao.findCompanyByPhone(phone) == null){
				ret.put("errCode", 1);
			}
		}
		if(!imgcode.equalsIgnoreCase(imagecode)){
			ret.put("errCode", 2);
		}else{
			ret.put("result", "ok");
		}
		try {		
			PrintWriter out = response.getWriter();
			out.print(ret.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	public String checkShopPhone(){
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		String imgcode = (String)httpRequest.getSession().getAttribute("imagecode");
		
		if(serviceShopDao.findByPhone(phone) == null){
			ret.put("errCode", 1);
		}else if(!imgcode.equalsIgnoreCase(imagecode)){
			ret.put("errCode", 2);
		}else{
			ret.put("result", "ok");
		}
		try {		
			PrintWriter out = response.getWriter();
			out.print(ret.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	public String sendPwdCode(){
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		
		String getcode = getRandomString(6);
		String temp = HttpPostSms.sendSms(phone, "@1@=" + getcode, SmartProp.getProperty("sms_tempid_pwd"));
		
		if(temp.contains("0#")){
			httpRequest.getSession().setAttribute("changepwd", getcode);
			httpRequest.getSession().setAttribute("changephone", phone);
			ret.put("result", "ok");
		}else{
			ret.put("errCode", 1);
		}
		try {		
			PrintWriter out = response.getWriter();
			out.print(ret.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}

	public String checkPwdCode(){
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		
		String session_code = (String)httpRequest.getSession().getAttribute("changepwd");
		if(session_code.equals(smscode)){
			ret.put("result", "ok");
		}else{
			ret.put("errCode", 1);
		}
		try {		
			PrintWriter out = response.getWriter();
			out.print(ret.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	public String checkMobile(){
		User user = userDao.findUserByPhone(checkmobile);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		if(null != user){
			ret.put("result", "fail");
		}else{
			ret.put("result", "true");
		}
		try {		
			PrintWriter out = response.getWriter();
			out.print(ret.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	public String checkCmobile(){
		Company company = companyDao.findCompanyByPhone(checkmobile);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		if(null != company){
			ret.put("result", "fail");
		}else{
			ret.put("result", "true");
		}
		try {		
			PrintWriter out = response.getWriter();
			out.print(ret.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	public String checkSmobile(){
		Company company = companyDao.findCompanyByPhone(checkmobile);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		if(null != company){
			ret.put("result", "fail");
		}else{
			ret.put("result", "true");
		}
		try {		
			PrintWriter out = response.getWriter();
			out.print(ret.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	public String sendRegisterSmsCode(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		String getcode = getRandomString(6);
		
		HttpPostSms.sendSms(mobile, "@1@=" + getcode,SmartProp.getProperty("sms_tempid_register"));
		httpRequest.getSession().setAttribute("smscode", getcode);
		return null;
	}
	
	public String sendChangePhoneSmsCode(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		String getcode = getRandomString(6);
		
		HttpPostSms.sendSms(mobile, "@1@=" + getcode,SmartProp.getProperty("sms_tempid_changephone"));
		httpRequest.getSession().setAttribute("phone_code", getcode);
		return null;
	}
	
	public String sendServiceCode(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		String getcode = getRandomString(6);
		
		HttpPostSms.sendSms(mobile, "@1@=" + getcode,SmartProp.getProperty("sms_tempid_checkservice"));
		httpRequest.getSession().setAttribute("80_servicecode", getcode);
		return null;
	}
	
	
	
	public String checkServiceCode(){
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		
		String session_code = (String)httpRequest.getSession().getAttribute("80_servicecode");
		if(session_code.equals(servicecode)){
			String serialnumber = httpRequest.getParameter("serialnumber");
			Order order  = orderDao.findOrderBySerialnumber(serialnumber).get(0);
			order.setState(2);
			orderDao.saveOrder(order);
			ret.put("result", "ok");
		}else{
			ret.put("errCode", 1);
		}
		try {		
			PrintWriter out = response.getWriter();
			out.print(ret.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	public static String sendPaidOrderSms(String phone,String serialnumber){
		String ret = HttpPostSms.sendSms(phone, "@1@=" + serialnumber,SmartProp.getProperty("sms_tempid_order2"));
		return ret;
	}
	
	public static String sendUsedOrderSms(String phone,String serialnumber,String address){
		String ret = HttpPostSms.sendSms(phone, "@1@=" + serialnumber + ",@2@=" + address,SmartProp.getProperty("sms_tempid_order1"));
		return ret;
	}
	
	public static String sendPrepaidSms(String phone,String time,String money){
		String ret = HttpPostSms.sendSms(phone, "@1@=" + time + ",@2@=" + money,SmartProp.getProperty("sms_tempid_prepaid"));
		return ret;
	}
	public String setNowCity(){
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		
		if(null != city && city.length() > 0){
			try {
				city = java.net.URLDecoder.decode(city,"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			List<AreaDetail> nowprovince = areaDetailDao.findAllCountyByCity(city + "市");
			
			httpRequest.getSession().setAttribute("setcity", city + "市");
			ret.put("nowcity", city + "市");
			if(nowprovince.size() > 0){
				httpRequest.getSession().setAttribute("nowprovince", nowprovince.get(0).getProvince());
			}
		}
		if(null != province && province.length() > 0){
			String nowcity = "";
			try {
				province = java.net.URLDecoder.decode(province,"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			List<AreaDetail> nowcity_list = areaDetailDao.findAllCityByProvince(province);
			if(nowcity_list.size() > 0){
				nowcity = nowcity_list.get(0).getCity();
				httpRequest.getSession().setAttribute("setcity", nowcity);
				ret.put("nowcity", nowcity);
				httpRequest.getSession().setAttribute("nowprovince", nowcity_list.get(0).getProvince());
			}else{
				ret.put("nowcity", "");
			}
		}
		
		try {		
			PrintWriter out = response.getWriter();
			out.print(ret.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	public String getNowCityByProvince(){
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		
		String nowcity = "";
		try {
			province = java.net.URLDecoder.decode(province,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<AreaDetail> nowcity_list = areaDetailDao.findAllCityByProvince(province);
		if(nowcity_list.size() > 0){
			nowcity = nowcity_list.get(0).getCity();
			ret.put("nowcity", nowcity);
		}else{
			ret.put("nowcity", "");
		}
		
		try {		
			PrintWriter out = response.getWriter();
			out.print(ret.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
}
