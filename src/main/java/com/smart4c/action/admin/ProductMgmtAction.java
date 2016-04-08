package com.smart4c.action.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;
import com.smart4c.bean.ServiceProduct;
import com.smart4c.common.SmartProperties;
import com.smart4c.dao.ServiceProductDao;
import com.smart4c.util.MiscUtils;
import com.smart4c.util.Page;

public class ProductMgmtAction extends ActionSupport implements
		ServletResponseAware {

	private  String filters; 

	private HttpServletResponse response;
	
	private ServiceProductDao SPDao;
	private ServiceProduct product;
	private Page page = new Page();
	private SmartProperties prop = SmartProperties.getInstance();
	
	
	public String getFilters() {
		return filters;
	}

	public void setFilters(String filters) {
		this.filters = filters;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public SmartProperties getProp() {
		return prop;
	}

	public void setProp(SmartProperties prop) {
		this.prop = prop;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public ServiceProductDao getSPDao() {
		return SPDao;
	}

	public void setSPDao(ServiceProductDao sPDao) {
		SPDao = sPDao;
	}

	public ServiceProduct getProduct() {
		return product;
	}

	public void setProduct(ServiceProduct product) {
		this.product = product;
	}

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.response = arg0;
	}
	
	public String addProduct(){
		if(product==null && product.getId()!=0){
			return null;
		}
		JSONObject obj =new JSONObject();
		ServiceProduct pro = SPDao.findServiceProductById(product.getId());
		if(pro==null){
			pro.setTitle(product.getTitle());
			pro.setAbstract_(product.getAbstract_());
			pro.setAccessory(product.getAccessory());
			pro.setDescription(product.getDescription());
			pro.setNewprice(product.getNewprice());
			pro.setDuration(product.getDuration());
			pro.setIsfirst(product.getIsfirst());
			pro.setCreatedTime(new Date());
			SPDao.persist(pro);
			
			obj.put("success", true);
			obj.put("id", product.getId());
		}else{
			obj.put("success", true);
			obj.put("message", "产品已存在，请选择其他");
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		try {
			PrintWriter out =response.getWriter();
			out.write(obj.toString());
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	public String deleteProduct(){
		JSONObject obj =new JSONObject();
		ServiceProduct sPro = SPDao.findServiceProductById(product.getId());
		if(sPro==null){
			obj.put("detail", "产品不存在，删除失败");
		}else{
			SPDao.remove(sPro);
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		try {
			PrintWriter out =response.getWriter();
			out.write(obj.toString());
			out.flush();
			out.close();
		} catch (IOException e) {
			MiscUtils.getLogger().info(e.toString());
		}
		
		return null;
	}
	
	public String updateProduct(){
		JSONObject obj = new JSONObject();
		if(product == null ||product.getId() ==0){
			return null;
		}
		ServiceProduct sPro = SPDao.findServiceProductById(product.getId());
		if(sPro!=null){
			sPro.setTitle(product.getTitle());
			sPro.setAbstract_(product.getAbstract_());
			sPro.setAccessory(product.getAccessory());
			sPro.setDescription(product.getDescription());
			sPro.setNewprice(product.getNewprice());
			sPro.setDuration(product.getDuration());
			sPro.setIsfirst(product.getIsfirst());
			sPro.setUpdateTime(new Date());
			SPDao.merge(sPro);

			obj.put("success", true);
			obj.put("id", product.getId());
		}else{
			obj.put("success", false);
			obj.put("message", "产品不存在，请刷新后再试");
		}
		
		response.setContentType("application/json;charset=UTF-8");
		try {
			PrintWriter out =response.getWriter();
			out.write(obj.toString());
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	@SuppressWarnings({ "unused", "unused" })
	public String getServiceProduct(){
		JSONObject jsonObj =new JSONObject();
		JSONArray jsonArr = new JSONArray();
		page.setFilters(filters);
		long totalRecords = SPDao.countAll(page,filters);
		
		List<ServiceProduct> sList = SPDao.getProductList(page,filters);
		String imgPath = prop.getImgPath();
		for(ServiceProduct s:sList){
			JSONObject obj =new JSONObject();
			obj.put("s.id", s.getId());
			obj.put("s.title", s.getTitle());
			obj.put("s.astract", s.getAbstract_());
			obj.put("s.newprice", s.getNewprice());
			obj.put("s.duration", s.getDuration());
			obj.put("s.status", s.getStatus());
			
		}
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
}
