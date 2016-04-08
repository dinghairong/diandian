package com.smart4c.action.admin;

import java.io.File;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.smart4c.bean.DetailPicture;
import com.smart4c.bean.ServiceClass;
import com.smart4c.bean.ServiceProduct;
import com.smart4c.bean.ServiceProject;
import com.smart4c.bean.ServiceShop;
import com.smart4c.bean.ServiceshopService;
import com.smart4c.common.SmartProperties;
import com.smart4c.dao.DetailPictureDao;
import com.smart4c.dao.ServiceClassDao;
import com.smart4c.dao.ServiceProductDao;
import com.smart4c.dao.ServiceProjectDao;
import com.smart4c.dao.ServiceShopDao;
import com.smart4c.dao.ServiceshopServiceDao;
import com.smart4c.util.MiscUtils;
import com.smart4c.util.Page;

public class ServiceMgmtAction extends ActionSupport implements ServletResponseAware {
	private HttpServletResponse response;

	@Autowired
	private ServiceProductDao spDao;
	@Autowired
	private ServiceshopServiceDao spsDao;
	@Autowired
	private ServiceProjectDao spjDao;
	@Autowired
	private ServiceClassDao scDao;
	@Autowired
	private ServiceShopDao ssDao;
	@Autowired
	private DetailPictureDao dpDao;
	
	private int id;
	private int ssId;
	private String nodeType;
	
	private String filters;
	private String ids;
	private Page page = new Page();
	private String pics;
	
	private ServiceProduct s;
	private File icon;
	private String iconFileName;
	private String iconContentType;
	
