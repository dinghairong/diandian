package com.smart4c.action.admin;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.smart4c.bean.Prepaid;
import com.smart4c.bean.UserCoupon;
import com.smart4c.dao.PrepaidDao;
import com.smart4c.dao.UserCouponDao;
import com.smart4c.util.MiscUtils;
import com.smart4c.util.Page;

public class ChargeHistoryAction extends ActionSupport implements ServletResponseAware{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletResponse response;

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.response = arg0;
	}
	
	@Autowired
	private PrepaidDao pDao;
	@Autowired
	private UserCouponDao ucDao;
	
	private Page page = new Page();
	private String filters;
	private String ids;

	private Prepaid paid;
	
	public String getChargeHistory() {
		JSONObject jsonobj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		page.setFilters(filters);
		long totalRecords = pDao.countAll(page,filters);
		
		///////////////////////////////////////////////
		List<Prepaid> pList = pDao.getHistory(page, filters);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (Prepaid p : pList) {
			JSONObject obj = new JSONObject();
			obj.put("paid.id", p.getId());
			obj.put("paid.serialnumber", p.getSerialnumber());
			if (p.getCompany() != null) {
				obj.put("paid.company.company", p.getCompany().getCompany());
			}
			obj.put("paid.money", p.getMoney());
			List<UserCoupon> ucList = ucDao.findUserCouponByPid(p.getId());
			if (ucList.size() > 0) {
				obj.put("coupon", ucList.get(0).getCoupon().getTitle());
			}
			if (p.getState() == 0) {
				obj.put("paid.state", "成功");
			} else {
				obj.put("paid.state", "失败");
			}
			obj.put("paid.createdTime", sdf.format(p.getCreatedTime()));
			jsonArr.add(obj);
		}
		
		
		///////////////////////////////////////////////
		
		long totalPages = page.getPageCount(totalRecords);
		jsonobj.put("totalRecords", totalRecords);
		jsonobj.put("totalPages", totalPages);
		jsonobj.put("curPage", page.getCurPageNo());
		jsonobj.put("dataRows", jsonArr);
		
		response.setContentType("application/json;charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.write(jsonobj.toString());
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

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public Prepaid getPaid() {
		return paid;
	}

	public void setPaid(Prepaid paid) {
		this.paid = paid;
	}
}
