package com.smart4c.action.admin;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import com.opensymphony.xwork2.ActionSupport;
import com.smart4c.bean.InfoClass;
import com.smart4c.bean.NewsInfo;
import com.smart4c.bean.ServiceShop;
import com.smart4c.dao.InfoclassDao;
import com.smart4c.dao.NewsInfoDao;
import com.smart4c.dao.ServiceShopDao;
import com.smart4c.util.MiscUtils;
import com.smart4c.util.Page;

@Scope("prototype")
public class NotifyMgmtAction extends ActionSupport implements
		ServletResponseAware {
	@Autowired
	private NewsInfoDao newsDao;
	@Autowired
	private InfoclassDao infoDao;
	@Autowired
	private ServiceShopDao shopDao;
	
	
	private Page page = new Page();
	private String filters;
	private String ids;
	
	private NewsInfo news;
	
	private HttpServletResponse response;
	
	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response = response;

	}

	public NewsInfoDao getNewsDao() {
		return newsDao;
	}

	public void setNewsDao(NewsInfoDao newsDao) {
		this.newsDao = newsDao;
	}

	public InfoclassDao getInfoDao() {
		return infoDao;
	}

	public void setInfoDao(InfoclassDao infoDao) {
		this.infoDao = infoDao;
	}

	public ServiceShopDao getShopDao() {
		return shopDao;
	}

	public void setShopDao(ServiceShopDao shopDao) {
		this.shopDao = shopDao;
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

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public NewsInfo getNews() {
		return news;
	}

	public void setNews(NewsInfo news) {
		this.news = news;
	}
	
	
	public String addNews(){
		if(news == null || news.getId() !=0){
			return null;
		}
		JSONObject obj = new JSONObject();
		InfoClass infoclass = infoDao.find(news.getInfoClass().getId());
		if(infoclass == null){
			return null;
		}
		news.setUpdatetime(new Date());
		if("系统通知".equals(infoclass.getName())){
			List<ServiceShop> shops = shopDao.findAllServiceShopByState();
			for(ServiceShop shop:shops){
				NewsInfo ni = new NewsInfo();
				ni.setContent(news.getContent());
				ni.setInfoClass(infoclass);
				ni.setIsread(0);
				ni.setServiceShop(shop);
				ni.setTitle(news.getTitle());
				
				ni.setCreatedtime(new Date());
				ni.setUpdatetime(new Date());
				newsDao.persist(ni);
			}
		} else if ("系统提示".equals(infoclass.getName())) {
			newsDao.persist(news);
		}
		return null;
	}
	
	public String updateNews() {
		if (news == null || news.getId() == 0) {
			return null;
		}
		NewsInfo ni = newsDao.find(news.getId());
		if (ni != null) {
			ni.setContent(news.getContent());
			ni.setInfoClass(news.getInfoClass());
			ni.setServiceShop(news.getServiceShop());
			ni.setTitle(news.getTitle());
			ni.setUpdatetime(new Date());
			ni.setInfoClass(news.getInfoClass());
			newsDao.merge(ni);
		}
		
		return null;
	}
	
	public String removeNews() {
		int ret = newsDao.batchRemove(ids);
		JSONObject obj = new JSONObject();
		obj.put("ret", ret);
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
	
	public String getNewsList() {
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		page.setFilters(filters);
		long totalRecords = newsDao.countAll(page, filters);
		
		////////////////////////////
		
		List<NewsInfo> newsList = newsDao.getNews(page, filters);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (NewsInfo ni : newsList) {
			JSONObject obj = new JSONObject();
			obj.put("id", ni.getId());
			if (ni.getServiceShop() != null) {
				obj.put("news.serviceShop.id", ni.getServiceShop().getTitle());
			}
			if (ni.getInfoClass() != null) {
				obj.put("news.IinfoClass.id", ni.getInfoClass().getName());
			}
			obj.put("news.title", ni.getTitle());
			obj.put("news.content", ni.getContent());
			if (ni.getIsread() == 0) {
				obj.put("news.isread", "未读");
			} else if (ni.getIsread() == 1) {
				obj.put("news.isread", "已读");
			}
			if (ni.getUpdatetime() != null) {
				obj.put("updateTime", sdf.format(ni.getUpdatetime()));
			}
			
			jsonArr.add(obj);
		}
		
		///////////////////////////
				
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

	
	
	
}