	private SmartProperties prop = SmartProperties.getInstance();
	
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.response = arg0;
	}
	
	public String getProducts() {
		JSONObject ret = new JSONObject();
		//ret.put("status", value)
		
		if (ssId == 0) {
			ret.put("status", 1);
		} else {
			ret.put("status", 0);
			// get 
			if (id == 0) { // get the first level
				List<ServiceClass> scList = scDao.getAllClass();
				JSONObject clsObj = new JSONObject();
				for (ServiceClass sc : scList) {
					JSONObject obj = new JSONObject();
					obj.put("type", "folder");
					obj.put("name", sc.getName());
					obj.put("id", sc.getId());
					obj.put("type0", "class");
					clsObj.put(sc.getName(), obj);
				}
				ret.put("data", clsObj);
			} else {
				if ("class".equals(nodeType)) {
					List<ServiceProject> projList = spjDao.getProjectsByClsId(id);
					JSONObject projObj = new JSONObject();
					for (ServiceProject sp : projList) {
						JSONObject obj = new JSONObject();
						obj.put("name", sp.getName());
						obj.put("id", sp.getId());
						obj.put("type", "folder");
						obj.put("type0", "project");
						projObj.put(sp.getName(), obj);
					}
					ret.put("data", projObj);
				} else if ("project".equals(nodeType)) {
					List<ServiceProduct> productList = spDao.getProductsByProjId(id, ssId != -1);
					JSONObject prodObj = new JSONObject();
					Set<Integer> spidSet = null;
					if (ssId != -1) {
						spidSet = spsDao.getSPIDySSID(ssId, ssId != -1);
					}
					for (ServiceProduct prod : productList) {
						JSONObject obj = new JSONObject();
						String prodTitle = prod.getTitle();
						if (prod.getStatus() == 1) {
							prodTitle += "<font color='red'>[已下架]</font>";
						}
						obj.put("name", prodTitle);
						obj.put("id", prod.getId());
						obj.put("type0", "product");
						obj.put("type", "item");
						if (ssId != -1 && spidSet.contains(prod.getId())) {
							JSONObject additionObj = new JSONObject();
							additionObj.put("item-selected", true);
							obj.put("additionalParameters", additionObj);
						}
						prodObj.put(prod.getTitle(), obj);
					}
					ret.put("data", prodObj);
				} else if (!"product".equals(nodeType)) {
					ret.put("status", 1);
				}
			}
		}
		
		response.setContentType("application/json;charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.write(ret.toString());
			out.flush();
			out.close();
		} catch (Exception e) {}
		return null;
	}
	
	
	public String addProductToShop() {
		JSONObject ret = new JSONObject();
		do {
			ServiceshopService sps = spsDao.find(ssId, id);
			if (sps != null) {
				ret.put("ret", 1);
				ret.put("msg", "门店已有该商品！");
				break;
			}
			ServiceShop shop = ssDao.find(ssId);
			if (shop == null) {
				ret.put("ret", 1);
				ret.put("msg", "操作失败，请刷新后重试！");
				break;
			}
			ServiceProduct sp = spDao.find(id);
			if (sp == null) {
				ret.put("ret", 1);
				ret.put("msg", "操作失败，请刷新后重试！");
				break;
			}
			
			sps = new ServiceshopService();
			sps.setServiceProduct(sp);
			sps.setServiceshop(shop);
			spsDao.persist(sps);
			ret.put("ret", 0);
		} while(false);
		
		response.setContentType("application/json; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.write(ret.toString());
			out.flush();
			out.close();
		} catch (Exception e) {}
		
		return null;
	}
	
	public String delProductFromShop() {
		JSONObject ret = new JSONObject();
		do {
			ServiceshopService sps = spsDao.find(ssId, id);
			if (sps == null) {
				ret.put("ret", 1);
				ret.put("msg", "门店没有该商品，请刷新后重试！");
				break;
			}
			spsDao.remove(sps.getId());
			ret.put("ret", 0);
		} while(false);
		
		response.setContentType("application/json; charset=UTF-8");
		//response.setCharacterEncoding("UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.write(ret.toString());
			out.flush();
			out.close();
		} catch (Exception e) {}
		
		return null;
	}
	
	public String addSProduct() {
		if (s == null || s.getId() != 0) {
			return null;
		}
		Date cur = new Date();
		s.setCreatedTime(cur);
		s.setUpdateTime(cur);
		addPics(s);
		spDao.persist(s);
		
		
		JSONObject ret = new JSONObject();
		ret.put("id", s.getId());
		ret.put("success", true);
		
		response.setContentType("application/json; charset=UTF-8");
		//response.setCharacterEncoding("UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.write(ret.toString());
			out.flush();
			out.close();
		} catch (Exception e) {}
		
		return null;
	}
	
	public String uploadSProductPic() {
		boolean uploaded = false;
		JSONObject obj = new JSONObject();
		ServiceProduct ss = spDao.find(s.getId());
		if (ss != null && icon != null) {
			String shopFolder = MiscUtils.addPathSuffix("product" + File.separator + prop.getProperty("product_icon_folder"));
			String imgPath = prop.getImgPath();
			String suffixName = MiscUtils.getFileSuffix(iconFileName);
			String imgName = new Date().getTime() + "." + suffixName;
			uploaded = MiscUtils.storeFile(imgPath + shopFolder, imgName, icon);
			if (!uploaded) {
				MiscUtils.getLogger().info("Failed to save shop's picture!");
			} else {
				ss.setIcon(imgName);
				ss.setPath(shopFolder);
				spDao.merge(ss);
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
	
	@SuppressWarnings("unused")
	private void updatePics(ServiceProduct sh) {
		String[] pn = pics.split("\\|");
		
		int imgPathLen = prop.getImgPath().length();
		int maxCount = prop.getIntProperty("max_count_shop_thumbnail");
		if (maxCount < 1) {
			maxCount = 1;
		}
		int count = 0;
		int i = 0, j = 0;
		List<DetailPicture> stList = dpDao.getShopDetailPics(sh.getId());
		Date curDate = new Date();
		for (; j<pn.length && (count < maxCount); j++) {
			String[] tmp = pn[j].split(";");
			
			if (tmp.length != 2) {
				continue;
			}
			count++;
			DetailPicture dp = null;
			if (i < stList.size()) {
				dp = stList.get(i);
				dp.setImage(tmp[1]);
				dp.setPath(MiscUtils.addPathSuffix(tmp[0].substring(imgPathLen)));
				dp.setStatus((byte)0);
				dp.setUpdateTime(curDate);
				dpDao.merge(dp);
				i++;
			} else {
				dp = new DetailPicture();
				dp.setObjectId(sh.getId());
				dp.setImage(tmp[1]);
				dp.setPath(MiscUtils.addPathSuffix(tmp[0].substring(imgPathLen)));
				dp.setPublicize((byte)0);
				dp.setThumbnail((byte)0);
				dp.setStatus((byte)0);
				dp.setType(2);
				dp.setCreatedTime(curDate);
				dp.setUpdateTime(curDate);
				dpDao.persist(dp);
			}
		}
		for (; i<stList.size(); i++) {
			if (stList.get(i).getStatus() == (byte)0) {
				stList.get(i).setStatus((byte)1);
				dpDao.merge(stList.get(i));
			}
		}
	}
	public String updateSProduct() {
		if (s == null || s.getId() == 0) {
			return null;
		}
		
		JSONObject obj = new JSONObject();
		do {
			ServiceProduct spTmp = spDao.find(s.getId());
			spTmp.setAbstract_(s.getAbstract_());
			spTmp.setAccessory(s.getAccessory());
			spTmp.setDescription(s.getDescription());
			spTmp.setDuration(s.getDuration());
			spTmp.setIsfirst(s.getIsfirst());
			spTmp.setNewprice(s.getNewprice());
			spTmp.setOldprice(s.getOldprice());
			spTmp.setStatus(s.getStatus());
			spTmp.setTitle(s.getTitle());
			spTmp.setServiceProject(s.getServiceProject());
			spTmp.setUpdateTime(new Date());
			
			if(pics != ""){updatePics(s);}
			
			spDao.merge(spTmp);
			
		} while(false);
		
		obj.put("success", true);
		obj.put("id", s.getId());
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
	
	public String getSProducts() {
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		page.setFilters(filters);
		long totalRecords = spDao.countAll(page, filters);
		
		/////////////////////////////////////////////////////////////
		List<ServiceProduct> spList = spDao.getProductList(page, filters);
		String imgPath = prop.getImgPath();
		for (ServiceProduct sp : spList) {
			JSONObject obj = new JSONObject();
			obj.put("s.id", sp.getId());
			obj.put("sc", sp.getServiceProject().getServiceClass().getName());
			obj.put("project", sp.getServiceProject().getName());
			obj.put("spjId", sp.getServiceProject().getId());
			// :['ID','类别','项目','产品名称','摘要','配件','促销价格','原价','时长','首页显示','状态'],
			obj.put("s.title", sp.getTitle());
			obj.put("s.abstract_", sp.getAbstract_());
			obj.put("s.accessory", sp.getAccessory());
			obj.put("s.newprice", sp.getNewprice());
			obj.put("s.oldprice", sp.getOldprice());
			obj.put("s.duration", sp.getDuration());
			obj.put("s.description", sp.getDescription());
			
			if (sp.getIsfirst() == 0 ) {
				obj.put("s.isfirst", "否");
			} else {
				obj.put("s.isfirst", "是");
			}
			if (sp.getStatus() == 0) {
				obj.put("s.status", "上架");
			} else {
				obj.put("s.status", "已下架");
			}
			if (sp.getPath() != null && !sp.getPath().isEmpty() && sp.getIcon() != null && !sp.getIcon().isEmpty()) {
				obj.put("iconPN", imgPath+sp.getPath()+";"+sp.getIcon());
			}
			
			StringBuffer buf = new StringBuffer();
			List<DetailPicture> dpList = dpDao.getShopDetailPics(sp.getId());
			for (DetailPicture dp : dpList) {
				buf.append(imgPath + dp.getPath() + ";" + dp.getImage());
				buf.append("|");
			}
			obj.put("pics", buf.toString());
			
		
			
			jsonArr.add(obj);
		}
		
		
		/////////////////////////////////////////////////////////////
		
		long totalPages = page.getPageCount(totalRecords);
		jsonObj.put("totalRecords", totalRecords);
		jsonObj.put("totalPages", totalPages);
		jsonObj.put("curPage", page.getCurPageNo());
		jsonObj.put("dataRows", jsonArr);

		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
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
	
	@SuppressWarnings("unused")
	private void addPics(ServiceProduct s){
		String[] pn = pics.split("\\|");
		int imgPathLen = prop.getImgPath().length();
		int maxCount = prop.getIntProperty("max_count_shop_thumbnail");
		if(maxCount<1){
			maxCount = 1;
		}
		
		int count = 0;
		int i = 0,j = 0;
		Date curDate = new Date();
		for(;i<pn.length&&count<maxCount;i++){
			String[] tmp = pn[j].split(";");
			if(tmp.length != 2){
				continue;
			}
			
			count++;
			DetailPicture dp =new DetailPicture();
			dp.setImage(tmp[1]);
			dp.setCreatedTime(curDate);
			dp.setUpdateTime(curDate);
			dp.setObjectId(s.getId());
			dp.setPath(MiscUtils.addPathSuffix(tmp[0].substring(imgPathLen)));
			dp.setThumbnail(0);
			dp.setType(2);
			dpDao.persist(dp);
		}
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNodeType() {
		return nodeType;
	}

	public void setNodeType(String nodeType) {
		this.nodeType = nodeType;
	}

	public int getSsId() {
		return ssId;
	}

	public void setSsId(int ssId) {
		this.ssId = ssId;
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

	public void setIds(String ids) {
		this.ids = ids;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public ServiceProduct getS() {
		return s;
	}

	public void setS(ServiceProduct s) {
		this.s = s;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public ServiceProductDao getSpDao() {
		return spDao;
	}

	public void setSpDao(ServiceProductDao spDao) {
		this.spDao = spDao;
	}

	public ServiceshopServiceDao getSpsDao() {
		return spsDao;
	}

	public void setSpsDao(ServiceshopServiceDao spsDao) {
		this.spsDao = spsDao;
	}

	public ServiceProjectDao getSpjDao() {
		return spjDao;
	}

	public void setSpjDao(ServiceProjectDao spjDao) {
		this.spjDao = spjDao;
	}

	public ServiceClassDao getScDao() {
		return scDao;
	}

	public void setScDao(ServiceClassDao scDao) {
		this.scDao = scDao;
	}

	public ServiceShopDao getSsDao() {
		return ssDao;
	}

	public void setSsDao(ServiceShopDao ssDao) {
		this.ssDao = ssDao;
	}

	public String getPics() {
		return pics;
	}

	public void setPics(String pics) {
		this.pics = pics;
	}

	public SmartProperties getProp() {
		return prop;
	}

	public void setProp(SmartProperties prop) {
		this.prop = prop;
	}
	
}
