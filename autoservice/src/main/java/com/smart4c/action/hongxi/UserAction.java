package com.smart4c.action.hongxi;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.smart4c.bean.Advisory;
import com.smart4c.bean.Company;
import com.smart4c.bean.User;
import com.smart4c.dao.AdvisoryDao;
import com.smart4c.dao.CompanyDao;
import com.smart4c.dao.UsersDao;
import com.smart4c.util.EncryptionUtils;
import com.smart4c.util.MiscUtils;

import net.sf.json.JSONObject;

public class UserAction extends ActionSupport implements ServletResponseAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private HttpServletResponse response;
	
	public User user;
	
	private String sms_code;
	
	private String problem;
	
	private String search;
	
	private int cid;
	
	private String set_cid;
	
	@Autowired
	private UsersDao userDao;
	
	@Autowired
	private AdvisoryDao advisoryDao;
	
	@Autowired
	private CompanyDao companyDao;

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getSet_cid() {
		return set_cid;
	}

	public void setSet_cid(String set_cid) {
		this.set_cid = set_cid;
	}

	public String getSms_code() {
		return sms_code;
	}

	public void setSms_code(String sms_code) {
		this.sms_code = sms_code;
	}
	
	public String getProblem() {
		return problem;
	}

	public void setProblem(String problem) {
		this.problem = problem;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String updateUserInfo(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		User login_user = (User)httpRequest.getSession().getAttribute("user");
		String ckeckcode = (String)httpRequest.getSession().getAttribute("phone_code");
		if(null != login_user){
			if(null != ckeckcode){
				if(ckeckcode.equals(sms_code)){
					if(null != user.getName()){
						login_user.setName(user.getName());
					}
					if(null != user.getPhone() && user.getPhone().length() > 0){
						login_user.setPhone(user.getPhone());
					}
					if(null != user.getEmail()){
						login_user.setEmail(user.getEmail());
					}
					if(null != user.getPassword() && user.getPassword().length() > 0){
						byte[] sha1Bytes = EncryptionUtils.getSha1(user.getPassword());
						StringBuilder sb = new StringBuilder();
						for (byte b : sha1Bytes) {
							sb.append(b);
						}
						login_user.setPassword(sb.toString());
					}
					login_user.setUpdateTime(new Date());
					userDao.saveUser(login_user);
					httpRequest.getSession().setAttribute("user",login_user);
					
					ret.put("success", true);
				}else{
					ret.put("error", 1);
				}
			}else{
				if(null != user.getName() && user.getName().length() > 0){
					login_user.setName(user.getName());
				}
				if(null != user.getEmail() && user.getEmail().length() > 0){
					login_user.setEmail(user.getEmail());
				}
				if(null != user.getPassword() && user.getPassword().length() > 0){
					byte[] sha1Bytes = EncryptionUtils.getSha1(user.getPassword());
					StringBuilder sb = new StringBuilder();
					for (byte b : sha1Bytes) {
						sb.append(b);
					}
					login_user.setPassword(sb.toString());
				}
				if(null != user.getIcon() && user.getIcon().length() > 0){
					login_user.setIcon(user.getIcon());
				}
				if(null != user.getPath() && user.getPath().length() > 0){
					login_user.setPath(user.getPath());
				}
				login_user.setUpdateTime(new Date());
				userDao.saveUser(login_user);
				httpRequest.getSession().setAttribute("user",login_user);
				
				ret.put("success", true);
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
	
	public String searchProblem(){
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		StringBuilder html = new StringBuilder();
		String search = "";
		try {
			search = java.net.URLDecoder.decode(problem,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<Advisory> search_problem = advisoryDao.findAdvisoryBySearch(search);
		if(search_problem.size() > 0){
			for(int i = 0;i < search_problem.size();i ++){
				html.append("<li><a href=\"javascript:void(0)\" style=\"text-decoration:underline;\" onclick=\"showAnswer(this)\">");
				html.append(search_problem.get(i).getUsecontent());
				html.append("</a><div class=\"problem_list_span\"><span style=\"display:block;\">问题解答：</span><span>");
				if(null != search_problem.get(i).getUucontent()){
					html.append(search_problem.get(i).getUucontent());
				}else{
					html.append("");
				}
				html.append("</span></div></li>");
			}
		}else{
			HttpServletRequest httpRequest = ServletActionContext.getRequest();
			html.append("<li>没有相关问题，你可以点击<a href=\"" + httpRequest.getContextPath() + "/advisory.jsp\" style=\"color:red;\">我要提问</a>，进行提问，帮你养车网会有专业人士帮你解答。<li>");
		}
		ret.put("html", html.toString());
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
	
	public String searchUser(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		Company company = (Company)httpRequest.getSession().getAttribute("company");
		StringBuilder html = new StringBuilder();
		List<Company> company_list = companyDao.findCompanyUserBySearchAndId(search,company.getId());
		if(company_list.size() > 0){
            for(int i = 0;i < company_list.size();i ++){
            	html.append("<li>");
            	html.append("<input type=\"hidden\" id=\"cid\" value=\"" + company_list.get(i).getId() + "\">");
            	html.append("<span style=\"width: 43px;\"><input type=\"checkbox\" class=\"checkbox\"/></span>");
            	html.append("<span style=\"width: 202px;\">" + company_list.get(i).getCompany() + "</span>");
            	html.append("<span style=\"width: 202px;\">" + company_list.get(i).getPhone() + "</span>");
            	html.append("<span style=\"width: 203px;\">******</span>");
            	html.append("<span class=\"no\" style=\"width: 302px;\">" + company_list.get(i).getContacts() + "</span>");
            	html.append("</li>");
            	
            	ret.put("result", 0);
            }
		}else{
			ret.put("result", 1);
		}
		
		ret.put("html", html.toString());
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
	
	public String deleteUser(){
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		String[] cid_list = set_cid.split(",");
		for(int i = 0;i < cid_list.length;i ++){
			if(cid_list[i].length() > 0){
				int id = Integer.parseInt(cid_list[i]);
				int result = companyDao.deleteCompanyById(id);
				if(result > 0){
					ret.put("result", 0);
				}else{
					ret.put("result", 1);
				}
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
	
	public String addMyProblem(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		User user = (User)httpRequest.getSession().getAttribute("user");
		Advisory my = new Advisory();
		my.setUser(user);
		if(null != problem){
			try {
				problem = java.net.URLDecoder.decode(problem,"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		Advisory haveproblem = advisoryDao.findAdvisoryByProblam(problem);
		if(null == haveproblem){
			my.setUsecontent(problem);
			my.setUsetime(new Date());
			advisoryDao.saveNewAdvisory(my);
			ret.put("success", "0");
		}else{
			ret.put("success", "1");
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
