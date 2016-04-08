package com.smart4c.action.admin;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;


import com.opensymphony.xwork2.ActionSupport;
import com.smart4c.bean.Administrator;
import com.smart4c.bean.Advisory;
import com.smart4c.bean.User;
import com.smart4c.dao.AdvisoryDao;
import com.smart4c.util.MiscUtils;
import com.smart4c.util.Page;

@Scope("prototype")
@Component
public class QuestionsMgmtAction extends ActionSupport implements ServletResponseAware, SessionAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private AdvisoryDao aDao;
	
	private Page page = new Page();
	private String filters;
	private String ids;
	
	private Advisory adv;
	
	private HttpServletResponse response;
	private SessionMap session;

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
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
	public Advisory getAdv() {
		return adv;
	}
	public void setAdv(Advisory adv) {
		this.adv = adv;
	}
	
	public String addQuestion() {
		if (adv == null || adv.getId() != 0) {
			return null;
		}
		Administrator adminUser = (Administrator) session.get("adminUser");
		if (adminUser == null) {
			return null;
		}
		adv.setAdministrator(adminUser);
		Date cur = new Date();
		adv.setUsetime(cur);
		adv.setAdmintime(cur);
		
		aDao.persist(adv);
		
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("application/json");
		
		try {
			JSONObject obj = new JSONObject();
			obj.put("success", true);
			obj.put("id", adv.getId());
			obj.put("message", "");
			PrintWriter out = response.getWriter();
			out.write(obj.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}

	public String updateQuestion() {
		
		if (adv == null || adv.getId() == 0) {
			return null;
		}
		Advisory advTmp = aDao.find(adv.getId());
		if (advTmp != null) {
			advTmp.setUucontent(adv.getUucontent());
			advTmp.setIscommon(adv.getIscommon());
			advTmp.setAdmintime(new Date());
			aDao.merge(advTmp);
		}
		
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("application/json");
		
		try {
			JSONObject obj = new JSONObject();
			obj.put("success", true);
			obj.put("id", adv.getId());
			obj.put("message", "");
			PrintWriter out = response.getWriter();
			out.write(obj.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	public String removeQuestion() {
		int ret = aDao.batchRemove(ids);
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
	
	public String getQuestionList() {
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		page.setFilters(filters);
		long totalRecords = aDao.countAll(page, filters);
		
		////////////////////////////
		List<Advisory> qsList = aDao.getQuestions(page, filters);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (Advisory qs : qsList) {
			JSONObject obj = new JSONObject();
			obj.put("id", qs.getId());
			if (qs.getUser() != null) {
				obj.put("clientName", qs.getUser().getName());
			}
			obj.put("ask", qs.getUsecontent());
			if (qs.getUsetime() != null) {
				obj.put("askTime", sdf.format(qs.getUsetime()));
			}
			if (qs.getAdministrator()!= null) {
				obj.put("adminName", qs.getAdministrator().getName());
			}
			obj.put("adv.uucontent", qs.getUucontent());
			if (qs.getAdmintime() != null) {
				obj.put("replyTime", sdf.format(qs.getAdmintime()));
			}
			if (qs.getIscommon() == 0) {
				obj.put("adv.iscommon", "是");
			} else if (qs.getIscommon() == 1){
				obj.put("adv.iscommon", "否");
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
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.session = (SessionMap) arg0;
	}
}
