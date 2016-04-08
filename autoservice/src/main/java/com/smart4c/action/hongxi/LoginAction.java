package com.smart4c.action.hongxi;

import com.opensymphony.xwork2.ActionSupport;
import com.smart4c.bean.*;
import com.smart4c.dao.*;
import com.smart4c.util.EncryptionUtils;
import com.smart4c.util.MiscUtils;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class LoginAction extends ActionSupport implements ServletResponseAware,SessionAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private HttpServletResponse response;
	@SuppressWarnings("rawtypes")
	private SessionMap session;
	
	
	@Autowired
	private UsersDao userDao;
	@Autowired
	private AdministratorDao adminDao;
	
	@Autowired
	private CompanyDao companyDao;
	
	@Autowired
	private MyCartDao myCartDao;
	
	@Autowired
	private ServiceShopDao serviceShopDao;
	
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}
	
	//
	private String account;
	private String password;
	private String phone;
	private String newpwd;
	
	private String caccount;
	private String cpassword;
	
	private String saccount;
	private String spassword;
	
	private User adminUser;

	public User getAdminUser() {
		return adminUser;
	}

	public void setAdminUser(User adminUser) {
		this.adminUser = adminUser;
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

	public String getNewpwd() {
		return newpwd;
	}

	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}

	public String getCaccount() {
		return caccount;
	}

	public void setCaccount(String caccount) {
		this.caccount = caccount;
	}

	public String getCpassword() {
		return cpassword;
	}

	public void setCpassword(String cpassword) {
		this.cpassword = cpassword;
	}

	public String getSaccount() {
		return saccount;
	}

	public void setSaccount(String saccount) {
		this.saccount = saccount;
	}

	public String getSpassword() {
		return spassword;
	}

	public void setSpassword(String spassword) {
		this.spassword = spassword;
	}

	/**
	 * @return true if inputed password equals password in the DB, false otherwise.
	 */
	public boolean checkPassword(String inputedPassword, String pass) {
		if (inputedPassword == null) return (false);

		byte[] sha1Bytes = EncryptionUtils.getSha1(inputedPassword);
		StringBuilder sb = new StringBuilder();
		for (byte b : sha1Bytes) {
			sb.append(b);
		}
		if (pass.equals(sb.toString())) {
			return (true);
		} else {
			try {
				// sleep to throttle anyone trying to brute force hack passwords
				Thread.sleep(250);
			} catch (InterruptedException e) {
				MiscUtils.getLogger().error("Error", e);
			}
			return (false);
		}
	}
	
	@SuppressWarnings("unchecked")
	public String Login(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		httpRequest.getSession().setAttribute("company",null);
		httpRequest.getSession().setAttribute("shopuser",null);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		if(null == userDao.findUserByPhone(account)){
			ret.put("result", 1);
		}else{
			User user = userDao.findUserByPhone(account);
			if (!checkPassword(password,user.getPassword())) {
				ret.put("result", 2);
			} else {
				
				httpRequest.getSession().setAttribute("user", user);
				ret.put("result", 0);
				
				List<MyCart> cart_list = (List<MyCart>)httpRequest.getSession().getAttribute("ProductInCart");
				List<MyCart> my_list = myCartDao.findMyCartByUser(user.getId());
				List<Integer> sp_list = new ArrayList<Integer>();
				MyCart new_cart = new MyCart();
				if(my_list.size() > 0){
					for(int i = 0;i < my_list.size();i ++){
						sp_list.add(my_list.get(i).getServiceProduct().getId());
					}
				}
				if(null == cart_list){
					cart_list = new ArrayList<MyCart>();
				}
				if(cart_list.size() > 0){
					for(int i = 0;i < cart_list.size();i ++){
						if(!sp_list.contains(cart_list.get(i).getServiceProduct().getId())){
							new_cart = cart_list.get(i);
							new_cart.setUser(user);
							myCartDao.saveNewMyCart(new_cart);
						}
					}
				}
				
				my_list = myCartDao.findMyCartByUser(user.getId());
				httpRequest.getSession().setAttribute("ProductInCart", my_list);
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
	
	@SuppressWarnings("unchecked")
	public String adminLogin() {
		if (session.get("adminUser") != null) {
			return "success";
		}
		
		if (adminUser == null) {
			return "login";
		}
		
		String ret = "NotFound";
		
		Administrator userTmp = adminDao.findUserByName(adminUser.getName());
		if (userTmp == null) {
			return ret;
		}
	
		Role role = userTmp.getRole();
		if (role == null || role.getRoleType() != (byte)0) {
			return ret;
		}
		if (!checkPassword(adminUser.getPassword(), userTmp.getPassword())) {
			ret = "ErrorPass";
		} else {
			session.put("adminUser", userTmp);
			ret = "success";
		}
		
		return ret;
	}
	
	@SuppressWarnings("unchecked")
	public String Clogin(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		httpRequest.getSession().setAttribute("user",null);
		httpRequest.getSession().setAttribute("shopuser",null);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		if(null == companyDao.findCompanyByPhone(caccount)){
			ret.put("result", 1);
		}else{
			Company company = companyDao.findCompanyByPhone(caccount);
			if (!checkPassword(cpassword, company.getPassword())) {
				ret.put("result", 2);
			} else {
				HttpSession httpSession = httpRequest.getSession();
				httpSession.setAttribute("company", company);
				ret.put("result", 0);
				
				List<MyCart> cart_list = (List<MyCart>)httpRequest.getSession().getAttribute("ProductInCart");
				List<MyCart> my_list = myCartDao.findMyCartByCompany(company.getId());
				List<Integer> sp_list = new ArrayList<Integer>();
				MyCart new_cart = new MyCart();
				if(my_list.size() > 0){
					for(int i = 0;i < my_list.size();i ++){
						sp_list.add(my_list.get(i).getServiceProduct().getId());
					}
				}
				if(null == cart_list){
					cart_list = new ArrayList<MyCart>();
				}
				if(cart_list.size() > 0){
					for(int i = 0;i < cart_list.size();i ++){
						if(!sp_list.contains(cart_list.get(i).getServiceProduct().getId())){
							new_cart = cart_list.get(i);
							new_cart.setCompany(company);
							myCartDao.saveNewMyCart(new_cart);
						}
					}
				}
				
				my_list = myCartDao.findMyCartByCompany(company.getId());
				httpRequest.getSession().setAttribute("ProductInCart", my_list);
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
	
	public String Slogin(){
		HttpServletRequest httpRequest= ServletActionContext.getRequest();
		httpRequest.getSession().setAttribute("user",null);
		httpRequest.getSession().setAttribute("company",null);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		JSONObject obj = new JSONObject();
		ServiceShop sShop = serviceShopDao.findServiceShopByPhone(saccount);
		if(sShop!=null){
			if(sShop.getStatus() == 0){
				if(checkPassword(spassword, sShop.getPassword())){
					obj.put("result", 3);
					httpRequest.getSession().setAttribute("shopuser", sShop);
					obj.put("url", httpRequest.getContextPath() + "/sindex.jsp");
				}else{
					obj.put("result", 2);
				}
			}else if(sShop.getStatus() == 1){
				obj.put("result", 1);
			}else{
				obj.put("result", 5);
			}
			
		}else{
			obj.put("result", 4);
		}
		
		try {
			PrintWriter out = response.getWriter();
			out.write(obj.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	public String saveChangePwd(){
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		
		String changepone = (String)httpRequest.getSession().getAttribute("changephone");
		User user = userDao.findUserByPhone(changepone);
		
		byte[] sha1Bytes = EncryptionUtils.getSha1(newpwd);
		StringBuilder sb = new StringBuilder();
		for (byte b : sha1Bytes) {
			sb.append(b);
		}
		
		user.setPassword(sb.toString());
		user.setUpdateTime(new Date());
		userDao.saveUser(user);
		
		ret.put("result", "ok");
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
	
	public String saveCompanyChangePwd(){
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		
		String changepone = (String)httpRequest.getSession().getAttribute("changephone");
		Company company = companyDao.findCompanyByPhone(changepone);
		
		byte[] sha1Bytes = EncryptionUtils.getSha1(newpwd);
		StringBuilder sb = new StringBuilder();
		for (byte b : sha1Bytes) {
			sb.append(b);
		}
		
		company.setPassword(sb.toString());
		company.setUpdateTime(new Date());
		companyDao.saveCompany(company);
		
		ret.put("result", "ok");
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
	
	public String saveShopChangePwd(){
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		
		String changepone = (String)httpRequest.getSession().getAttribute("changephone");
		ServiceShop shop = serviceShopDao.findByPhone(changepone);
		
		byte[] sha1Bytes = EncryptionUtils.getSha1(newpwd);
		StringBuilder sb = new StringBuilder();
		for (byte b : sha1Bytes) {
			sb.append(b);
		}
		
		shop.setPassword(sb.toString());
		shop.setUpdateTime(new Date());
		serviceShopDao.saveServiceShop(shop);
		
		ret.put("result", "ok");
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

	@SuppressWarnings("rawtypes")
	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = (SessionMap)arg0;
	}
	
	public String allLogin(){
		if(null != userDao.findUserByPhone(account)){
			Login();
		}else{
			caccount = account;
			cpassword = password;
			Clogin();
		}
		return null;
	}
	
}
