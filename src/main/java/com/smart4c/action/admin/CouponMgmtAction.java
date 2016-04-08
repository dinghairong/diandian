package com.smart4c.action.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.smart4c.alipay.util.UtilDate;
import com.smart4c.bean.Company;
import com.smart4c.bean.Coupon;
import com.smart4c.bean.Prepaid;
import com.smart4c.bean.UserCoupon;
import com.smart4c.common.SmartProperties;
import com.smart4c.dao.CompanyDao;
import com.smart4c.dao.CouponDao;
import com.smart4c.dao.PrepaidDao;
import com.smart4c.dao.UserCouponDao;
import com.smart4c.util.MiscUtils;
import com.smart4c.util.Page;

@SuppressWarnings("serial")
public class CouponMgmtAction extends ActionSupport implements ServletResponseAware {
	@Autowired
	private CouponDao cpdao;
	@Autowired
	private UserCouponDao upDao;
	@Autowired
	private CompanyDao comDao;
	@Autowired
	private PrepaidDao prDao;
	
	private HttpServletResponse response;
	
	private Coupon con;
	private int id;
	private Page page = new Page();
	private String filters;
	
	private File icon;
	private String iconFileName;
	private String iconContentType;
	
	private Double money;
	
	private SmartProperties prop = SmartProperties.getInstance();

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.response = arg0;
	}
	
	public String addCoupon(){
		if(con==null|| con.getId() != 0){
			return null;
		}
		JSONObject obj = new JSONObject();
		Date cur = new Date();
		con.setCreatedTime(cur);
		con.setUpdateTime(cur);
		cpdao.persist(con);
		obj.put("id", con.getId());
		obj.put("success", true);
		
		
		response.setContentType("application/json;UTF-8");
		
		
		try {
			PrintWriter out = response.getWriter();
			out.write(obj.toString());
			out.flush();
			out.close();
		} catch (IOException e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	public String uploadCouponIcon() {
		boolean uploaded = false;
		JSONObject obj = new JSONObject();
		Coupon o = cpdao.find(con.getId());
		if(o !=null && icon!=null){
			String imgPath = prop.getImgPath();
			String path = MiscUtils.addPathSuffix("coupon" + File.separator + "icon");
			String suffix = MiscUtils.getFileSuffix(iconFileName);
			String fileName = new Date().getTime()+"."+suffix;
			uploaded = MiscUtils.storeFile(imgPath + path, fileName, icon);
			if (!uploaded) {
				MiscUtils.getLogger().info("Failed to save coupon's icon!");
			} else {
				o.setImage(fileName);
				o.setPath(path);
				o.setUpdateTime(new Date());
				cpdao.merge(o);
			}
		}
		
		obj.put("success", uploaded);
		obj.put("message", "");
		
		response.setContentType("application/json;charset=utf-8");
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
	
	public String updateCoupon(){
		if(con == null || con.getId()== 0){
			return null;
		}
		JSONObject obj = new JSONObject();
		Coupon couTmp = cpdao.findCouponById(con.getId());
		if(couTmp !=null){
			couTmp.setMoney(con.getMoney());
			couTmp.setTitle(con.getTitle());
			couTmp.setDescription(con.getDescription());
			couTmp.setChargeAmount(con.getChargeAmount());
			couTmp.setDescription(con.getDescription());
			couTmp.setExprieDays(con.getExprieDays());
			couTmp.setNum(con.getNum());
			couTmp.setStatus(con.getStatus());
			couTmp.setUpdateTime(new Date());
			cpdao.merge(couTmp);
			
			obj.put("success", true);
			obj.put("id",con.getId());
		}else{
			obj.put("success", false);
			obj.put("message", "优惠券不存在，请刷新后再试");
		}
		
		response.setContentType("applicatin/json;charset=utf-8");
		
		try {
			PrintWriter out = response.getWriter();
			out.write(obj.toString());
			out.flush();
			out.close();
		} catch (IOException e) {
			MiscUtils.getLogger().info(e.toString());
		}
		
		return null;
	}
	
	public String getCouponList(){
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		page.setFilters(filters);
		long totalRecords = cpdao.countAll(page, filters);
		
		/////////////////////////////////////////////////////////////
		List<Coupon> cList = cpdao.getCoupons(page, filters);
		String imgPath = prop.getImgPath();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (Coupon c : cList) {
			JSONObject obj = new JSONObject();
			obj.put("con.id", c.getId());
			obj.put("con.title", c.getTitle());
			obj.put("con.chargeAmount", c.getChargeAmount());
			obj.put("con.num", c.getNum());
			obj.put("con.money", c.getMoney());
			obj.put("con.consumeAmount", c.getConsumeAmount());
			obj.put("con.exprieDays", c.getExprieDays());
			obj.put("con.description", c.getDescription());
			if (c.getPath() != null && !c.getPath().isEmpty()
					&& c.getImage() != null && !c.getImage().isEmpty()) {
				obj.put("iconPN", imgPath + c.getPath() + ";" + c.getImage());
			}
			obj.put("con.createdTime", sdf.format(c.getCreatedTime()));
			obj.put("con.updateTime", sdf.format(c.getUpdateTime()));
			if (c.getStatus() == (byte)0) {
				obj.put("con.status", "有效");
			} else {
				obj.put("con.status", "停用");
			}
			jsonArr.add(obj);
		}
		
		// ///////////////////////////////////////////////////////////

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
	
	public String getcoupon(){
		List<Coupon> cp_list = cpdao.findCouponByStatus();
		JSONObject obj = new JSONObject();
		UserCoupon ucp = new UserCoupon();
		Company com = comDao.findCompanyById(id);
		Prepaid pd = new Prepaid();
		
		Coupon c = cp_list.get(0);
		for(Coupon cp : cp_list){
			if(cp.getChargeAmount()<money){
				if(c.getMoney()<cp.getMoney()){
					c = cp;
				}
			}
		}
		if(c.getChargeAmount()<money){
			ucp.setCompany(com);
			ucp.setCoupon(c);
			ucp.setCreatedTime(c.getCreatedTime());
			ucp.setStatus(0);
			ucp.setUpdateTime(c.getUpdateTime());
			
			Calendar calender = Calendar.getInstance();
			calender.setTime(c.getCreatedTime());
			calender.add(Calendar.DAY_OF_MONTH, c.getExprieDays());
			ucp.setExprieDate(calender.getTime());
			
			pd.setCompany(com);
			pd.setCreatedTime(new Date());
			pd.setMoney(String.valueOf(money));
			pd.setState(0);
			pd.setSerialnumber("HX"+UtilDate.getOrderNum());
			prDao.persist(pd);
			
			ucp.setPaid(pd);
			ucp.setSerialnumber(pd.getSerialnumber());
			upDao.persist(ucp);
			obj.put("success", true);
		}else{
			obj.put("success", false);
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
	
	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public String getFilters() {
		return filters;
	}

	public void setFilters(String filters) {
		this.filters = filters;
	}

	public File getIcon() {
		return icon;
	}

	public void setIcon(File icon) {
		this.icon = icon;
	}

	public String getIconFileName() {
		return iconFileName;
	}

	public void setIconFileName(String iconFileName) {
		this.iconFileName = iconFileName;
	}

	public String getIconContentType() {
		return iconContentType;
	}

	public void setIconContentType(String iconContentType) {
		this.iconContentType = iconContentType;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public Double getMoney() {
		return money;
	}

	public void setMoney(Double money) {
		this.money = money;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Coupon getCon() {
		return con;
	}

	public void setCon(Coupon con) {
		this.con = con;
	}

	
	
	
	
}