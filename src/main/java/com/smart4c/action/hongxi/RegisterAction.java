package com.smart4c.action.hongxi;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.smart4c.bean.AreaDetail;
import com.smart4c.bean.Company;
import com.smart4c.bean.DetailPicture;
import com.smart4c.bean.PaidType;
import com.smart4c.bean.Role;
import com.smart4c.bean.ServiceShop;
import com.smart4c.bean.User;
import com.smart4c.common.SmartProperties;
import com.smart4c.dao.AreaDetailDao;
import com.smart4c.dao.CompanyDao;
import com.smart4c.dao.DetailPictureDao;
import com.smart4c.dao.PaidTypeDao;
import com.smart4c.dao.RoleDao;
import com.smart4c.dao.ServiceShopDao;
import com.smart4c.dao.UsersDao;
import com.smart4c.util.EncryptionUtils;
import com.smart4c.util.MiscUtils;

import net.sf.json.JSONObject;

public class RegisterAction extends ActionSupport implements ServletResponseAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private HttpServletResponse response;
	
	private SmartProperties prop = SmartProperties.getInstance();
	
	//
	private User user;
	private String name;
	private String email;
	private String mobile;
	private String imagecode;
	private String verifycode;
	private String password;
	private String repassword;
	private String city_id;
	
	//
	private String cname;
	private String contact;
	private String cmobile;
	private String cemail;
	private String caddress;
	private String caccount;
	private String cpassword;
	
	private String supplier_name;
	private String meter;
	private String people;
	private String years;
	private String address;
	private String logo;
	private String path;
	private String identity_img;
	private String dp_img1;
	private String dp_img2;
	private String dp_img3;
	private String dp_path;
	
	private Company company;
	
	@Autowired
	private UsersDao userDao;
	
	@Autowired
	private RoleDao roleDao;
	
	@Autowired
	private AreaDetailDao areaDetailDao;
	
	@Autowired
	private CompanyDao companyDao;
	
	@Autowired
	private ServiceShopDao serviceShopDao;
	
	@Autowired
	private PaidTypeDao paidTypeDao;
	
	@Autowired
	private DetailPictureDao dpDao;
	
	
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

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getImagecode() {
		return imagecode;
	}

	public void setImagecode(String imagecode) {
		this.imagecode = imagecode;
	}

	public String getVerifycode() {
		return verifycode;
	}

	public void setVerifycode(String verifycode) {
		this.verifycode = verifycode;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public String getCity_id() {
		return city_id;
	}

	public void setCity_id(String city_id) {
		this.city_id = city_id;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getCmobile() {
		return cmobile;
	}

	public void setCmobile(String cmobile) {
		this.cmobile = cmobile;
	}

	public String getCemail() {
		return cemail;
	}

	public void setCemail(String cemail) {
		this.cemail = cemail;
	}

	public String getCaddress() {
		return caddress;
	}

	public void setCaddress(String caddress) {
		this.caddress = caddress;
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

	public String getSupplier_name() {
		return supplier_name;
	}

	public void setSupplier_name(String supplier_name) {
		this.supplier_name = supplier_name;
	}

	public String getMeter() {
		return meter;
	}

	public void setMeter(String meter) {
		this.meter = meter;
	}

	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	public String getYears() {
		return years;
	}

	public void setYears(String years) {
		this.years = years;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getIdentity_img() {
		return identity_img;
	}

	public void setIdentity_img(String identity_img) {
		this.identity_img = identity_img;
	}

	
	
	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public String getDp_img1() {
		return dp_img1;
	}

	public void setDp_img1(String dp_img1) {
		this.dp_img1 = dp_img1;
	}

	public String getDp_img2() {
		return dp_img2;
	}

	public void setDp_img2(String dp_img2) {
		this.dp_img2 = dp_img2;
	}

	public String getDp_img3() {
		return dp_img3;
	}

	public void setDp_img3(String dp_img3) {
		this.dp_img3 = dp_img3;
	}

	public String getDp_path() {
		return dp_path;
	}

	public void setDp_path(String dp_path) {
		this.dp_path = dp_path;
	}

	public UsersDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UsersDao userDao) {
		this.userDao = userDao;
	}

	public RoleDao getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	public AreaDetailDao getAreaDetailDao() {
		return areaDetailDao;
	}

	public void setAreaDetailDao(AreaDetailDao areaDetailDao) {
		this.areaDetailDao = areaDetailDao;
	}

	public CompanyDao getCompanyDao() {
		return companyDao;
	}

	public void setCompanyDao(CompanyDao companyDao) {
		this.companyDao = companyDao;
	}

	public ServiceShopDao getServiceShopDao() {
		return serviceShopDao;
	}

	public void setServiceShopDao(ServiceShopDao serviceShopDao) {
		this.serviceShopDao = serviceShopDao;
	}

	public PaidTypeDao getPaidTypeDao() {
		return paidTypeDao;
	}

	public void setPaidTypeDao(PaidTypeDao paidTypeDao) {
		this.paidTypeDao = paidTypeDao;
	}

	public DetailPictureDao getDpDao() {
		return dpDao;
	}

	public void setDpDao(DetailPictureDao dpDao) {
		this.dpDao = dpDao;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String Register(){
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		String ckeckcode = (String)httpRequest.getSession().getAttribute("smscode");
		String checkimagecode = (String)httpRequest.getSession().getAttribute("imagecode");
		if(null != ckeckcode){
			if(!ckeckcode.contains(verifycode)){
				ret.put("errCode", 2);
			}else if(!checkimagecode.equalsIgnoreCase(imagecode)){
				ret.put("errCode", 3);
			}else{
				User olduser = userDao.findUserByPhone(mobile);
				if(null != olduser){
					ret.put("errCode", 4);
				}else{
					User user = new User();
					if(null != name && name.length() > 0){
						user.setName(name);
					}else{
						user.setName(mobile);
					}
					user.setPhone(mobile);
					if(null != password){
						byte[] sha1Bytes = EncryptionUtils.getSha1(password);
						StringBuilder sb = new StringBuilder();
						for (byte b : sha1Bytes) {
							sb.append(b);
						}
						user.setPassword(sb.toString());
					}
					if(null != email && email.length() > 0){
						user.setEmail(email);
					}else{
						user.setEmail("");
					}
					user.setBalance("");
					user.setRole(roleDao.find(2));
					if(null != city_id){
						user.setAreaDetail(areaDetailDao.findAreaByid(Integer.parseInt(city_id)));
					}
					user.setUpdateTime(new Date());
					user.setCreatedTime(new Date());
					user.setIcon("");
					user.setPath("");
					user.setStatus(0);
					userDao.saveNewUser(user);
					
					User newuser = userDao.findUserByPhone(mobile);
					if(null != newuser){
						ret.put("result", "ok");
						ret.put("http_referer", httpRequest.getContextPath() + "/login.jsp");
					}else{
						ret.put("errCode", 5);
					}
				}
			}
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
	
	public String Cregister(){
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
//znn
System.out.println(company.getContacts());
		Company oldcompany = companyDao.findCompanyByPhone(company.getPhone());
		if(null != oldcompany){
			ret.put("error", 1);
		}else{
			Company newcompany = new Company();
			newcompany.setCompany(company.getCompany());
			newcompany.setContacts(company.getContacts());
			newcompany.setPhone(company.getPhone());
			if(company.getEmail() != null && company.getEmail().length() > 0){
				newcompany.setEmail(company.getEmail());
			}else{
				newcompany.setEmail("");
			}
			Role role = roleDao.find(3);
			newcompany.setRole(role);
			
			AreaDetail city = areaDetailDao.findAreaByid(Integer.parseInt(city_id));
			newcompany.setAreaDetail(city);
			newcompany.setAddress(company.getAddress());
			newcompany.setCompany(company.getCompany());
			
			if(null != company.getPassword()){
				byte[] sha1Bytes = EncryptionUtils.getSha1(company.getPassword());
				StringBuilder sb = new StringBuilder();
				for (byte b : sha1Bytes) {
					sb.append(b);
				}
				newcompany.setPassword(sb.toString());
			}
			newcompany.setMasterId(0);
			newcompany.setCreatedTime(new Date());
			newcompany.setUpdateTime(new Date());
			newcompany.setBalance("");
			newcompany.setIcon("");
			newcompany.setPath("");
			
			companyDao.saveNewCompany(newcompany);
			ret.put("ok", true);
			ret.put("http_referer", httpRequest.getContextPath() + "/clogin.jsp");
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
	
	public String Sregister(){
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		
		ServiceShop serviceShop = new ServiceShop();
		if(null != mobile){
			ServiceShop oldshop = serviceShopDao.findServiceShopByPhone(mobile);
			if(null != oldshop){
				ret.put("success", "1");
			}else{
				serviceShop.setPhone(mobile);
				if(null != password){
					byte[] sha1Bytes = EncryptionUtils.getSha1(password);
					StringBuilder sb = new StringBuilder();
					for (byte b : sha1Bytes) {
						sb.append(b);
					}
					serviceShop.setPassword(sb.toString());
				}
				if(null != supplier_name){
					serviceShop.setTitle(supplier_name);
				}
				if(null != cmobile){
					serviceShop.setTel(cmobile);
				}
				if(null != meter){
					double area = Double.parseDouble(meter);
					serviceShop.setSizes(area);
				}
				if(null != people){
					int num = Integer.parseInt(people);
					serviceShop.setPeople(num);
				}
				if(null != years){
					int year = Integer.parseInt(years);
					serviceShop.setYears(year);
				}
				if(null != address){
					serviceShop.setAddress(address);
				}
				if(null != city_id && city_id.length() > 0){
					AreaDetail city = areaDetailDao.findAreaByid(Integer.parseInt(city_id));
					serviceShop.setAreaDetail(city);
				}
				if(null != logo){
					serviceShop.setImage(logo);
				}
				if(null != path && (identity_img !=null || logo!= null)){
					serviceShop.setPath(path);
				}
				if(null != identity_img){
					serviceShop.setLicense(identity_img);
				}
				serviceShop.setBusiness("8:00 － 19:00 ");
				PaidType paid = paidTypeDao.findPaidTypeById(1);
				serviceShop.setPaidtype(paid);
				serviceShop.setStatus(1);
				serviceShop.setCreatedTime(new Date());
				serviceShop.setUpdateTime(new Date());
				serviceShopDao.saveNewServiceShop(serviceShop);
				ret.put("success", "0");
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
	
	public String editBinisuess(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		ServiceShop shop_user = (ServiceShop)httpRequest.getSession().getAttribute("shopuser");
		List<DetailPicture> dp_list = dpDao.getShopThumbnails(shop_user.getId());
		if(null != supplier_name){
			shop_user.setTitle(supplier_name);
		}
		if(null != cmobile){
			shop_user.setTel(cmobile);
		}
		if(null != meter){
			double area = Double.parseDouble(meter);
			shop_user.setSizes(area);
		}
		if(null != people){
			int num = Integer.parseInt(people);
			shop_user.setPeople(num);
		}
		if(null != years){
			int year = Integer.parseInt(years);
			shop_user.setYears(year);
		}
		if(null != city_id && city_id.length() > 0){
			AreaDetail city = areaDetailDao.findAreaByid(Integer.parseInt(city_id));
			shop_user.setAreaDetail(city);
		}
		if(null != address){
			shop_user.setAddress(address);
		}
		if(null != logo){
			shop_user.setImage(logo);
		}
		if(null != path){
			shop_user.setPath(path);
		}
		if(null != identity_img){
			shop_user.setLicense(identity_img);
		}
		if(null != dp_img1 &&null != dp_path){
			dp_list.get(0).setImage(dp_img1);
			dp_list.get(0).setPath(dp_path);
		}
		if(null != dp_img2 &&null != dp_path){
			dp_list.get(1).setImage(dp_img2);
			dp_list.get(0).setPath(dp_path);
		}
		if(null != dp_img3 &&null != dp_path){
			dp_list.get(2).setImage(dp_img3);
			
		}
		
		for(int i=0;i<3;i++){
			dp_list.get(i).setPath(dp_path);
			dp_list.get(i).setCreatedTime(new Date());
			dp_list.get(i).setUpdateTime(new Date());
			dp_list.get(i).setObjectId(shop_user.getId());
			dp_list.get(i).setStatus(0);
			dp_list.get(i).setThumbnail(1);
			dp_list.get(i).setType(0);
			dpDao.merge(dp_list.get(i));
		}
		
		shop_user.setBusiness("08:00 － 19:00 ");
		//shop_user.setLatitude(0);
		//shop_user.setLongitude(0);
		serviceShopDao.saveServiceShop(shop_user);
		
		httpRequest.getSession().setAttribute("shopuser",shop_user);
		
		ret.put("success", "0");
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
	
	public String addUser(){
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		Company fc = (Company)httpRequest.getSession().getAttribute("company");
		
		Company oldcompany = companyDao.findCompanyByPhone(company.getPhone());
		if(null != oldcompany){
			ret.put("result", 1);
		}else{
			Company newcompany = new Company();
			newcompany.setCompany(company.getCompany());
			newcompany.setPhone(company.getPhone());
			if(null != company.getPassword()){
				byte[] sha1Bytes = EncryptionUtils.getSha1(company.getPassword());
				StringBuilder sb = new StringBuilder();
				for (byte b : sha1Bytes) {
					sb.append(b);
				}
				newcompany.setPassword(sb.toString());
			}
			
			newcompany.setContacts(company.getContacts());
			newcompany.setMasterId(fc.getId());
			newcompany.setCreatedTime(new Date());
			newcompany.setUpdateTime(new Date());
			newcompany.setRole(roleDao.find(4));
			
			newcompany.setAddress(fc.getAddress());
			newcompany.setAreaDetail(fc.getAreaDetail());
			newcompany.setBalance("0.00");
			newcompany.setEmail("");
			newcompany.setIcon("");
			newcompany.setPath("");
			newcompany.setStatus((byte)0);
			
			companyDao.saveNewCompany(newcompany);
			ret.put("result", 0);
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
	
	public String changeUser(){
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		Company oldcompany = companyDao.findCompanyById(company.getId());
		List<Company> check_company = companyDao.findAllCompanyByPhone(company.getPhone());
		
		if(check_company.size() > 2){
			ret.put("result", 1);
		}else{
			oldcompany.setCompany(company.getCompany());
			oldcompany.setPhone(company.getPhone());
			if(null != company.getPassword()){
				byte[] sha1Bytes = EncryptionUtils.getSha1(company.getPassword());
				StringBuilder sb = new StringBuilder();
				for (byte b : sha1Bytes) {
					sb.append(b);
				}
				oldcompany.setPassword(sb.toString());
			}
			oldcompany.setContacts(company.getContacts());
			oldcompany.setUpdateTime(new Date());
			
			companyDao.saveCompany(oldcompany);
			ret.put("result", 0);
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
