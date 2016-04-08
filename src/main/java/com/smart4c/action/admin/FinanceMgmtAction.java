package com.smart4c.action.admin;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.smart4c.dao.OrderDao;
import com.smart4c.util.MiscUtils;
import com.smart4c.util.Page;

@Scope("prototype")
@Component
public class FinanceMgmtAction extends ActionSupport implements ServletResponseAware{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private OrderDao oDao;

	
	private HttpServletResponse response;
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	private Page page = new Page();
	private String filters;
	private String ids;
	
	private int id;
	
	private int dateFrm;
	private int dateEnd;
	
	// 获取某年到某年的总销售额 sales/year
	public String getTotalSalesByYear() throws Exception{
		JSONArray jsonArr = new JSONArray();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			for (int i = dateFrm; i<=dateEnd; i++) {
				Date beg = sdf.parse(i + "-01-01 00:00:00");
				Date end = sdf.parse(i + "-12-31 23:59:59");
				JSONObject obj = new JSONObject();
				obj.put("year", i);
				obj.put("sales", oDao.getTotalSales(beg, end));
				jsonArr.add(obj);
			}
			
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.print(jsonArr.toString());
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
	
	// 获取某个年份各个月的销售额
	public String getTotalSalesByMonth() {
		JSONArray jsonArr = new JSONArray();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM");
		List<JSONObject> monList = getMonthDay(dateFrm);
		for (JSONObject mon : monList) {
			try {
				Date begDate = sdf.parse(dateFrm + "-" + mon.getString("month") 
						+ "-" + mon.getString("start") + " 00:00:00");
				Date endDate = sdf.parse(dateFrm + "-" + mon.getString("month") 
						+ "-" + mon.getString("end")+ " 23:59:59");
				JSONObject obj = new JSONObject();
				obj.put("month", sdf2.format(begDate));
				obj.put("sales", oDao.getTotalSales(begDate, endDate));
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
	
	
	// 根据服务类别统计各年销售额
		public String getClassSalesByYear() {
			JSONArray jsonArr = new JSONArray();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				for (int i = dateFrm; i<=dateEnd; i++) {
					Date beg = sdf.parse(i + "-01-01 00:00:00");
					Date end = sdf.parse(i + "-12-31 23:59:59");
					JSONObject obj = new JSONObject();
					obj.put("year", i);
					obj.put("sales", oDao.getSalesByClass(beg, end, id));
					jsonArr.add(obj);
				}
				
			} catch (Exception e) {
				MiscUtils.getLogger().info(e.toString());
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
		
		// 根据服务类别统计各月销售额
		public String getClassSalesByMonth() {
			JSONArray jsonArr = new JSONArray();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM");
			List<JSONObject> monList = getMonthDay(dateFrm);
			for (JSONObject mon : monList) {
				try {
					Date begDate = sdf.parse(dateFrm + "-" + mon.getString("month") 
							+ "-" + mon.getString("start") + " 00:00:00");
					Date endDate = sdf.parse(dateFrm + "-" + mon.getString("month") 
							+ "-" + mon.getString("end")+ " 23:59:59");
					JSONObject obj = new JSONObject();
					obj.put("month", sdf2.format(begDate));
					obj.put("sales", oDao.getSalesByClass(begDate, endDate, id));
					jsonArr.add(obj);;
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

	
	
	// 根据服务名称统计各年服务次数
	public String getServiceSalesByYear() {
		JSONArray jsonArr = new JSONArray();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			for (int i = dateFrm; i<=dateEnd; i++) {
				Date beg = sdf.parse(i + "-01-01 00:00:00");
				Date end = sdf.parse(i + "-12-31 23:59:59");
				JSONObject obj = new JSONObject();
				obj.put("year", i);
				obj.put("times", oDao.getTimes(beg, end,id));
				jsonArr.add(obj);
			}
			
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
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
	
	// 根据服务名称统计各月服务次数
	public String getServiceSalesByMonth() {
		JSONArray jsonArr = new JSONArray();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM");
		List<JSONObject> monList = getMonthDay(dateFrm);
		for (JSONObject mon : monList) {
			try {
				Date begDate = sdf.parse(dateFrm + "-" + mon.getString("month") 
						+ "-" + mon.getString("start") + " 00:00:00");
				Date endDate = sdf.parse(dateFrm + "-" + mon.getString("month") 
						+ "-" + mon.getString("end")+ " 23:59:59");
				JSONObject obj = new JSONObject();
				obj.put("month", sdf2.format(begDate));
				obj.put("times", oDao.getTimes(begDate, endDate,id));
				jsonArr.add(obj);;
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

	public int getDateFrm() {
		return dateFrm;
	}

	public void setDateFrm(int dateFrm) {
		this.dateFrm = dateFrm;
	}

	public int getDateEnd() {
		return dateEnd;
	}

	public void setDateEnd(int dateEnd) {
		this.dateEnd = dateEnd;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
