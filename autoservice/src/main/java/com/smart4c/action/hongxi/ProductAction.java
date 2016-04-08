package com.smart4c.action.hongxi;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smart4c.util.SpringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.smart4c.action.common.ChartServlet;
import com.smart4c.alipay.util.UtilDate;
import com.smart4c.bean.Comment;
import com.smart4c.bean.Company;
import com.smart4c.bean.CorpOrderNumber;
import com.smart4c.bean.MyCart;
import com.smart4c.bean.Order;
import com.smart4c.bean.PaidType;
import com.smart4c.bean.Prepaid;
import com.smart4c.bean.ServiceProduct;
import com.smart4c.bean.ServiceProject;
import com.smart4c.bean.ServiceShop;
import com.smart4c.bean.ServiceshopService;
import com.smart4c.bean.User;
import com.smart4c.bean.UserCoupon;
import com.smart4c.common.SmartProperties;
import com.smart4c.dao.CommentDao;
import com.smart4c.dao.CompanyDao;
import com.smart4c.dao.CorpOrderNumberDao;
import com.smart4c.dao.MyCartDao;
import com.smart4c.dao.OrderDao;
import com.smart4c.dao.PaidTypeDao;
import com.smart4c.dao.PrepaidDao;
import com.smart4c.dao.ServiceClassDao;
import com.smart4c.dao.ServiceProductDao;
import com.smart4c.dao.ServiceProjectDao;
import com.smart4c.dao.ServiceShopDao;
import com.smart4c.dao.ServiceshopServiceDao;
import com.smart4c.dao.UserCouponDao;
import com.smart4c.dao.UsersDao;
import com.smart4c.util.MiscUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ProductAction  extends ActionSupport implements ServletResponseAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private HttpServletResponse response;
	
	private static SmartProperties smartProp = SmartProperties.getInstance();
	
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	private int sc_id;
	private int sp_id;
	private int number;
	private int start;
	private int page;
	private int pid;
	
	private int oid;
	private int star;
	private String set_title;
	private String set_content;
	
	private String province;
	private String city;
	private String county;
	
	private int uid;
	private int sid;
	private int uc_id;
	private String serialnumber;
	private int state;
	private int haveaction;
	
	private String deliveryDate;
	private String userName;
	private String orderProducts;
	private String sumMoney;
	private String orderStatus;
	private String owner;
	private String orderType;
	
	private String set_spid;
	
	private int yearnum;
	private String year;
	
	private String customername;
	private String customerphone;
	
	private String fuzzy;
	private String id_list;
	private int orderby;
	private String searchbyfuzzy;
	private String fuzzystring;
	private int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Autowired
	private UsersDao userDao;
	
	@Autowired
	private CompanyDao companyDao;
	
	@Autowired
	private ServiceClassDao serviceClassDao;
	
	@Autowired
	private ServiceProductDao serviceProductDao;
	
	@Autowired
	private ServiceProjectDao serviceProjectDao;
	
	@Autowired
	private MyCartDao myCartDao;
	
	@Autowired
	private ServiceShopDao serviceShopDao;
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private PaidTypeDao paidTypeDao;
	
	@Autowired
	private ServiceshopServiceDao serviceshopServiceDao;
	
	@Autowired
	private CommentDao commentDao;
	
	@Autowired
	private CorpOrderNumberDao corpOrderNumberDao;
	
	@Autowired
	private PrepaidDao prepaidDao;
	
	@Autowired
	private UserCouponDao userCouponDao;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getSc_id() {
		return sc_id;
	}

	public void setSc_id(int sc_id) {
		this.sc_id = sc_id;
	}

	public String getSet_spid() {
		return set_spid;
	}

	public void setSet_spid(String set_spid) {
		this.set_spid = set_spid;
	}
	
	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getSp_id() {
		return sp_id;
	}

	public void setSp_id(int sp_id) {
		this.sp_id = sp_id;
	}
	
	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
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

	public int getUc_id() {
		return uc_id;
	}

	public void setUc_id(int uc_id) {
		this.uc_id = uc_id;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public String getSet_title() {
		return set_title;
	}

	public void setSet_title(String set_title) {
		this.set_title = set_title;
	}

	public String getSet_content() {
		return set_content;
	}

	public void setSet_content(String set_content) {
		this.set_content = set_content;
	}

	public String getSerialnumber() {
		return serialnumber;
	}

	public void setSerialnumber(String serialnumber) {
		this.serialnumber = serialnumber;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getHaveaction() {
		return haveaction;
	}

	public void setHaveaction(int haveaction) {
		this.haveaction = haveaction;
	}

	public String getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getOrderProducts() {
		return orderProducts;
	}

	public void setOrderProducts(String orderProducts) {
		this.orderProducts = orderProducts;
	}

	public String getSumMoney() {
		return sumMoney;
	}

	public void setSumMoney(String sumMoney) {
		this.sumMoney = sumMoney;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public int getYearnum() {
		return yearnum;
	}

	public void setYearnum(int yearnum) {
		this.yearnum = yearnum;
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public String getCustomerphone() {
		return customerphone;
	}

	public void setCustomerphone(String customerphone) {
		this.customerphone = customerphone;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getFuzzy() {
		return fuzzy;
	}

	public void setFuzzy(String fuzzy) {
		this.fuzzy = fuzzy;
	}

	public String getId_list() {
		return id_list;
	}

	public void setId_list(String id_list) {
		this.id_list = id_list;
	}

	public int getOrderby() {
		return orderby;
	}

	public void setOrderby(int orderby) {
		this.orderby = orderby;
	}

	public String getSearchbyfuzzy() {
		return searchbyfuzzy;
	}

	public void setSearchbyfuzzy(String searchbyfuzzy) {
		this.searchbyfuzzy = searchbyfuzzy;
	}

	public String getFuzzystring() {
		return fuzzystring;
	}

	public void setFuzzystring(String fuzzystring) {
		this.fuzzystring = fuzzystring;
	}
	
	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getProductByServiceProject(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		int total = 0;
		List<ServiceProduct> product = new ArrayList<ServiceProduct>();
		if(sp_id > 0){
			product = serviceProductDao.findServiceProductByProgectIdAndNum(sp_id,number,start);
			total = serviceProductDao.findServiceProductByProgectIdAndNum(sp_id,0,0).size();
		}
		httpRequest.setAttribute("get_by_product_id", sp_id);
		httpRequest.setAttribute("service_product", product);
		httpRequest.setAttribute("total_product", total);
		
		ServiceProject serviceProject = serviceProjectDao.getServiceProjectById(sp_id);
		if(serviceProject.getServiceClass().getId() == 1){
			return "success1";	
		}
		if(serviceProject.getServiceClass().getId() == 3){
			return "success2";	
		}
		if(serviceProject.getServiceClass().getId() == 5){
			return "success3";	
		}
		if(serviceProject.getServiceClass().getId() == 7){
			return "success4";	
		}
		return "success";
	}
	
	public String getProductByOrder(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		int total = 0;
		String order = "";
		List<ServiceProduct> product = new ArrayList<ServiceProduct>();
		
		if(orderby == 1){
			order = "id";
		}
		if(orderby == 2){
			order = "updateTime";
		}
		if(orderby == 3){
			order = "newprice";
		}
//		if(orderby == 4){
//			
//		}
		if(null != searchbyfuzzy && searchbyfuzzy.equals("1")){
			product = serviceProductDao.findServiceProductByFuzzyAndNumAndOrder(fuzzystring,number,start,order);
			total = serviceProductDao.findServiceProductByFuzzyAndNumAndOrder(fuzzystring,0,0,order).size();
			
			httpRequest.setAttribute("searchbyfuzzy", "0");
			httpRequest.setAttribute("fuzzystring", fuzzy);
		}else{
			if(sp_id > 0){
				product = serviceProductDao.findServiceProductByOrder(sp_id,number,start,order);
				total = serviceProductDao.findServiceProductByOrder(sp_id,0,0,order).size();
			}
			
			httpRequest.setAttribute("searchbyfuzzy", "1");
		}
		httpRequest.setAttribute("product_order", orderby);
		httpRequest.setAttribute("get_by_product_id", sp_id);
		httpRequest.setAttribute("service_product", product);
		httpRequest.setAttribute("total_product", total);
		
		ServiceProject serviceProject = serviceProjectDao.getServiceProjectById(sp_id);
		if(serviceProject.getServiceClass().getId() == 1){
			return "success1";	
		}
		if(serviceProject.getServiceClass().getId() == 3){
			return "success2";	
		}
		if(serviceProject.getServiceClass().getId() == 5){
			return "success3";	
		}
		if(serviceProject.getServiceClass().getId() == 7){
			return "success4";	
		}
		return "success";
	}
	
	public String getProductByPage(){
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		List<ServiceProduct> product_list = null;
		
		if(null != searchbyfuzzy && searchbyfuzzy.equals("1")){
			if(orderby > 0){
				if(orderby == 1){
					product_list = serviceProductDao.findServiceProductByFuzzyAndNumAndOrder(fuzzystring,number,start,"id");
				}
				if(orderby == 2){
					product_list = serviceProductDao.findServiceProductByFuzzyAndNumAndOrder(fuzzystring,number,start,"updateTime");
				}
				if(orderby == 3){
					product_list = serviceProductDao.findServiceProductByFuzzyAndNumAndOrder(fuzzystring,number,start,"newprice");
				}
			}else{
				product_list = serviceProductDao.findServiceProductByFuzzyAndNum(fuzzystring,number,start);
			}
		}else{
			if(orderby > 0){
				if(orderby == 1){
					product_list = serviceProductDao.findServiceProductByOrder(sp_id,number,start,"id");
				}
				if(orderby == 2){
					product_list = serviceProductDao.findServiceProductByOrder(sp_id,number,start,"updateTime");
				}
				if(orderby == 3){
					product_list = serviceProductDao.findServiceProductByOrder(sp_id,number,start,"newprice");
				}
			}else{
				product_list = serviceProductDao.findServiceProductByProgectIdAndNum(sp_id,number,start);
			}
		}
		ServiceProject serviceProject = serviceProjectDao.getServiceProjectById(sp_id);
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		StringBuilder html = new StringBuilder("");
		DecimalFormat df=new DecimalFormat("######0.00");
		
		if(serviceProject.getServiceClass().getId() == 1){
			for(int i = 0;i < product_list.size();i ++){
				int star = 0;
				for(int j = 0;j < product_list.get(i).getComments().size();j ++){
					star = star + product_list.get(i).getComments().get(j).getStar();
				}
				if(product_list.get(i).getComments().size() != 0){
					star = star / product_list.get(i).getComments().size();
				}
				
				html.append("<tr style=\"border-bottom: 1px solid #e1e1e1;\"><td style=\"width: 40%\">");
				if(null != product_list.get(i).getIcon() && product_list.get(i).getIcon().length() > 0){
					html.append("<img src=\"" + httpRequest.getContextPath() + "/common/displayPic?imagePath=" + smartProp.getImgPath() + product_list.get(i).getPath() + "&imageName=" + product_list.get(i).getIcon());
				}else{
					html.append("<img src=\"" + httpRequest.getContextPath() + "/img/hx_default.png\">");
				}
				html.append("</td><td style=\"width: 60%\"><table><tbody><tr><td colspan=\"2\">");
				html.append(product_list.get(i).getTitle() + "</td></tr><tr><td colspan=\"2\">");
				html.append(product_list.get(i).getAbstract_() + "</td></tr><tr><td style=\"width: 30%\">");
				for(int k = 0;k < star;k ++){
					html.append("<img src=\"" + httpRequest.getContextPath() +"/img/star_1.png\" style=\"width:18px;height:16px;\">");
				}
				for(int o = 0;o < 5 - star;o ++){
					html.append("<img src=\"" + httpRequest.getContextPath() +"/img/star_2.png\" style=\"width:18px;height:16px;\">");
				}
				html.append("</td><td><span>" + product_list.get(i).getOrders().size() + "人已经选购</span>");
				html.append("</td></tr><tr><td><span class=\"price1\">¥ " + df.format(product_list.get(i).getNewprice()) + "</span>");
				html.append("<span class=\"price2\">¥" + df.format(product_list.get(i).getOldprice()) + "</span></td><td>");
				html.append("<a href=\"javascript:void(0)\" onclick=\"\">加入服务车</a></td></tr></tbody></table></td></tr>");
			}
		}else{
			html.append("<tbody>");
			for(int i = 0;i < product_list.size();i ++){
				int star1 = 0;
				for(int j = 0;j < product_list.get(i).getComments().size();j ++){
					star1 = star1 + product_list.get(i).getComments().get(j).getStar();
				}
				if(product_list.get(i).getComments().size() != 0){
					star1 = star1 / product_list.get(i).getComments().size();
				}
				html.append("<tr>");
				html.append("<td class=\"td1\"><table><tbody><tr><td colspan=\"2\">");
				if(null != product_list.get(i).getIcon() && product_list.get(i).getIcon().length() > 0){
					html.append("<img src=\"" + httpRequest.getContextPath() + "/common/displayPic?imagePath=" + smartProp.getImgPath() + product_list.get(i).getPath() + "&imageName=" + product_list.get(i).getIcon() + " style=\"width:100%;height:100%;\">");
				}else{
					html.append("<img src=\"" + httpRequest.getContextPath() + "/img/hx_default.png\" style=\"width:100%;height:100%;\">");
				}
				html.append("</td></tr><tr><td colspan=\"2\">" + product_list.get(i).getTitle() + "</td></tr>");
				html.append("<tr><td colspan=\"2\">" + product_list.get(i).getAbstract_() + "</td></tr><tr><td>");
				for(int k = 0;k < star1;k ++){
					html.append("<img src=\"" + httpRequest.getContextPath() +"/img/star_1.png\" style=\"width:18px;height:16px;\">");
				}
				for(int o = 0;o < 5 - star1;o ++){
					html.append("<img src=\"" + httpRequest.getContextPath() +"/img/star_2.png\" style=\"width:18px;height:16px;\">");
				}
				html.append("</td><td class=\"addtocart\"><span>" + product_list.get(i).getOrders().size() + "人已经选购</span></td></tr>");
				html.append("<tr><td><span class=\"price1\">¥ " + df.format(product_list.get(i).getNewprice()) + "</span>");
				html.append("<span class=\"price2\">¥ " + df.format(product_list.get(i).getOldprice()) + "</span></td>");
				html.append("<td class=\"addtocart\"><a href=\"javascript:void(0)\">加入服务车</a></td></tr></tbody></table></td>");
				if(i + 1 < product_list.size()){
					int star2 = 0;
					for(int j = 0;j < product_list.get(i + 1).getComments().size();j ++){
						star2 = star2 + product_list.get(i + 1).getComments().get(j).getStar();
					}
					if(product_list.get(i + 1).getComments().size() != 0){
						star2 = star2 / product_list.get(i + 1).getComments().size();
					}
					html.append("<td class=\"td2\"><table><tbody><tr><td colspan=\"2\">");
					if(null != product_list.get(i + 1).getIcon() && product_list.get(i + 1).getIcon().length() > 0){
						html.append("<img src=\"" + httpRequest.getContextPath() + "/common/displayPic?imagePath=" + smartProp.getImgPath() + product_list.get(i + 1).getPath() + "&imageName=" + product_list.get(i + 1).getIcon() + " style=\"width:100%;height:100%;\">");
					}else{
						html.append("<img src=\"" + httpRequest.getContextPath() + "/img/hx_default.png\" style=\"width:100%;height:100%;\">");
					}
					html.append("</td></tr><tr><td colspan=\"2\">" + product_list.get(i + 1).getTitle() + "</td></tr>");
					html.append("<tr><td colspan=\"2\">" + product_list.get(i + 1).getAbstract_() + "</td></tr><tr><td>");
					for(int k = 0;k < star1;k ++){
						html.append("<img src=\"" + httpRequest.getContextPath() +"/img/star_1.png\" style=\"width:18px;height:16px;\">");
					}
					for(int o = 0;o < 5 - star1;o ++){
						html.append("<img src=\"" + httpRequest.getContextPath() +"/img/star_2.png\" style=\"width:18px;height:16px;\">");
					}
					html.append("</td><td class=\"addtocart\"><span>" + product_list.get(i + 1).getOrders().size() + "人已经选购</span></td></tr>");
					html.append("<tr><td><span class=\"price1\">¥ " + df.format(product_list.get(i + 1).getNewprice()) + "</span>");
					html.append("<span class=\"price2\">¥ " + df.format(product_list.get(i + 1).getOldprice()) + "</span></td>");
					html.append("<td class=\"addtocart\"><a href=\"javascript:void(0)\">加入服务车</a></td></tr></tbody></table></td>");
				}
				if(i + 2 < product_list.size()){
					int star3 = 0;
					for(int j = 0;j < product_list.get(i + 2).getComments().size();j ++){
						star3 = star3 + product_list.get(i + 2).getComments().get(j).getStar();
					}
					if(product_list.get(i + 2).getComments().size() != 0){
						star3 = star3 / product_list.get(i + 2).getComments().size();
					}
					html.append("<td class=\"td3\"><table><tbody><tr><td colspan=\"2\">");
					if(null != product_list.get(i + 2).getIcon() && product_list.get(i + 2).getIcon().length() > 0){
						html.append("<img src=\"" + httpRequest.getContextPath() + "/common/displayPic?imagePath=" + smartProp.getImgPath() + product_list.get(i + 2).getPath() + "&imageName=" + product_list.get(i + 2).getIcon() + " style=\"width:100%;height:100%;\">");
					}else{
						html.append("<img src=\"" + httpRequest.getContextPath() + "/img/hx_default.png\" style=\"width:100%;height:100%;\">");
					}
					html.append("</td></tr><tr><td colspan=\"2\">" + product_list.get(i + 2).getTitle() + "</td></tr>");
					html.append("<tr><td colspan=\"2\">" + product_list.get(i + 2).getAbstract_() + "</td></tr><tr><td>");
					for(int k = 0;k < star1;k ++){
						html.append("<img src=\"" + httpRequest.getContextPath() +"/img/star_1.png\" style=\"width:18px;height:16px;\">");
					}
					for(int o = 0;o < 5 - star1;o ++){
						html.append("<img src=\"" + httpRequest.getContextPath() +"/img/star_2.png\" style=\"width:18px;height:16px;\">");
					}
					html.append("</td><td class=\"addtocart\"><span>" + product_list.get(i + 2).getOrders().size() + "人已经选购</span></td></tr>");
					html.append("<tr><td><span class=\"price1\">¥ " + df.format(product_list.get(i + 2).getNewprice()) + "</span>");
					html.append("<span class=\"price2\">¥ " + df.format(product_list.get(i + 2).getOldprice()) + "</span></td>");
					html.append("<td class=\"addtocart\"><a href=\"javascript:void(0)\">加入服务车</a></td></tr></tbody></table></td>");
				}
				html.append("</tr>");
				i = i + 2;
			}
			html.append("</tbody>");
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
	
	public String getProductInfo(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		ServiceProduct product = serviceProductDao.findServiceProductById(pid);
		httpRequest.setAttribute("product_info", product);
		
		return "success";
	}
	
	@SuppressWarnings("unchecked")
	public String addProductToCart(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		User user = (User)httpRequest.getSession().getAttribute("user");
		Company company = (Company)httpRequest.getSession().getAttribute("company");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		
		
		ArrayList<MyCart> in_list = null;
		in_list = (ArrayList<MyCart>)httpRequest.getSession().getAttribute("ProductInCart");
		List<Integer> pid_list = new ArrayList<Integer>();
		ServiceProduct project = serviceProductDao.findServiceProductById(sp_id);
		MyCart new_cart = new MyCart();
		
		if(in_list == null){
			in_list = new ArrayList<MyCart>();
			if(null != project){
				new_cart.setNum(number);
				new_cart.setServiceProduct(project);
				if(null != user){
					new_cart.setUser(user);
				}
				if(null != company){
					new_cart.setCompany(company);
				}
				in_list.add(new_cart);
				ret.put("addtocart", true);
			}
		}else{
			if(in_list.size() == 0){
				if(null != project){
					new_cart.setNum(number);
					new_cart.setServiceProduct(project);
					if(null != user){
						new_cart.setUser(user);
					}
					if(null != company){
						new_cart.setCompany(company);
					}
					in_list.add(new_cart);
					ret.put("addtocart", true);
				}
			}else{
				for(int i = 0;i < in_list.size();i ++){
					pid_list.add(in_list.get(i).getServiceProduct().getId());
				}
				if(!pid_list.contains(sp_id)){
					new_cart.setNum(number);
					new_cart.setServiceProduct(project);
					if(null != user){
						new_cart.setUser(user);
					}
					if(null != company){
						new_cart.setCompany(company);
					}
					in_list.add(new_cart);
					ret.put("addtocart", true);
				}else{
					for (int i = 0; i < in_list.size(); i++) {
						if(sp_id == in_list.get(i).getServiceProduct().getId()){
							if(number != in_list.get(i).getNum()){
								in_list.remove(i);
								new_cart.setNum(number);
								new_cart.setServiceProduct(project);
								if(null != user){
									new_cart.setUser(user);
								}
								if(null != company){
									new_cart.setCompany(company);
								}
								in_list.add(i, new_cart);
								ret.put("addtocart", true);
								break;
							}else{
								ret.put("addtocart", false);
							}
						}
					}
					
				}
			}
		}
		if(null != user){
			List<MyCart> my_list = myCartDao.findMyCartByUser(user.getId());
			pid_list.clear();
			for(int i = 0;i < my_list.size();i ++){
				pid_list.add(my_list.get(i).getServiceProduct().getId());
			}
			if(!pid_list.contains(sp_id)){
				new_cart.setNum(number);
				new_cart.setServiceProduct(project);
				new_cart.setUser(user);
				myCartDao.saveNewMyCart(new_cart);
			}else{
				new_cart = myCartDao.findMyCartByUserAndProduct(user.getId(),sp_id);
				if(number != new_cart.getNum()){
					new_cart.setNum(number);
					myCartDao.saveMyCart(new_cart);
				}
			}
		}
		if(null != company){
			List<MyCart> my_list = myCartDao.findMyCartByCompany(company.getId());
			pid_list.clear();
			for(int i = 0;i < my_list.size();i ++){
				pid_list.add(my_list.get(i).getServiceProduct().getId());
			}
			if(!pid_list.contains(sp_id)){
				new_cart.setNum(number);
				new_cart.setServiceProduct(project);
				new_cart.setCompany(company);
				myCartDao.saveNewMyCart(new_cart);
			}else{
				new_cart = myCartDao.findMyCartByCompanyAndProduct(company.getId(),sp_id);
				if(number != new_cart.getNum()){
					new_cart.setNum(number);
					myCartDao.saveMyCart(new_cart);
				}
			}
		}
		httpRequest.getSession().setAttribute("ProductInCart", in_list);
		
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
	public String deleteProductFromMyCart(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		User user = (User)httpRequest.getSession().getAttribute("user");
		Company company = (Company)httpRequest.getSession().getAttribute("company");
		
		List<MyCart> in_list = (List<MyCart>)httpRequest.getSession().getAttribute("ProductInCart");
		for(int i = 0;i < in_list.size();i ++){
			if(sp_id == in_list.get(i).getServiceProduct().getId()){
				if(null != user){
					myCartDao.deleteMyCartByUser(user.getId(), sp_id);
				}
				if(null != company){
					myCartDao.deleteMyCartByCompany(company.getId(), sp_id);
				}
				
				in_list.remove(i);
				ret.put("delfromcart", true);
				break;
			}
		}
		httpRequest.getSession().setAttribute("ProductInCart",in_list);
		
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
	public String deleteAllProductFromMyCart(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		List<MyCart> in_list = (List<MyCart>)httpRequest.getSession().getAttribute("ProductInCart");
		User user = (User)httpRequest.getSession().getAttribute("user");
		Company company = (Company)httpRequest.getSession().getAttribute("company");
		
		if(null != in_list){
			int clear = 0;
			if(null != user){
				clear = myCartDao.clearMyCartByUser(user.getId());
			}
			if(null != company){
				clear = myCartDao.clearMyCartByCompany(company.getId());
			}
			
			in_list.clear();
			if(in_list.size() == 0 || clear > 0){
				ret.put("delall", true);
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
	public String changeMyCartProductNumber(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		DecimalFormat df=new DecimalFormat("######0.00");
		List<MyCart> in_list = (List<MyCart>)httpRequest.getSession().getAttribute("ProductInCart");
		ServiceProduct project = serviceProductDao.findServiceProductById(sp_id);
		double total = 0;
		
		if(null != in_list){
			for(int i = 0;i < in_list.size();i ++){
				if(sp_id == in_list.get(i).getServiceProduct().getId()){
					int cart_id = in_list.get(i).getId();
					in_list.remove(i);
					MyCart new_cart = new MyCart();
					new_cart.setId(cart_id);
					new_cart.setNum(number);
					new_cart.setServiceProduct(project);
					in_list.add(i, new_cart);
					break;
				}
			}
			for(int i = 0;i < in_list.size();i ++){
				total = total + in_list.get(i).getServiceProduct().getNewprice() * in_list.get(i).getNum();
			}
		}
		httpRequest.getSession().setAttribute("ProductInCart",in_list);
		ret.put("addtocart", true);
		ret.put("price", "¥" + df.format(project.getNewprice() * number));
		ret.put("total", "¥" + df.format(total));
		
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
	public String setMarkerArr(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONArray ret = new JSONArray();
		List<MyCart> in_list = (List<MyCart>)httpRequest.getSession().getAttribute("ProductInCart");
		List<ServiceProduct> product = new ArrayList<ServiceProduct>();
		List<ServiceShop> shops = serviceShopDao.findAllServiceShop();
		List<ServiceShop> shop_list = new ArrayList<ServiceShop>();
		String nowcity = (String)httpRequest.getSession().getAttribute("setcity");
		String setprovince = "";
		
		if(null != province && province.length() > 0){
			try {
				province = java.net.URLDecoder.decode(province,"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			setprovince = province;
			nowcity = "";
		}else{
			if(null != city && city.length() > 0){
				try {
					city = java.net.URLDecoder.decode(city,"UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				nowcity = city;
			}
		}
		if(nowcity.length() > 0){
			shops = serviceShopDao.findServiceShopByCity(nowcity);
		}else{
			if(setprovince.length() > 0){
				shops = serviceShopDao.findServiceShopByProvince(setprovince);
			}
		}
		if(null != in_list){
			for(int i = 0;i < in_list.size();i ++){
				product.add(in_list.get(i).getServiceProduct());
			}
		}
		for(int i = 0;i < shops.size();i ++){
			boolean isok = true;
			List<Integer> product1 = new ArrayList<Integer>();
			for(int j = 0;j < shops.get(i).getServiceshopServices().size();j ++){
				product1.add(shops.get(i).getServiceshopServices().get(j).getServiceProduct().getId());
			}
			for(int k = 0;k < product.size();k ++){
				if(!product1.contains(product.get(k).getId())){
					isok = false;
					break;
				}
				
			}
			if(isok){
				shop_list.add(shops.get(i));
			}
		}
		
		for(int i = 0;i < shop_list.size();i ++){
			JSONObject map =  new JSONObject();
			map.put("PKID", shop_list.get(i).getId());
			map.put("CarparName", shop_list.get(i).getTitle());
			map.put("point", String.valueOf(shop_list.get(i).getLongitude()) + "," + String.valueOf(shop_list.get(i).getLatitude()));
			String county = "";
			if(null != shop_list.get(i).getAreaDetail()){
				county = shop_list.get(i).getAreaDetail().getCounty();
			}
			map.put("AddressBrief", shop_list.get(i).getAreaDetail().getCity() + county + shop_list.get(i).getAddress());
			map.put("City", shop_list.get(i).getAreaDetail().getCity());
			map.put("District", county);
			map.put("Province", shop_list.get(i).getAreaDetail().getProvince());
			double position[] = new double[2];
			position[0] = shop_list.get(i).getLongitude();
			position[1] = shop_list.get(i).getLatitude();
			
			map.put("Position",position);
			map.put("ShopType", 1);
			
			ret.add(map);
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
	public String getServiceShopByCity(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		if(null != city && city.length() > 0){
			try {
				city = java.net.URLDecoder.decode(city,"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		List<MyCart> in_list = (List<MyCart>)httpRequest.getSession().getAttribute("ProductInCart");
		List<ServiceShop> shops = serviceShopDao.findServiceShopByCity(city);
		List<ServiceProduct> product = new ArrayList<ServiceProduct>();
		List<ServiceShop> shop_list = new ArrayList<ServiceShop>();
		StringBuilder html = new StringBuilder();
		
		if(null != in_list){
			for(int i = 0;i < in_list.size();i ++){
				product.add(in_list.get(i).getServiceProduct());
			}
		}
		for(int i = 0;i < shops.size();i ++){
			boolean isok = true;
			List<Integer> product1 = new ArrayList<Integer>();
			for(int j = 0;j < shops.get(i).getServiceshopServices().size();j ++){
				product1.add(shops.get(i).getServiceshopServices().get(j).getServiceProduct().getId());
			}
			for(int k = 0;k < product.size();k ++){
				if(!product1.contains(product.get(k).getId())){
					isok = false;
					break;
				}
				
			}
			if(isok && !shops.get(i).getPhone().contains("@#del")){
				shop_list.add(shops.get(i));
			}
		}
		
		for(int i = 0;i < shop_list.size();i ++){
			List<Comment> comment_list = shop_list.get(i).getComments();
			List<Order> order_list = shop_list.get(i).getOrders();
			int order = 0;
			int star = 0;
			String serialnumber = "";
			for(int j = 0;j < order_list.size();j ++){
				if(serialnumber != order_list.get(j).getSerialnumber()){
					order ++;
					serialnumber = order_list.get(j).getSerialnumber();
				}else{
					continue;
				}
			}
			for(int j = 0;j < comment_list.size();j ++){
				star = star + comment_list.get(j).getStar();
			}
			if(star != 0){
				star = star / comment_list.size();
			}
			
			html.append("<li class=\"select_after\"><div class=\"comm_item\"><span class=\"itema\">");
			html.append(shop_list.get(i).getTitle() + "</span><span class=\"item_fen\">" + star + "分<span>(安装" + order + "单)</span></span>");
			html.append("<span class=\"itemb\">" + shop_list.get(i).getAreaDetail().getProvince() + shop_list.get(i).getAreaDetail().getCity() + shop_list.get(i).getAreaDetail().getCounty() + shop_list.get(i).getAddress());
			html.append("</span></div> <a class=\"item_xiugai\" data-id=\"" + shop_list.get(i).getId() + "\" onclick=\"selectShop(this)\">选择</a></li>");
		}
		ret.put("html", html.toString());
		ret.put("total", shop_list.size());
		
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
	public String creatOrder(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		DecimalFormat df=new DecimalFormat("######0.00");
		User user = (User)httpRequest.getSession().getAttribute("user");
		Company company = (Company)httpRequest.getSession().getAttribute("company");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		List<MyCart> new_list = (List<MyCart>)httpRequest.getSession().getAttribute("ProductInCart");
		List<MyCart> in_list = new ArrayList<MyCart>();
		ServiceShop shop = serviceShopDao.findServiceShopById(sid);
		double total = 0;
		List<Integer> list_id = new ArrayList<Integer>();
		if(null != id_list){
			String[] str_id = id_list.split(",");
			for(int i = 0;i < str_id.length;i ++){
				if(str_id[i].length() > 0){
					list_id.add(Integer.parseInt(str_id[i]));
				}
			}
			for(int i = 0;i < new_list.size();i ++){
				if(list_id.contains(new_list.get(i).getId())){
					in_list.add(new_list.get(i));
				}
			}
		}else{
			in_list.addAll(new_list);
		}
		
		
		boolean isused = false;
		for(int i = 0;i < in_list.size();i ++){
			double price =in_list.get(i).getServiceProduct().getNewprice() * in_list.get(i).getNum();
			double web_price =in_list.get(i).getServiceProduct().getWeb_price() * in_list.get(i).getNum();

			Order new_order = new Order();
			if(null != shop){
				new_order.setServiceShop(shop);
			}
			new_order.setSerialnumber(serialnumber);
			new_order.setServiceProduct(in_list.get(i).getServiceProduct());
			if(null != user){
				new_order.setUser(user);
				new_order.setType(0);
			}
			if(null != company){
				new_order.setCompany(company);
				new_order.setType(1);
				
				double money = 0;
				if(uc_id != 0){
					if(!isused){
						UserCoupon uc = userCouponDao.find(uc_id);
						money = uc.getCoupon().getMoney();
						price = price - money;
						isused = true;
					}
				}
			}
			total = total + price;
			new_order.setNumber(in_list.get(i).getNum());
			if(uc_id == 0){
				new_order.setPrice(in_list.get(i).getServiceProduct().getNewprice());
				new_order.setPaid(in_list.get(i).getServiceProduct().getNewprice() * in_list.get(i).getNum());
				new_order.setWeb_price(in_list.get(i).getServiceProduct().getWeb_price());
				new_order.setWeb_price_total(in_list.get(i).getServiceProduct().getWeb_price() * in_list.get(i).getNum());
			}else{
				new_order.setPrice(in_list.get(i).getServiceProduct().getNewprice());
				new_order.setPaid(price);
				new_order.setWeb_price(in_list.get(i).getServiceProduct().getWeb_price());
				new_order.setWeb_price_total(web_price);
			}
			PaidType paidtype = paidTypeDao.findPaidTypeById(1);
			new_order.setPaidType(paidtype);
			new_order.setCreatedTime(new Date());
			new_order.setUpdateTime(new Date());
			new_order.setState(0);
			new_order.setCustomername("");
			new_order.setCustomerphone("");
			orderDao.saveNewOrder(new_order);
			
			CorpOrderNumber corp = new CorpOrderNumber();
			corp.setOrder(new_order);
			corp.setTotal(new_order.getNumber());
			corp.setUsed(0);
			corpOrderNumberDao.saveNewCorpOrderNumber(corp);
		}
		
		httpRequest.getSession().setAttribute("paid_serialnumber", serialnumber);
		httpRequest.getSession().setAttribute("paid_total", df.format(total));
		List<Order> order_list = orderDao.findOrderBySerialnumber(serialnumber);
		boolean ispaid = false;
		if(null != company){
			double balance = 0;
			if(company.getBalance().length() > 0){
				balance = Double.parseDouble(company.getBalance());
			}
			if(balance > total){
				balance = balance - total;
				company.setBalance(String.valueOf(balance));
				companyDao.saveCompany(company);
				ispaid = true;
				for(MyCart m:in_list){
					myCartDao.deleteMyCartByCompany(company.getId(), m.getServiceProduct().getId());
				}
				ret.put("url", httpRequest.getContextPath() + "/submitorder2.jsp");
			}else{
				ret.put("url", httpRequest.getContextPath() + "/submitorder3.jsp");
			}
		}
		if(null != user){
			ret.put("url", httpRequest.getContextPath() + "/submitorder1.jsp");
		}
		if(ispaid){
			for(int i = 0;i < order_list.size();i ++){
				order_list.get(i).setState(1);
				orderDao.saveOrder(order_list.get(i));
			}
		}

		httpRequest.getSession().setAttribute("ProductInCart",null);
		MyCartDao myCartDao = (MyCartDao) SpringUtils.getBean(MyCartDao.class);

		if (company != null) {
			httpRequest.getSession().setAttribute("ProductInCart", myCartDao.findMyCartByCompany(company.getId()));
		} else if (user != null) {
			httpRequest.getSession().setAttribute("ProductInCart", myCartDao.findMyCartByUser(user.getId()));
		}


		ret.put("add", true);
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
	
	public String changeOrderState(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		int id  = 0;
		User user = (User)httpRequest.getSession().getAttribute("user");
		Company company = (Company)httpRequest.getSession().getAttribute("company");
		Order changeorder = null;
		if(null != user){
			id = user.getId();
			changeorder = orderDao.findOrderBySerialnumberAndProductAndUser(serialnumber, sp_id, id);
		}
		if(null != company){
			id = company.getId();
			changeorder = orderDao.findOrderBySerialnumberAndProductAndCompany(serialnumber, sp_id, id);
		}
		
		
		if(state != 0){
			changeorder.setState(state);
			orderDao.saveOrder(changeorder);
		}
		
		ret.put("change", "ok");
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
	
	public String useCompanyOrder(){
		return null;
	}
	
	public String getOrderByServiceAndPage(){
//		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		DecimalFormat df_money=new DecimalFormat("######0.00");
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		
		StringBuilder html = new StringBuilder();
		List<Order> order_list = orderDao.findOrderByServiceShopAndStateAndPage(sid, state, number, start);
		for(int i = 0;i < order_list.size();i ++){
			html.append("<tr><td><a href=\"javascript:void(0)\">" + order_list.get(i).getSerialnumber() + "</a></td>");
			html.append("<td>" + order_list.get(i).getServiceProduct().getServiceProject().getServiceClass().getName() + "</td>");
			html.append("<td>" + order_list.get(i).getServiceProduct().getServiceProject().getName() + "</td>");
			html.append("<td>" + df.format(order_list.get(i).getCreatedTime()) + "</td>");
			html.append("<td>" + df_money.format(order_list.get(i).getPaid()) + "</td>");
			html.append("<td>" + order_list.get(i).getNumber() + "</td>");
			html.append("<td>已付费</td><td>");
			if(null != order_list.get(i).getUser()){
				html.append(order_list.get(i).getUser().getName());
			}else{
                if(null != order_list.get(i).getCompany()){
                    String showname = "";
                    if(null != order_list.get(i).getCustomername() && order_list.get(i).getCustomername().length() > 0){
                        showname = order_list.get(i).getCustomername();
                    }else{
                        showname = order_list.get(i).getCompany().getCompany();
                    }
			html.append(showname);
                }
			}
			html.append("<td style=\"text-align: center;\">");
			html.append("<a href=\"javascript:void(0)\" class=\"ui-button ui-widget ui-state-default ui-corner-all\" onclick=\"checkService('" + order_list.get(i).getSerialnumber() + "','" + order_list.get(i).getServiceShop().getId() + "','线上支付')\">服务确认</a>");
			html.append("</td>");
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
	
	public String searchOrderBySerialnumber(){
		DecimalFormat df_money=new DecimalFormat("######0.00");
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		
		StringBuilder html = new StringBuilder();
		List<Order> order_list = orderDao.findOrderBySerialnumber(serialnumber);
		for(int i = 0;i < order_list.size();i ++){
			html.append("<tr><td><a href=\"javascript:void(0)\">" + order_list.get(i).getSerialnumber() + "</a></td>");
			html.append("<td>" + order_list.get(i).getServiceProduct().getServiceProject().getServiceClass().getName() + "</td>");
			html.append("<td>" + order_list.get(i).getServiceProduct().getServiceProject().getName() + "</td>");
			html.append("<td>" + df.format(order_list.get(i).getCreatedTime()) + "</td>");
			html.append("<td>" + df_money.format(order_list.get(i).getPaid()) + "</td>");
			html.append("<td>" + order_list.get(i).getNumber() + "</td>");
			html.append("<td>已付费</td><td>");
			if(null != order_list.get(i).getUser()){
				html.append(order_list.get(i).getUser().getName());
			}else{
                if(null != order_list.get(i).getCompany()){
                    String showname = "";
                    if(null != order_list.get(i).getCustomername() && order_list.get(i).getCustomername().length() > 0){
                        showname = order_list.get(i).getCustomername();
                    }else{
                        showname = order_list.get(i).getCompany().getCompany();
                    }
			html.append(showname);
                }
			}
			if(haveaction == 1){
				html.append("<td style=\"text-align: center;\">");
				html.append("<a href=\"javascript:void(0)\" class=\"ui-button ui-widget ui-state-default ui-corner-all\" onclick=\"checkService('" + order_list.get(i).getSerialnumber() + "','" + order_list.get(i).getServiceShop().getId() + "','线上支付')\">服务确认</a>");
				html.append("</td>");
			}
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
	
	public String getOrderBySomething(){
		DecimalFormat df_money=new DecimalFormat("######0.00");
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		
		String searchdate = "";
		String name = "";
		String products = "";
		String status = "";
		String money = "";
		String searchtype = "";
		String searchowner = "";
		
		if(null != deliveryDate && deliveryDate.length() > 0){
			searchdate = deliveryDate;
		}
		if(null != userName && userName.length() > 0){
			try {
				userName = java.net.URLDecoder.decode(userName,"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			name = userName;
		}
		if(null != orderProducts && orderProducts.length() > 0){
			try {
				orderProducts = java.net.URLDecoder.decode(orderProducts,"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			products = orderProducts;
		}
		if(null != sumMoney && sumMoney.length() > 0){
			try {
				sumMoney = java.net.URLDecoder.decode(sumMoney,"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			money = sumMoney;
		}
		if(null != orderStatus && orderStatus.length() > 0){
			try {
				orderStatus = java.net.URLDecoder.decode(orderStatus,"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			status = orderStatus;
		}
		if(null != owner && owner.length() > 0){
			try {
				owner = java.net.URLDecoder.decode(owner,"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			searchowner = owner;
		}
		if(null != orderType && orderType.length() > 0){
			try {
				orderType = java.net.URLDecoder.decode(orderType,"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			searchtype = orderType;
		}
		
		List<Order> order_list = orderDao.findOrderBySomething(sid, searchdate, name, products, status, money, searchtype, searchowner);
		StringBuilder html = new StringBuilder();
		for(int i = 0;i < order_list.size();i ++){
			html.append("<tr><td><a href=\"javascript:void(0)\">" + order_list.get(i).getSerialnumber() + "</a></td>");
			html.append("<td>" + order_list.get(i).getServiceProduct().getServiceProject().getServiceClass().getName() + "</td>");
			html.append("<td>" + order_list.get(i).getServiceProduct().getServiceProject().getName() + "</td>");
			html.append("<td>" + df.format(order_list.get(i).getCreatedTime()) + "</td>");
			html.append("<td>" + df_money.format(order_list.get(i).getPaid()) + "</td>");
			html.append("<td>" + order_list.get(i).getNumber() + "</td>");
			html.append("<td>已付费</td><td>");
			if(null != order_list.get(i).getUser()){
				html.append(order_list.get(i).getUser().getName());
			}else{
                if(null != order_list.get(i).getCompany()){
                    String showname = "";
                    if(null != order_list.get(i).getCustomername() && order_list.get(i).getCustomername().length() > 0){
                        showname = order_list.get(i).getCustomername();
                    }else{
                        showname = order_list.get(i).getCompany().getCompany();
                    }
			html.append(showname);
                }
			}
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
	
	public String deleteShopManage(){
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		if(sid==0 || sp_id==0){
			ret.put("success", "1");
		}
		int success = serviceshopServiceDao.deleteServiceshopServiceByService(sid, sp_id);
		if(success > 0){
			ret.put("success", "0");
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
	
	public String saveShopManage(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		ServiceShop shop_user = (ServiceShop)httpRequest.getSession().getAttribute("shopuser");
		List<Integer> spid = new ArrayList<Integer>();
		if(null != set_spid && set_spid.length() > 0){
			String[] string_spid = set_spid.split(",");
			for(int i = 0;i < string_spid.length;i ++){
				if(string_spid[i].length() > 0){
					spid.add(Integer.parseInt(string_spid[i]));
				}
			}
		}
		boolean ishave = true;
		
		for(int i = 0;i < spid.size();i ++){
			ServiceshopService shop_Service = serviceshopServiceDao.find(shop_user.getId(), spid.get(i));
			if(null == shop_Service){
				ServiceProduct product = serviceProductDao.findServiceProductById(spid.get(i));
				ServiceshopService shopService = new ServiceshopService();
				shopService.setServiceProduct(product);
				shopService.setServiceshop(shop_user);
				serviceshopServiceDao.saveNewServiceshopService(shopService);
				ishave = false;
			}
		}
		if(ishave){
			ret.put("success", "1");
		}else{
			ret.put("success", "0");
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
	
	public String getServiceProjectbyClassid(){
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		StringBuilder html = new StringBuilder();
		List<ServiceProject> project = serviceProjectDao.getProjectsByClsId(sc_id);
		html.append("<option></option>");
		for(int i = 0;i < project.size();i ++){
			html.append("<option value='" + project.get(i).getId() + "'>" + project.get(i).getName() + "</option>");
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
	
	public String getServiceProductByProject(){
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		StringBuilder html = new StringBuilder();
		List<ServiceProduct> product = serviceProductDao.getProductsByProjId(sp_id);
		html.append("<option></option>");
		for(int i = 0;i < product.size();i ++){
			html.append("<option value='" + product.get(i).getId() + "'>" + product.get(i).getTitle() + "</option>");
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
	
	public String getOrderByYear(){
		HttpServletRequest httpRquest = ServletActionContext.getRequest();
		int num = 0;
		if(yearnum > 0){
			num = yearnum;
		}
		List<Order> order_list = orderDao.findOrderByServiceShopAndYearAndState(sid, num, year, state);
		httpRquest.setAttribute("order_by_year", order_list);
		return "success";
	}
	
	public String sendOrder(){
		HttpServletRequest httpRquest = ServletActionContext.getRequest();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		ret.put("send", "no session");
		Company company = (Company)httpRquest.getSession().getAttribute("company");

		if (company != null) {
            Order order = orderDao.findOrderBySerialnumberAndProductAndCompany(serialnumber,sp_id,company.getId());
            CorpOrderNumber corp = corpOrderNumberDao.findCorpOrderNumberByOrder(order.getId());
            if(corp.getUsed() < corp.getTotal()){
                ServiceShop shop = serviceShopDao.findServiceShopById(sid);

                Order sendorder = new Order();
                sendorder.setSerialnumber("HX"+UtilDate.getOrderNum());
                sendorder.setServiceProduct(order.getServiceProduct());
                sendorder.setCompany(order.getCompany());
                sendorder.setServiceShop(shop);
                if(null != order.getUserCoupon()){
                    sendorder.setUserCoupon(order.getUserCoupon());
                }
                sendorder.setPaidType(order.getPaidType());
                sendorder.setType(2);
                sendorder.setCustomername(customername);
                sendorder.setCustomerphone(customerphone);
                sendorder.setPrice(order.getPrice());
                sendorder.setPaid(order.getPaid());
				sendorder.setNumber(1);
				sendorder.setWeb_price(order.getWeb_price());
				sendorder.setWeb_price_total(order.getWeb_price());
                sendorder.setPos("");
                sendorder.setCreatedTime(new Date());
                sendorder.setUpdateTime(new Date());
                sendorder.setState(1);
                orderDao.saveNewOrder(sendorder);

                corp.setUsed(corp.getUsed() + 1);

                corpOrderNumberDao.saveCorpOrderNumber(corp);
                String address =sendorder.getServiceShop().getAreaDetail().getProvince() + sendorder.getServiceShop().getAreaDetail().getCity() + sendorder.getServiceShop().getAddress();
                HelpAction.sendUsedOrderSms(sendorder.getCustomerphone(), sendorder.getSerialnumber(), address);
    //			order.setNumber(order.getNumber() - 1);
                if(corp.getTotal() == corp.getUsed()){
                    order.setState(2);
                }
                orderDao.saveOrder(order);

                ret.put("send", "ok");
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
	
	public String searchProductByFuzzy(){
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		try {
			fuzzy = java.net.URLDecoder.decode(fuzzy,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		int total = 0;
		List<ServiceProduct> product = new ArrayList<ServiceProduct>();
		product = serviceProductDao.findServiceProductByFuzzyAndNum(fuzzy,number,start);
		total = serviceProductDao.findServiceProductByFuzzyAndNum(fuzzy,0,0).size();
		if(product.size() > 0){
			httpRequest.setAttribute("get_by_product_id", product.get(0).getServiceProject().getId());
			httpRequest.setAttribute("service_product", product);
			httpRequest.setAttribute("total_product", total);
			
			httpRequest.setAttribute("searchbyfuzzy", "0");
			httpRequest.setAttribute("fuzzystring", fuzzy);
			
			ServiceProject serviceProject = product.get(0).getServiceProject();
			if(serviceProject.getServiceClass().getId() == 1){
				return "success1";	
			}
			if(serviceProject.getServiceClass().getId() == 3){
				return "success2";	
			}
			if(serviceProject.getServiceClass().getId() == 5){
				return "success3";	
			}
			if(serviceProject.getServiceClass().getId() == 7){
				return "success4";	
			}
		}else{
			httpRequest.setAttribute("get_by_product_id", 0);
			httpRequest.setAttribute("service_product", product);
			httpRequest.setAttribute("total_product", total);
			return "success1";
		}
		return "success";
	}
	
	public String commentOrder(){
		HttpServletRequest httpRquest = ServletActionContext.getRequest();
		httpRquest.setAttribute("serialnumber", serialnumber);
		httpRquest.setAttribute("sp_id", sp_id);
		
		return "success";
	}
	
	public String creatComment(){
		HttpServletRequest httpRquest = ServletActionContext.getRequest();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		User user = (User)httpRquest.getSession().getAttribute("user");
		Company company = (Company)httpRquest.getSession().getAttribute("company");
		Order order = orderDao.findOrderById(oid);
		Comment comm = new Comment();
		comm.setOrder(order);
		if(null != user){
			comm.setUser(user);
		}
		if(null != company){
			comm.setCompany(company);
		}
		comm.setServiceProduct(order.getServiceProduct());
		comm.setServiceShop(order.getServiceShop());
		comm.setTitle(set_title);
		comm.setContent(set_content);
		comm.setStar(star);
		comm.setStatus(1);
		comm.setCreatedTime(new Date());
		comm.setUpdateTime(new Date());
		commentDao.saveNewComment(comm);
		
		order.setState(3);
		orderDao.saveOrder(order);
		
		ret.put("add", "ok");
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
	


	public String getCakeImage(){
		int ispaid = 0;
		int issend = 0;
		int notsend = 0;
		HttpServletRequest httpRquest = ServletActionContext.getRequest();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		Company company = (Company)httpRquest.getSession().getAttribute("company");
		List<Order> order_list = orderDao.findOrderByCompany(company.getId());
		for(int i = 0;i < order_list.size();i ++){
			CorpOrderNumber corp = corpOrderNumberDao.findCorpOrderNumberByOrder(order_list.get(i).getId());
			if(null != corp){
				ispaid = ispaid + corp.getTotal();
				issend = issend + corp.getUsed();
				notsend = notsend + (corp.getTotal() - corp.getUsed());
			}
		}
		
		if(ispaid == 0 && issend == 0 && notsend == 0){
			ret.put("result", 0);
		}else{
			ChartServlet chart = new ChartServlet(ispaid,issend,notsend);
			try {
				chart.cakeService(httpRquest,response);
				return null;
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
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
	
	public String getLineImage(){
		HttpServletRequest httpRquest = ServletActionContext.getRequest();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		Company company = (Company)httpRquest.getSession().getAttribute("company");
		int conp[] = {0,0,0,0,0,0,0,0,0,0,0,0}; 
		Calendar cal = Calendar.getInstance();

		if(null != year){
			for(int i = 0;i < 12;i ++){
				cal.set(Calendar.YEAR, Integer.parseInt(year));
				cal.set(Calendar.MONTH, i + 1);
				cal.set(Calendar.DAY_OF_MONTH,1);
				cal.add(Calendar.DAY_OF_MONTH, -1);
				Date lastDate = cal.getTime();
				
				cal.set(Calendar.DAY_OF_MONTH, 1);
				Date firstDate = cal.getTime();
				List<Prepaid> prepaid_list = prepaidDao.findPrepaidByCompanyAndMonth(company.getId(), firstDate, lastDate);
				for(int j = 0;j < prepaid_list.size();j ++){
					conp[i] = conp[i] + Integer.parseInt(prepaid_list.get(j).getMoney());
				}
			}
			boolean havepaid = false;
			for(int i = 0;i < conp.length;i ++){
				if(conp[i] > 0){
					havepaid = true;
					break;
				}
			}
			if(havepaid){
				ChartServlet chart = new ChartServlet(Integer.parseInt(year),conp);
				try {
					chart.lineService(httpRquest,response);
					return null;
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else{
				ret.put("result", 0);
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
	
	public String getOrderByUserAndNum(){
//		HttpServletRequest httpRquest = ServletActionContext.getRequest();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		JSONObject ret = new JSONObject();
		StringBuilder html = new StringBuilder();
		DateFormat d_f=new SimpleDateFormat("yyyy-MM-dd");
		DecimalFormat df=new DecimalFormat("######0.00");
		List<Order> order_list = null;
		
		if(state == 10){
			order_list = orderDao.findOrderByUserAndNum(uid, number, start);
		}else{
			order_list = orderDao.findOrderByUserAndNumAndState(uid, number, start, state);
		}
		String state_str = "";
		for(int i = 0;i < order_list.size();i ++){
			html.append("<tr><td align=\"center\">" + order_list.get(i).getServiceProduct().getTitle() + "</td>");
			html.append("<td align=\"center\">" + order_list.get(i).getServiceProduct().getServiceProject().getServiceClass().getName() + "</td>");
			html.append("<td align=\"center\">" + order_list.get(i).getServiceShop().getTitle() + "</td>");
			html.append("<td align=\"center\">" + d_f.format(order_list.get(i).getCreatedTime()) + "</td>");
			html.append("<td align=\"center\">" + df.format(order_list.get(i).getPaid()) + "元</td>");
			if(order_list.get(i).getState() == 0){
				state_str = "已提交";
			}
			if(order_list.get(i).getState() == 1){
				state_str = "已付款";
			}
			if(order_list.get(i).getState() == 2){
				state_str = "已使用";
			}
			if(order_list.get(i).getState() == 3){
				state_str = "已评价";
			}
			if(order_list.get(i).getState() == 4){
				state_str = "退款中";
			}
			if(order_list.get(i).getState() == 5){
				state_str = "退款成功";
			}
			if(order_list.get(i).getState() == 6){
				state_str = "退款失败";
			}
			if(order_list.get(i).getState() == 7){
				state_str = "已取消";
			}
			html.append("<td align=\"center\">" + state_str + "</td>");
			html.append("<td align=\"center\">");
			if(order_list.get(i).getState() == 0){
				html.append("<a href=\"javascript:void(0)\" onclick=\"paidorder(this)\">付款</a><a href=\"javascript:void(0)\" onclick=\"cancelorder(this)\">取消</a>");
			}
			if(order_list.get(i).getState() == 1){
				html.append("<a href=\"javascript:void(0)\" onclick=\"checkuser(this)\">确认使用</a><a href=\"javascript:void(0)\" onclick=\"changeorder(this)\">退款</a>");
			}
			if(order_list.get(i).getState() == 2){
				html.append("<a href=\"javascript:void(0)\" onclick=\"commentorder(this)\">评价</a>");
			}
			html.append("<input type=\"hidden\" value=\"" + order_list.get(i).getSerialnumber() + "\" id=\"serialnumber\" name=\"serialnumber\">");
			html.append("<input type=\"hidden\" value=\"" + order_list.get(i).getServiceProduct().getId() + "\" id=\"sp_id\" name=\"sp_id\">");
			html.append("</td>");
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
	
	public String getShopList(){
		HttpServletRequest httpRquest = ServletActionContext.getRequest();
		String nowcity = (String)httpRquest.getSession().getAttribute("setcity");
		String setprovince = "";
		if(null != province && province.length() > 0){
			try {
				province = java.net.URLDecoder.decode(province,"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			setprovince = province;
			nowcity = "";
			httpRquest.setAttribute("getbyprovince", setprovince);
		}else{
			if(null != city && city.length() > 0){
				try {
					city = java.net.URLDecoder.decode(city,"UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				nowcity = city;
				httpRquest.setAttribute("getbycity", nowcity);
			}
		}
		List<ServiceShop> serviceshop = serviceShopDao.findServiceShopByPlace( setprovince, nowcity,2,2);
		
		httpRquest.setAttribute("serviceshop", serviceshop);
		return "success";
	}
	
	public String getShopDetail(){
		HttpServletRequest httpRquest = ServletActionContext.getRequest();
		ServiceShop shop = serviceShopDao.findServiceShopById(sp_id);
		
		httpRquest.setAttribute("serviceshop_detail", shop);
		return "success";
	}
	
	public String setShopMarkerArr(){
		HttpServletRequest httpRquest = ServletActionContext.getRequest();
		String nowcity = (String)httpRquest.getSession().getAttribute("setcity");
		String setprovince = "";
		if(null != province && province.length() > 0){
			try {
				province = java.net.URLDecoder.decode(province,"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			setprovince = province;
			nowcity = "";
		}else{
			if(null != city && city.length() > 0){
				try {
					city = java.net.URLDecoder.decode(city,"UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				nowcity = city;
			}
		}
		List<ServiceShop> serviceshop = serviceShopDao.findServiceShopByPlace( setprovince, nowcity,2,2);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		JSONArray ret = new JSONArray();
		SmartProperties smartProp = SmartProperties.getInstance();
		String imgPath = smartProp.getImgPath();
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		for(int i = 0;i < serviceshop.size();i ++){
			JSONObject map =  new JSONObject();
			
			int all_star = 0;
			int star = 0;
			int ordersize = 0;
			for(int j = 0;j < serviceshop.get(i).getComments().size();j ++){
				all_star = all_star + serviceshop.get(i).getComments().get(j).getStar();
			}
			if(serviceshop.get(i).getComments().size() > 0){
				star = all_star / serviceshop.get(i).getComments().size();
			}
			for(int j = 0;j < serviceshop.get(i).getOrders().size();j ++){
				if(serviceshop.get(i).getOrders().get(j).getState() >= 2 && serviceshop.get(i).getOrders().get(j).getState() < 4){
					ordersize ++ ;
				}
			}
			
			map.put("PKID", serviceshop.get(i).getId());
			map.put("WorkTime", serviceshop.get(i).getBusiness());
			map.put("POS", serviceshop.get(i).getPaidtype().getName() );
			
			map.put("CommentRate", serviceshop.get(i).getComments().size());
			map.put("CommentTime", star);
			map.put("CarparName", serviceshop.get(i).getTitle());
			map.put("point", String.valueOf(serviceshop.get(i).getLongitude()) + "," + String.valueOf(serviceshop.get(i).getLatitude()));

			map.put("AddressBrief", serviceshop.get(i).getAreaDetail().getCity() + serviceshop.get(i).getAddress());
			map.put("InstallNum", ordersize);
			map.put("Service", "轮胎服务");
			map.put("Images",httpRequest.getContextPath() + "/common/displayPic?imagePath="+ imgPath + serviceshop.get(i).getPath() + "&imageName=" + serviceshop.get(i).getImage());
			map.put("City", serviceshop.get(i).getAreaDetail().getCity());
			map.put("Province", serviceshop.get(i).getAreaDetail().getProvince());
			double position[] = new double[2];
			position[0] = serviceshop.get(i).getLatitude();
			position[1] = serviceshop.get(i).getLongitude();
			
			map.put("Position",position);
			map.put("ShopType", 1);
			map.put("Tel", serviceshop.get(i).getTel());
			
			ret.add(map);
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
	public String getShopListByAreaDetail(){
		JSONObject ret = new JSONObject();
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		try {
			province = java.net.URLDecoder.decode(province,"UTF-8");
			city = java.net.URLDecoder.decode(city,"UTF-8");
			county = java.net.URLDecoder.decode(county,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		StringBuilder html = new StringBuilder("");
		ServiceProduct product = serviceProductDao.findServiceProductById(id);
		List<ServiceShop> sList = serviceShopDao.findServiceShopByArea( province, city,county);
		for(int i=0;i<sList.size();i++){
			List<ServiceshopService> ssList = serviceshopServiceDao.findBySSIDOrderByClassProject(sList.get(i).getId());
			for(int j=0;j<ssList.size();j++){
				if(ssList.get(j).getServiceProduct().equals(product)){
					html.append("<option value=\"" + String.valueOf(sList.get(i).getId()) + "\">" + sList.get(i).getTitle() + "</option>");	
				}
			}
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
}
