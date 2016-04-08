package com.smart4c.action.admin;

import java.io.File;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.struts2.dispatcher.RequestMap;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.smart4c.bean.AreaDetail;
import com.smart4c.bean.DetailPicture;
import com.smart4c.bean.NewsInfo;
import com.smart4c.bean.PaidType;
import com.smart4c.bean.ServiceProduct;
import com.smart4c.bean.ServiceShop;
import com.smart4c.bean.ServiceshopService;
import com.smart4c.common.SmartProperties;
import com.smart4c.dao.AreaDetailDao;
import com.smart4c.dao.DetailPictureDao;
import com.smart4c.dao.NewsInfoDao;
import com.smart4c.dao.PaidTypeDao;
import com.smart4c.dao.ServiceProductDao;
import com.smart4c.dao.ServiceShopDao;
import com.smart4c.dao.ServiceshopServiceDao;
import com.smart4c.util.EncryptionUtils;
import com.smart4c.util.MiscUtils;
import com.smart4c.util.Page;
import com.smart4c.util.SnCal;

public class ServiceShopMgmtAction extends ActionSupport implements ServletResponseAware,RequestAware {
	private HttpServletResponse response;

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.response = arg0;
	}
	
	@Autowired
	private ServiceShopDao ssDao;
	@Autowired
	private ServiceshopServiceDao spsDao;
	@Autowired
	private DetailPictureDao dpDao;
	@Autowired
	private AreaDetailDao adDao;
	@Autowired
	private PaidTypeDao ptDao;
	@Autowired
	private ServiceProductDao spDao;
	@Autowired
	private NewsInfoDao nDao;
	
	private SmartProperties prop = SmartProperties.getInstance();
	
	private String filters;
	private String ids;
	private Page page = new Page();
	
	private ServiceShop s;
	private String icon;
	private String iconFileName;
	private String iconContentType;
	private File licensePic;
	private String licensePicFileName;
	private String licensePicContentType;
	private String pics;
	private String wid;
	private String image;
	private String path;
	
	
	private RequestMap request;
	
	
	
	private String province;
	private String city;
	private String county;
	private String service;
	
	private String term; // keywords for searching service shop by shop's name
	
	
	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getWid() {
		return wid;
	}

	public void setWid(String wid) {
		this.wid = wid;
	}
	public RequestMap getRequest() {
		return request;
	}

	public void setRequest(Map map) {
		this.request = (RequestMap)map;
	}

	/*public String uploadShopPic() {
		boolean uploaded = false;
		JSONObject obj = new JSONObject();
		if ( icon != null) {
			String shopFolder = MiscUtils.addPathSuffix("shop" + File.separator + prop.getProperty("shop_icon_folder"));
			String imgPath = prop.getImgPath();
			String suffixName = MiscUtils.getFileSuffix(iconFileName);
			String imgName = new Date().getTime() + "." + suffixName;
			uploaded = MiscUtils.storeFile(imgPath + shopFolder, imgName, icon);
			if (!uploaded) {
				MiscUtils.getLogger().info("Failed to save shop's picture!");
			} else {
				
				ssDao.updateShopImg(shopFolder, imgName, s.getId());
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
	*/
	
	private void addPics(ServiceShop sh) {
		String[] pn = pics.split("\\|");
		int imgPathLen = prop.getImgPath().length();
		int maxCount = prop.getIntProperty("max_count_shop_thumbnail");
		if (maxCount < 1) {
			maxCount = 1;
		}
		int count = 0;
		int i = 0;
		Date curDate = new Date();
		for (; i<pn.length&&count<maxCount; i++) {
			String[] tmp = pn[i].split(";");
			if (tmp.length != 2) {
				continue;
			}
			count++;
			DetailPicture dp = new DetailPicture();
			dp.setImage(tmp[1]);
			dp.setCreatedTime(curDate);
			dp.setUpdateTime(curDate);
			dp.setObjectId(s.getId());
			dp.setPath(MiscUtils.addPathSuffix(tmp[0].substring(imgPathLen)));
			dp.setThumbnail((byte)1);
			dp.setType(0); // service shop's pictures
			dpDao.persist(dp);
		}
		
	}

	
	public String addShop() {
		if (s == null || s.getId() != 0) {
			return null;
		}
		JSONObject obj = new JSONObject();
		// check if phone exists or not 
		ServiceShop shopTmp = ssDao.findByPhone(s.getPhone());
		if (shopTmp != null) {
			obj.put("success", false);
			obj.put("message", "该手机号已注册，请用其它号码重新添加！");
		} else {
			// set area detail
			AreaDetail ad = adDao.findByProvinceCityCounty(province, city, county);
			if (ad == null) {
				obj.put("success", false);
				obj.put("message", "区域信息获取失败，请重新设置！");
			} else {
				s.setAreaDetail(ad);
				StringBuilder sb = new StringBuilder();
				for (byte b : EncryptionUtils.getSha1(s.getPassword())) {
					sb.append(b);
				}
				s.setPassword(sb.toString());
				int imgPathLen = prop.getImgPath().length();
				s.setPath(MiscUtils.addPathSuffix(s.getPath().substring(imgPathLen)));
				Date curDate = new Date();
				s.setCreatedTime(curDate);
				s.setUpdateTime(curDate);
				ssDao.persist(s);
				addPics(s);
				
				// add service relationship
				if (service!= null) {
					String[] services = service.split(",");
					for (String stmp : services) {
						ServiceshopService sps = new ServiceshopService();
						ServiceProduct sp = spDao.find(Integer.parseInt(stmp));
						if (sp == null) {
							continue;
						}
						sps.setServiceProduct(sp);
						sps.setServiceshop(s);
						spsDao.persist(sps);
					}
				}
				
				obj.put("success", true);
				obj.put("id", s.getId());
				obj.put("message", "");
			}
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
	
	private void updatePics(ServiceShop sh) {
		String[] pn = pics.split("\\|");
		int imgPathLen = prop.getImgPath().length();
		int maxCount = prop.getIntProperty("max_count_shop_thumbnail");
		if (maxCount < 1) {
			maxCount = 1;
		}
		int count = 0;
		int i = 0, j = 0;
		List<DetailPicture> stList = dpDao.getShopThumbnails(sh.getId());
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
				dp.setThumbnail((byte)1);
				dp.setType(0);
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
	
	public String updateShop() throws UnsupportedEncodingException {
		if (s == null || s.getId() == 0) {
			return null;
		}
		
		ServiceShop ss = ssDao.find(s.getId());
		JSONObject obj = new JSONObject();
		obj.put("id", s.getId());
		
		do {
			if (ss == null || ss.getStatus() == 2) { // 2: 已删除
				break;
			}
			
			boolean flag = true;
			AreaDetail ad = adDao.find(ss.getAreaDetail().getId());
			String oldAddr = "";
			if (ad != null) {
				oldAddr = ad.getProvince() + ad.getCity() + ad.getCounty(); 
			}
			oldAddr += s.getAddress();
			
			String addr = ""; //shop.getProvince()+shop.getCity()+shop.getCounty()+shop.getAddress();
			ad = adDao.findByProvinceCityCounty(province, city, county);
			if (ad != null) {
				addr = province + city + county;
				ss.setAreaDetail(ad);
			}
			addr += s.getAddress();
			
			if ((ss.getStatus() != 0 && s.getStatus() == 0) || !oldAddr.equalsIgnoreCase(addr)) { // 待审核 -->> 审核
				
				HttpClient client = new HttpClient();
				// 设置连接超时5s
				client.getHttpConnectionManager().getParams().setConnectionTimeout(5000);
				client.getHostConfiguration().setHost("api.map.baidu.com", 80, "http");

				String ak = prop.getProperty("baidu_map_ak");
				String sk = prop.getProperty("baidu_map_sk");
				String prefix = prop.getProperty("baidu_map_url_geoprefix");
				
				StringBuffer params = new StringBuffer();
				params.append("address=" + URLEncoder.encode(addr, "UTF-8"));
				params.append("&output=json");
				params.append("&ak=" + ak);
				params.append("&sn=" + new SnCal().getSn(addr, "json", prefix, ak, sk));
								
				GetMethod method = new GetMethod(prefix+"?"+params.toString());  
				// 设置超时5s
		        method.getParams().setParameter(HttpMethodParams.SO_TIMEOUT, 5000);
		        // 设置重试次数 3次
		        method.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,  
		                new DefaultHttpMethodRetryHandler(3, false));
		        method.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, "UTF-8");
		        
		        try {
					try {  
			            // Execute the method.  
			            int statusCode = client.executeMethod(method);  
			            if (statusCode == HttpStatus.SC_OK) {
			            	JSONObject rsp = JSONObject.fromObject(method.getResponseBodyAsString());
			            	if (rsp == null || rsp.getInt("status") != 0 ) {
			            		flag = false;
			            		throw new Exception(new String(method.getResponseBodyAsString().getBytes(method.getResponseCharSet()), "UTF-8"));
			            	}
			            	JSONObject result = (JSONObject)rsp.getJSONObject("result");
			            	if (result == null) {
			            		flag = false;
			            		throw new Exception("获取返回参数result, 失败!");
			            	}
			            	result = (JSONObject)result.getJSONObject("location");
			            	if (result == null) {
			            		flag = false;
			            		throw new Exception("获取返回参数location, 失败!");
			            	}
			            	
			            	s.setLongitude(result.getDouble("lng"));
			            	s.setLatitude(result.getDouble("lat"));
			            } else {  
			            	flag = false;
			            	break;
			            }  
			        } catch (Exception e) {  
			            MiscUtils.getLogger().info(e.toString());
			        } finally {  
			            method.releaseConnection();
			        }  
				} catch (Exception e) {
					// TODO Auto-generated catch block
					// e.printStackTrace();
					MiscUtils.getLogger().info(e.toString());
					flag = false;
				}
		        if (!flag) {
		        	obj.put("success", false);
					obj.put("message", "地址可能有误！在百度地图上无法获取该地址坐标！");
		        	break;
		        }
			}
			
			ss.setAddress(s.getAddress());
			ss.setBusiness(s.getBusiness());
			ss.setLongitude(s.getLongitude()); // 经度
			ss.setLatitude(s.getLatitude()); // 纬度
			ss.setYears(s.getYears());
			PaidType pt = s.getPaidtype() == null ? null : ptDao.find(s.getPaidtype().getId());
			if (pt != null) {
				ss.setPaidtype(pt);
			}
			//ss.setPaidtype(s.getPaidtype());
			ss.setTel(s.getTel());
			ss.setTitle(s.getTitle());
			ss.setSizes(s.getSizes());
			
			if(s.getImage()!=null  && s.getLicense()!=null){
				int imgPathLen = prop.getImgPath().length();
				if(imgPathLen>0){
					ss.setPath(MiscUtils.addPathSuffix(s.getPath().substring(imgPathLen)));
				}
				
			}
			if(s.getImage()!=null){
				ss.setImage(s.getImage());
			}else{
				ss.setImage("");
			}
			if(s.getLicense()!=null){
				ss.setLicense(s.getLicense());
			}else{
				ss.setLicense("");
			}
			
			ss.setStatus(s.getStatus());
			
			if (s.getPassword() != null && !"*********".equals(s.getPassword())) {
				StringBuilder sb = new StringBuilder();
				for (byte b : EncryptionUtils.getSha1(s.getPassword())) {
					sb.append(b);
				}
				ss.setPassword(sb.toString());
			}
			ss.setUpdateTime(new Date());
			ssDao.merge(ss);
			
			updatePics(ss);
			
			obj.put("success", true);
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
	
	public String removeShop() {
		JSONObject obj = new JSONObject();
		do {
//			if (checkRelatedData(ids)) {
//				obj.put("ret", 0);
//				obj.put("detail", "该门店有关联数据，暂时无法删除！");
//				break;
//			}
//			asDao.batchRemoveByVid(ids);
//			stDao.batchRemoveByVid(ids);
			int ret = ssDao.batchRemove(ids);
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
	
	public String getShopShList() {
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		page.setFilters(filters);
		long totalRecords = ssDao.countShAll(page, filters);
		
		//////////////////////////////////////////////////////////////
		
		List<ServiceShop> sList = ssDao.getShopShList(page, filters);
		String imgPath = prop.getImgPath();
		for (ServiceShop s : sList) {
			JSONObject obj = new JSONObject();
			obj.put("s.id", s.getId());
			obj.put("s.title", s.getTitle());
			obj.put("s.longitude", s.getLongitude());
			obj.put("s.latitude", s.getLatitude());
			SimpleDateFormat smp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			obj.put("s.creatTime", 
					smp.format(s.getCreatedTime()));
			if (s.getAreaDetail() != null) {
				//obj.put("s.cid", s.getAreaDetail().getId());
				obj.put("province", s.getAreaDetail().getProvince());
				obj.put("city", s.getAreaDetail().getCity());
				obj.put("county", s.getAreaDetail().getCounty());
			}
			obj.put("s.address", s.getAddress());
			List<ServiceshopService> spsList = spsDao.findBySSIDOrderByClassProject(s.getId());
			if (spsList != null && spsList.size() > 0) {
				StringBuffer buf = new StringBuffer();
				for (ServiceshopService sps:spsList) {
					buf.append(sps.getServiceProduct().getTitle());
					buf.append("<br>");
				}
				if (buf.length() > 0) {
					buf.delete(buf.length() - "<br>".length(), buf.length());
				}
				obj.put("service", buf.toString());
			}
			obj.put("s.business", s.getBusiness());
			obj.put("paidtype", s.getPaidtype().getName());
			
			String phone = s.getTel();
			if (phone != null && !phone.isEmpty()) {
				phone += "<br>";
			} else {
				phone = "";
			}
			String mobilePhone = "";
			if (s.getPhone() != null && !s.getPhone().isEmpty()) {
				if (s.getPhone().startsWith("@#del")) {
					mobilePhone = s.getPhone().substring("@#del".length());
					obj.put("contactInfo", phone + "d" + mobilePhone);
				} else {
					mobilePhone = s.getPhone();
					obj.put("contactInfo", phone + mobilePhone);
				}
			}
			obj.put("s.phone", (s.getPhone() == null) ? "" : mobilePhone);
			obj.put("s.tel", (s.getTel() == null) ? "" : s.getTel());
			
			obj.put("s.password", "*********");
			obj.put("s.years", s.getYears());
			obj.put("s.sizes", s.getSizes());
			obj.put("s.people", s.getPeople());
			if (s.getStatus() == 0) {
				obj.put("s.status", "审核通过");
			} else if(s.getStatus() == 1) {
				obj.put("s.status", "待审核");
			} else if (s.getStatus() == 2) {
				obj.put("s.status", "已删除");
			} else {
				obj.put("s.status", "其它");
			}
			if (s.getPath() != null && !s.getPath().isEmpty()) {
				obj.put("iconPN", imgPath + s.getPath() + ";" + s.getImage() + "," + s.getLicense());
			}
			
			StringBuffer buf = new StringBuffer();
			List<DetailPicture> dpList = dpDao.getShopThumbnails(s.getId());
			for (DetailPicture dp : dpList) {
				buf.append(imgPath + dp.getPath() + ";" + dp.getImage());
				buf.append("|");
			}
			obj.put("pics", buf.toString());
			
			jsonArr.add(obj);
		}
		
		// ///////////////////////////////////////////////////////////
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
	
	public String getShopList() {
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		page.setFilters(filters);
		long totalRecords = ssDao.countAll(page, filters);
		
		//////////////////////////////////////////////////////////////
		List<ServiceShop> sList = ssDao.getShopList(page, filters);
		String imgPath = prop.getImgPath();
		for (ServiceShop s : sList) {
			if(s.getStatus()!=2){
				JSONObject obj = new JSONObject();
				obj.put("s.id", s.getId());
				obj.put("s.title", s.getTitle());
				obj.put("s.longitude", s.getLongitude());
				obj.put("s.latitude", s.getLatitude());
				if (s.getAreaDetail() != null) {
					//obj.put("s.cid", s.getAreaDetail().getId());
					obj.put("province", s.getAreaDetail().getProvince());
					obj.put("city", s.getAreaDetail().getCity());
					obj.put("county", s.getAreaDetail().getCounty());
				}
				obj.put("s.address", s.getAddress());
				List<ServiceshopService> spsList = spsDao.findBySSIDOrderByClassProject(s.getId());
				if (spsList != null && spsList.size() > 0) {
					StringBuffer buf = new StringBuffer();
					for (ServiceshopService sps:spsList) {
						buf.append(sps.getServiceProduct().getTitle());
						buf.append("<br>");
					}
					if (buf.length() > 0) {
						buf.delete(buf.length() - "<br>".length(), buf.length());
					}
					obj.put("service", buf.toString());
				}
				obj.put("s.business", s.getBusiness());
				obj.put("paidtype", s.getPaidtype().getName());
				
				String phone = s.getTel();
				if (phone != null && !phone.isEmpty()) {
					phone += "<br>";
				} else {
					phone = "";
				}
				String mobilePhone = "";
				if (s.getPhone() != null && !s.getPhone().isEmpty()) {
					if (s.getPhone().startsWith("@#del")) {
						mobilePhone = s.getPhone().substring("@#del".length());
						obj.put("contactInfo", phone + "d" + mobilePhone);
					} else {
						mobilePhone = s.getPhone();
						obj.put("contactInfo", phone + mobilePhone);
					}
				}
				obj.put("s.phone", (s.getPhone() == null) ? "" : mobilePhone);
				obj.put("s.tel", (s.getTel() == null) ? "" : s.getTel());
				SimpleDateFormat smp = new SimpleDateFormat("yyyy-MM-dd");
				obj.put("s.updateTime", 
						smp.format(new Date()));
				obj.put("s.password", "*********");
				obj.put("s.years", s.getYears());
				obj.put("s.sizes", s.getSizes());
				obj.put("s.people", s.getPeople());
				if (s.getStatus() == 0) {
					obj.put("s.status", "审核通过");
				} else if(s.getStatus() == 1) {
					obj.put("s.status", "待审核");
				} else if (s.getStatus() == 2) {
					obj.put("s.status", "已删除");
				} else {
					obj.put("s.status", "其它");
				}

				if (s.getPath() != null && !s.getPath().isEmpty()) {
					obj.put("iconPN", imgPath + s.getPath() + ";" + s.getImage() + "," + s.getLicense());
				}
				
				StringBuffer buf = new StringBuffer();
				List<DetailPicture> dpList = dpDao.getShopThumbnails(s.getId());
				for (DetailPicture dp : dpList) {
					buf.append(imgPath + dp.getPath() + ";" + dp.getImage());
					buf.append("|");
				}
				obj.put("pics", buf.toString());
				
				jsonArr.add(obj);
			}
			
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

	public String searchShops() throws UnsupportedEncodingException {
		JSONArray shopArr = new JSONArray();
		List<ServiceShop> sList = ssDao.searchShops(URLDecoder.decode(term, "UTF-8"));
		for (ServiceShop s : sList) {
			JSONObject obj = new JSONObject();
			obj.put("label", s.getTitle());
			obj.put("value", s.getId());
			shopArr.add(obj);
		}
		
		response.setContentType("application/json;charset=UTF-8");
		
		try {
			PrintWriter out = response.getWriter();
			out.write(shopArr.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	public String getNewsInfo(){
		int id = 0;
		if(wid != null){
			id = Integer.parseInt(wid);
		}
		NewsInfo news = nDao.find(id);
		if(news != null){
			request.put("info_detail", news);
		}
		return "success";
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


	public ServiceShop getS() {
		return s;
	}


	public void setS(ServiceShop s) {
		this.s = s;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
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

	public File getLicensePic() {
		return licensePic;
	}

	public void setLicensePic(File licensePic) {
		this.licensePic = licensePic;
	}

	public String getLicensePicFileName() {
		return licensePicFileName;
	}

	public void setLicensePicFileName(String licensePicFileName) {
		this.licensePicFileName = licensePicFileName;
	}

	public String getLicensePicContentType() {
		return licensePicContentType;
	}

	public void setLicensePicContentType(String licensePicContentType) {
		this.licensePicContentType = licensePicContentType;
	}

	public String getPics() {
		return pics;
	}

	public void setPics(String pics) {
		this.pics = pics;
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

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}
}