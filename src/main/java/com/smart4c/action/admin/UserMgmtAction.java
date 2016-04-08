package com.smart4c.action.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.smart4c.bean.Administrator;
import com.smart4c.bean.AreaDetail;
import com.smart4c.bean.Company;
import com.smart4c.bean.Role;
import com.smart4c.bean.User;
import com.smart4c.common.SmartProperties;
import com.smart4c.dao.AdministratorDao;
import com.smart4c.dao.AreaDetailDao;
import com.smart4c.dao.CompanyDao;
import com.smart4c.dao.OrderDao;
import com.smart4c.dao.RoleDao;
import com.smart4c.dao.UsersDao;
import com.smart4c.util.EncryptionUtils;
import com.smart4c.util.MiscUtils;
import com.smart4c.util.Page;
import com.smart4c.util.SnCal;

public class UserMgmtAction extends ActionSupport implements ServletResponseAware, SessionAware{

	private HttpServletResponse response;
	
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private UsersDao uDao;
	@Autowired
	private UsersDao userDao;
	@Autowired
	private AdministratorDao adminDao;
	@Autowired
	private AreaDetailDao adDao;
	@Autowired
	private RoleDao rDao;
	@Autowired
	private CompanyDao comDao;
	@Autowired
	private OrderDao oDao;
	
	
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.response = arg0;
	}
	
	private String filters;
	private String ids;
	private Page page = new Page();
	
	private SmartProperties SMProp = SmartProperties.getInstance();

	private File icon;
	private String iconFileName;
	private SessionMap session;
	
	private String province;
	private String city;
	private String county;
	private String service;
	
	private int year;
	
	private User user;
	private Administrator adminUser;
	private Company com;
	
	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String addUser() {
		if (user == null || user.getId() != 0) {
			return null;
		}
		JSONObject obj = new JSONObject();
		User uTmp = userDao.findUserByPhone(user.getPhone());

		if (uTmp == null) {
			
				user.setName(user.getName());
				
				StringBuilder sb = new StringBuilder();
				for (byte b : EncryptionUtils.getSha1(user.getPassword())) {
					sb.append(b);
				}
				user.setPassword(sb.toString());
				
				user.setEmail(user.getEmail());
				AreaDetail ad = adDao.findByProvinceCityCounty(province, city, county);
				if (ad == null) {
					obj.put("success", false);
					obj.put("message", "区域信息获取失败，请重新设置！");
				} else {
					user.setAreaDetail(ad);
					user.setBalance(user.getBalance());
					Date curDate = new Date();
					user.setCreatedTime(curDate);
					user.setUpdateTime(curDate);
					user.setIcon("");
					user.setPath("");
					user.setStatus(0);
					List<Role> roles = roleDao.findByType((byte)1);
					user.setRole(roles.get(0));
					uDao.persist(user);
					obj.put("success", true);
					obj.put("id", user.getId());
				}
				
			
		} else {
			obj.put("success", false);
			obj.put("message", "手机号已注册，请用其它手机号添加用户！");
		}
		
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
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
	
	public String addSysUser(){
		if(adminUser == null || adminUser.getId() !=0){
			return null;
		}
		
		JSONObject obj = new JSONObject();
		Administrator utmp = adminDao.findUserByName(adminUser.getName());
		if(utmp == null){
			Date cur = new Date();
			adminUser.setBalance("");
			adminUser.setCreatedTime(cur);
			adminUser.setUpdateTime(cur);
			StringBuilder sb = new StringBuilder();
			for (byte b : EncryptionUtils.getSha1(adminUser.getPassword())) {
				sb.append(b);
			}
			adminUser.setPassword(sb.toString());
			AreaDetail ad = adDao.findByProvinceCityCounty(province, city, county);
			if (ad != null) {
				adminUser.setAreaDetail(ad);
			}
			adminDao.persist(adminUser);
			
			obj.put("success", true);
			obj.put("id", adminUser.getId());
		}else{
			obj.put("success", false);
			obj.put("message", "用户名已存在，请选择其他用户名");
		}
		response.setContentType("application/json;chartset=UTF-8");
		
		try{
			PrintWriter out = response.getWriter();
			out.write(obj.toString());
			out.flush();
			out.close();
		}catch(Exception e){
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	public String uploadUserAvatar(){
		boolean uploaded = false;
		JSONObject obj = new JSONObject();
		User u =uDao.find(user.getId());
		if(u !=null&&icon!=null){
			String imgPath = SMProp.getImgPath();
			String path = MiscUtils.addPathSuffix("user" + File.separator + SMProp.getProperty("user_avatar_folder"));
			String suffix = MiscUtils.getFileSuffix(iconFileName);
			String fileName = new Date().getTime()+"."+suffix;
			uploaded = MiscUtils.storeFile(imgPath + path, fileName, icon);
			if (!uploaded) {
				MiscUtils.getLogger().info("Failed to save user's avatar!");
			} else {
				u.setIcon(fileName);
				u.setPath(path);
				u.setUpdateTime(new Date());
				uDao.merge(u);
			}
		}
		
		obj.put("success", uploaded);
		obj.put("message", "");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
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
	
	public String uploadAdminUserAvatar() {
		boolean uploaded = false;
		JSONObject obj = new JSONObject();
		Administrator u = adminDao.find(adminUser.getId());
		if(u !=null&&icon!=null){
			String imgPath = SMProp.getImgPath();
			String path = MiscUtils.addPathSuffix("adminUser" + File.separator + SMProp.getProperty("user_avatar_folder"));
			String suffix = MiscUtils.getFileSuffix(iconFileName);
			String fileName = new Date().getTime()+"."+suffix;
			uploaded = MiscUtils.storeFile(imgPath + path, fileName, icon);
			if (!uploaded) {
				MiscUtils.getLogger().info("Failed to save user's avatar!");
			} else {
				u.setIcon(fileName);
				u.setPath(path);
				u.setUpdateTime(new Date());
				adminDao.merge(u);
			}
		}
		
		obj.put("success", uploaded);
		obj.put("message", "");
		response.setContentType("application/json;charset=UTF-8");
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
	
	public String updateUser() {
		if (user == null || user.getId() == 0) {
			return null;
		}
		JSONObject obj = new JSONObject();
		User uTmp = userDao.find(user.getId());
		if (uTmp != null) {
			uTmp.setEmail(user.getEmail());
			if (!"*********".equals(user.getPassword())) {
				StringBuilder sb = new StringBuilder();
				for (byte b : EncryptionUtils.getSha1(user.getPassword())) {
					sb.append(b);
				}
				uTmp.setPassword(sb.toString());
			}
			uTmp.setUpdateTime(new Date());
			uTmp.setStatus(user.getStatus());
			uTmp.setName(user.getName());
			uTmp.setPhone(user.getPhone());
			
			AreaDetail ad = adDao.findByProvinceCityCounty(province, city, county);
			if (ad != null) {
				uTmp.setAreaDetail(ad);
			} 
			
			uDao.merge(uTmp);
			
			obj.put("success", true);
			obj.put("message", "");
			obj.put("id", user.getId());
		}else{
			obj.put("success", false);
			obj.put("message", "用户不存在！请刷新后重试！");
		}
		
		response.setContentType("application/json;charset=UTF-8");
		
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
	
	public String updateSysUser(){
		if(adminUser==null || adminUser.getId()==0){
			return null;
		}
		JSONObject obj = new JSONObject();
		Administrator utmp = adminDao.find(adminUser.getId());
		Administrator curUser = (Administrator)session.get("adminUser");
		if(utmp!=null){
			if(utmp.getName().equals("admin")&&!curUser.getName().equals("admin")){
				obj.put("success", false);
				obj.put("message", "admin用户只能由其自己修改信息");
			}else{
				utmp.setName(adminUser.getName());
				if (!"*********".equals(adminUser.getPassword())) {
					StringBuilder sb = new StringBuilder();
					for (byte b : EncryptionUtils.getSha1(adminUser.getPassword())) {
						sb.append(b);
					}
					utmp.setPassword(sb.toString());
				}
				utmp.setPhone(adminUser.getPhone());
				utmp.setRole(adminUser.getRole());
				utmp.setEmail(adminUser.getEmail());
				utmp.setUpdateTime(new Date());
				
				AreaDetail ad = adDao.findByProvinceCityCounty(province, city, county);
				if (ad != null) {
					utmp.setAreaDetail(ad);
				}
				
				adminDao.merge(utmp);
				
				obj.put("success", true);
				obj.put("message","" );
				obj.put("id", adminUser.getId());
			}
			
		}else{
			obj.put("success", false);
			obj.put("message", "用户不存在，请刷新后重试！");
		}
		
		response.setContentType("application/json;charset=UTF-8");
		
		try{
			PrintWriter out = response.getWriter();
			out.print(obj.toString());
			out.flush();
			out.close();
		}catch(Exception e){
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	public String removeUser(){
		String adminId="",curId="";
		Administrator curUser = (Administrator)session.get("adminUser");
		if(curUser!=null){
			curId=curUser.getId().toString();
		}
		Administrator user = adminDao.findUserByName("admin");
		if(user!=null){
			adminId = user.getId().toString();
		}
		String[] idArr = ids.split(",");
		StringBuffer idBuf = new StringBuffer();
		for(String id :idArr){
			if(adminId.equals(id) || curId.equals(id)){
				continue;
			}
			idBuf.append(id + ",");
		}
		if (idBuf.length() > 0) {
			idBuf.deleteCharAt(idBuf.length() - 1);
		}
		ids = idBuf.toString();
		
		JSONObject obj = new JSONObject();
		
		int ret = 0;
		if (ids.isEmpty()) {
			obj.put("detail", "不能删除admin用户或当前登录用户！");
		} else {
			ret = adminDao.batchRemove(ids);
		}
		obj.put("ret", ret);
		response.setContentType("application/json;charset=UTF-8");
		
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
	
	
	public String getUserList() {
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		page.setFilters(filters);
		long totalRecords = userDao.countAll(page, filters);
		
		//////////////////////////////////////////////////////////////

		List<User> uList = userDao.getUsers(page, filters);
		if(uList!=null && uList.size()>0){
			String imgPath = SMProp.getImgPath();
			for(User u: uList){
				JSONObject obj = new JSONObject();
				obj.put("uid", u.getId());
				obj.put("user.name", u.getName());
				obj.put("user.password", "*********");
				obj.put("user.phone", u.getPhone());
				obj.put("user.email", u.getEmail());
				obj.put("user.path", u.getPath());
				obj.put("user.balance", u.getBalance());
				obj.put("province", u.getAreaDetail().getProvince());
				obj.put("city", u.getAreaDetail().getCity());
				obj.put("county", u.getAreaDetail().getCounty());
				SimpleDateFormat smp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				obj.put("user.creatTime", 
						smp.format(u.getCreatedTime()));
				if (u.getStatus() == 0) {
					obj.put("user.status", "是");
				} else {
					obj.put("user.status", "否");
				}
				if (u.getPath() != null && !u.getPath().isEmpty()
						&& u.getIcon() != null && !u.getIcon().isEmpty()) {
					obj.put("iconPN", imgPath + u.getPath() + ";" + u.getIcon());
				}
				jsonArr.add(obj);
			}
		}
		
		/////////////////////////////////////////////////////////////
		long totalPages = page.getPageCount(totalRecords);
		jsonObj.put("totalRecords", totalRecords);
		jsonObj.put("totalPages", totalPages);
		jsonObj.put("curPage", page.getCurPageNo());
		jsonObj.put("dataRows", jsonArr);
		
		response.setContentType("application/json;charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.write(jsonObj.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		
		return null;
	}
	
	public String getSysUserList() {
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		page.setFilters(filters);
		long totalRecords = adminDao.countAll(page, filters);
		
		//////////////////////////////////////////////////////////////
		
		List<Administrator> uList = adminDao.getUsers(page, filters);
		if(uList!=null && uList.size()>0){
			String imgPath = SMProp.getImgPath();
			for(Administrator u: uList){
				JSONObject obj = new JSONObject();
				obj.put("adminUser.id", u.getId());
				if(u.getRole()!= null){
					obj.put("adminUser.role.rid", u.getRole().getId());
				}
				obj.put("adminUser.name", u.getName());
				obj.put("adminUser.password", "*********");
				obj.put("adminUser.phone", u.getPhone());
				obj.put("adminUser.email", u.getEmail());
				obj.put("adminUser.role.id", u.getRole().getDisplayName());
				if (u.getPath() != null && !u.getPath().isEmpty()
						&& u.getIcon() != null && !u.getIcon().isEmpty()) {
					obj.put("iconPN", imgPath + u.getPath() + ";" + u.getIcon());
				}
				
				if (u.getAreaDetail() != null) {
					obj.put("province", u.getAreaDetail().getProvince());
					obj.put("city", u.getAreaDetail().getCity());
					obj.put("county", u.getAreaDetail().getCounty());
				}
				
				jsonArr.add(obj);
			}
		}
		
		/////////////////////////////////////////////////////////////
		long totalPages = page.getPageCount(totalRecords);
		jsonObj.put("totalRecords", totalRecords);
		jsonObj.put("totalPages", totalPages);
		jsonObj.put("curPage", page.getCurPageNo());
		jsonObj.put("dataRows", jsonArr);
		
		response.setContentType("application/json;charset=UTF-8");
		
		try {
			PrintWriter out = response.getWriter();
			out.write(jsonObj.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		
		return null;
	}
	
	public String removeComUser() {
		JSONObject obj = new JSONObject();
		do {
			int ret = comDao.batchRemove(ids);
			obj.put("ret", ret);
		} while (false);
		
		response.setContentType("application/json;charset=UTF-8");

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
	
	public String addComUser() {
		if (com == null || com.getId() != 0) {
			return null;
		}
		JSONObject obj = new JSONObject();
		Company o = comDao.findCompanyByPhone(com.getPhone());
		if (o == null) {
			StringBuilder sb = new StringBuilder();
			for (byte b : EncryptionUtils.getSha1(com.getPassword())) {
				sb.append(b);
			}
			com.setPassword(sb.toString());
			AreaDetail ad = adDao.findByProvinceCityCounty(province, city,
					county);
			if (ad == null) {
				obj.put("success", false);
				obj.put("message", "区域信息获取失败，请重新设置！");
			} else {
				com.setAreaDetail(ad);
				Date cur = new Date();
				com.setCreatedTime(cur);
				com.setUpdateTime(cur);
				Role r = roleDao.findByName("company");
				com.setRole(r);
				comDao.persist(com);
				obj.put("success", true);
				obj.put("id", com.getId());
			}
		} else {
			obj.put("success", false);
			obj.put("message", "手机号已注册，请用其它手机号添加用户！");
		}
		
		response.setContentType("application/json;charset=UTF-8");
		
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
	
	public String uploadComAvatar() {
		boolean uploaded = false;
		JSONObject obj = new JSONObject();
		Company o = comDao.find(com.getId());
		if(o !=null&&icon!=null){
			String imgPath = SMProp.getImgPath();
			String path = MiscUtils.addPathSuffix("company" + File.separator + SMProp.getProperty("user_avatar_folder"));
			String suffix = MiscUtils.getFileSuffix(iconFileName);
			String fileName = new Date().getTime()+"."+suffix;
			uploaded = MiscUtils.storeFile(imgPath + path, fileName, icon);
			if (!uploaded) {
				MiscUtils.getLogger().info("Failed to save user's avatar!");
			} else {
				o.setIcon(fileName);
				o.setPath(path);
				o.setUpdateTime(new Date());
				comDao.merge(o);
			}
		}
		
		obj.put("success", uploaded);
		obj.put("message", "");
		
		response.setContentType("application/json;charset=UTF-8");
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
	
	public String updateComUser() {
		if (com == null || com.getId() == 0) {
			return null;
		}
		
		Company tmp = comDao.find(com.getId());
		if (tmp != null) {
			tmp.setAddress(com.getAddress());
			tmp.setContacts(com.getContacts());
			tmp.setEmail(com.getEmail());
			tmp.setPhone(com.getPhone());
			tmp.setStatus(com.getStatus());
			tmp.setUpdateTime(new Date());
			if (!"*********".equals(com.getPassword())) {
				StringBuilder sb = new StringBuilder();
				for (byte b : EncryptionUtils.getSha1(com.getPassword())) {
					sb.append(b);
				}
				tmp.setPassword(sb.toString());
			}
			AreaDetail ad = adDao.findByProvinceCityCounty(province, city, county);
			if (ad != null) {
				tmp.setAreaDetail(ad);
			}
			comDao.merge(tmp);
		}
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		obj.put("message", "");
		obj.put("id", com.getId());
		
		response.setContentType("application/json;charset=UTF-8");
		
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
	
	public String getComList() {
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		page.setFilters(filters);
		long totalRecords = comDao.countAll(page, filters);
		
		//////////////////////////////////////////////////////////////
		List<Company> comList = comDao.getComList(page, filters);
		String imgPath = SMProp.getImgPath();
		for (Company c : comList) {
			JSONObject obj = new JSONObject();
			obj.put("com.id", c.getId());
			obj.put("com.company", c.getCompany());
			obj.put("com.password", "*********");
			obj.put("com.contacts", c.getContacts());
			obj.put("com.phone", c.getPhone());
			obj.put("com.email", c.getEmail());
			obj.put("com.balance", c.getBalance());
			obj.put("com.href", c.getHref_addr());
			obj.put("com.third", c.getThird_platform());
			String addr = "";
			if (c.getAreaDetail() != null) {
				addr = c.getAreaDetail().getProvince() + c.getAreaDetail().getCity() + c.getAreaDetail().getCounty();
				obj.put("province", c.getAreaDetail().getProvince());
				obj.put("city", c.getAreaDetail().getCity());
				obj.put("county", c.getAreaDetail().getCounty());
			}
			addr += c.getAddress();
			obj.put("address", addr);
			obj.put("com.address", c.getAddress());
			SimpleDateFormat smp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			obj.put("com.creatTime", 
					smp.format(c.getCreatedTime()));
			if (c.getStatus() == (byte)0) {
				obj.put("com.status", "是");
			} else {
				obj.put("com.status", "否");
			}
			if (c.getPath() != null && !c.getPath().isEmpty()
					&& c.getIcon() != null && !c.getIcon().isEmpty()) {
				obj.put("iconPN", imgPath + c.getPath() + ";" + c.getIcon());
			}
			jsonArr.add(obj);
		}
		
		/////////////////////////////////////////////////////////////
		long totalPages = page.getPageCount(totalRecords);
		jsonObj.put("totalRecords", totalRecords);
		jsonObj.put("totalPages", totalPages);
		jsonObj.put("curPage", page.getCurPageNo());
		jsonObj.put("dataRows", jsonArr);
		
		
		response.setContentType("application/json;charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.write(jsonObj.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		
		return null;		
	}
	
	
	private List<JSONObject> getMonthDay(int year) {
		// init start date and end date of every month
		List<JSONObject> monthDay = new ArrayList<JSONObject>();
		JSONObject obj = new JSONObject();
		obj.put("month", "01");
		obj.put("start", "01");
		obj.put("end", "31");
		monthDay.add(obj);
		// Feb
		obj = new JSONObject();
		obj.put("month", "02");
		obj.put("start", "01");
		if (MiscUtils.isLeapYear(year)) {
			obj.put("end", "29");
		} else {
			obj.put("end", "28");
		}
		monthDay.add(obj);
		// Mar
		obj = new JSONObject();
		obj.put("month", "03");
		obj.put("start", "01");
		obj.put("end", "31");
		monthDay.add(obj);
		// Apr
		obj = new JSONObject();
		obj.put("month", "04");
		obj.put("start", "01");
		obj.put("end", "30");
		monthDay.add(obj);
		// May
		obj = new JSONObject();
		obj.put("month", "05");
		obj.put("start", "01");
		obj.put("end", "31");
		monthDay.add(obj);
		// Jun
		obj = new JSONObject();
		obj.put("month", "06");
		obj.put("start", "01");
		obj.put("end", "30");
		monthDay.add(obj);
		// Jul
		obj = new JSONObject();
		obj.put("month", "07");
		obj.put("start", "01");
		obj.put("end", "31");
		monthDay.add(obj);
		// Aug
		obj = new JSONObject();
		obj.put("month", "08");
		obj.put("start", "01");
		obj.put("end", "31");
		monthDay.add(obj);
		// Sep
		obj = new JSONObject();
		obj.put("month", "09");
		obj.put("start", "01");
		obj.put("end", "30");
		monthDay.add(obj);
		// Oct
		obj = new JSONObject();
		obj.put("month", "10");
		obj.put("start", "01");
		obj.put("end", "31");
		monthDay.add(obj);
		// Nov
		obj = new JSONObject();
		obj.put("month", "11");
		obj.put("start", "01");
		obj.put("end", "30");
		monthDay.add(obj);
		// Dec
		obj = new JSONObject();
		obj.put("month", "12");
		obj.put("start", "01");
		obj.put("end", "31");
		monthDay.add(obj);
				
		return monthDay;
	}

	
	public String getCompanyPurchasedUser(){
		JSONArray jsonArr = new JSONArray();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM");
		List<JSONObject> monList = getMonthDay(year);
		
		for(JSONObject mon : monList){
			try {
				Date begDate = sdf.parse(year + "-" + mon.getString("month") 
						+ "-" + mon.getString("start") + " 00:00:00");
				Date endDate = sdf.parse(year + "-" + mon.getString("month") 
						+ "-" + mon.getString("end")+ " 23:59:59");
				
				JSONObject obj = new JSONObject();
				obj.put("month", sdf2.format(begDate));
				obj.put("user", oDao.getTotalPurchasedUser(begDate,endDate));
				jsonArr.add(obj);
				
				
			} catch (ParseException e) {
				MiscUtils.getLogger().info(e.toString());
			}
		}
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		try {
			PrintWriter out =response.getWriter();
			out.write(jsonArr.toString());
			out.flush();
			out.close();
			
		} catch (IOException e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	
	public String getCompanyRegisterUser() {
		JSONArray jsonArr = new JSONArray();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM");
		List<JSONObject> monList = getMonthDay(year);
		
		for (JSONObject mon : monList) {
			try {
				Date begDate = sdf.parse(year + "-" + mon.getString("month") 
						+ "-" + mon.getString("start") + " 00:00:00");
				Date endDate = sdf.parse(year + "-" + mon.getString("month") 
						+ "-" + mon.getString("end")+ " 23:59:59");
				JSONObject obj = new JSONObject();
				obj.put("month", sdf2.format(begDate));
				obj.put("users", uDao.getCompanyTotalRegisterUser(begDate, endDate));
				jsonArr.add(obj);
			} catch (Exception e) {
				MiscUtils.getLogger().info(e.toString());
			}
		}
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.write(jsonArr.toString());
			out.flush();
			out.close();
			
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		
		return null;
	}
	
	
	
	
	public String getPurchasedUser(){
		JSONArray jsonArr = new JSONArray();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM");
		List<JSONObject> monList = getMonthDay(year);
		
		for(JSONObject mon : monList){
			try {
				Date begDate = sdf.parse(year + "-" + mon.getString("month") 
						+ "-" + mon.getString("start") + " 00:00:00");
				Date endDate = sdf.parse(year + "-" + mon.getString("month") 
						+ "-" + mon.getString("end")+ " 23:59:59");
				
				JSONObject obj = new JSONObject();
				obj.put("month", sdf2.format(begDate));
				obj.put("user", oDao.getTotalPurchasedUser(begDate,endDate));
				jsonArr.add(obj);
				
				
			} catch (ParseException e) {
				MiscUtils.getLogger().info(e.toString());
			}
		}
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		try {
			PrintWriter out =response.getWriter();
			out.write(jsonArr.toString());
			out.flush();
			out.close();
			
		} catch (IOException e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	
	public String getRegisterUser() {
		JSONArray jsonArr = new JSONArray();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM");
		List<JSONObject> monList = getMonthDay(year);
		
		for (JSONObject mon : monList) {
			try {
				Date begDate = sdf.parse(year + "-" + mon.getString("month") 
						+ "-" + mon.getString("start") + " 00:00:00");
				Date endDate = sdf.parse(year + "-" + mon.getString("month") 
						+ "-" + mon.getString("end")+ " 23:59:59");
				JSONObject obj = new JSONObject();
				obj.put("month", sdf2.format(begDate));
				obj.put("users", uDao.getTotalRegisterUser(begDate, endDate));
				jsonArr.add(obj);
			} catch (Exception e) {
				MiscUtils.getLogger().info(e.toString());
			}
		}
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.write(jsonArr.toString());
			out.flush();
			out.close();
			
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		
		return null;
	}
	
	
	

	public String getFilters() {
		return filters;
	}

	public void setFilters(String filters) {
		this.filters = filters;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public RoleDao getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	public UsersDao getuDao() {
		return uDao;
	}

	public void setuDao(UsersDao uDao) {
		this.uDao = uDao;
	}

	public UsersDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UsersDao userDao) {
		this.userDao = userDao;
	}

	public File getIcon() {
		return icon;
	}

	public void setIcon(File icon) {
		this.icon = icon;
	}

	public SmartProperties getSMProp() {
		return SMProp;
	}

	public void setSMProp(SmartProperties sMProp) {
		SMProp = sMProp;
	}

	public String getIconFileName() {
		return iconFileName;
	}

	public void setIconFileName(String iconFileName) {
		this.iconFileName = iconFileName;
	}

	public SessionMap getSession() {
		return session;
	}

	public void setSession(SessionMap session) {
		this.session = session;
	}

	public Administrator getAdminUser() {
		return adminUser;
	}

	public void setAdminUser(Administrator adminUser) {
		this.adminUser = adminUser;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.session = (SessionMap)arg0;
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

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public Company getCom() {
		return com;
	}

	public void setCom(Company com) {
		this.com = com;
	}
}
