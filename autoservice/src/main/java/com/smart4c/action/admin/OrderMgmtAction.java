package com.smart4c.action.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.smart4c.bean.Order;
import com.smart4c.dao.OrderDao;
import com.smart4c.util.MiscUtils;
import com.smart4c.util.Page;

public class OrderMgmtAction extends ActionSupport implements
		ServletResponseAware {
	
	@Autowired
	private OrderDao ordao;
	
	private HttpServletResponse response;
	
	private Page page = new Page();
	private String filters;
	private String ids;
	
	private Order order;
	
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.response = arg0;
	}
	
	public String updateOrder(){
		if(order == null || order.getId() == 0){
			return null;
		}
		Order orTmp = ordao.findOrderById(order.getId());
		if(orTmp != null && orTmp.getState() != -1){
			orTmp.setState(order.getState());
			orTmp.setServiceShop(order.getServiceShop());
			orTmp.setUpdateTime(new Date());
			ordao.merge(orTmp);
		}
		
		return null;
	}
	
	public String removeOrder(){
		int ret = ordao.batchRemove(ids);
		JSONObject obj = new JSONObject();
		
		obj.put("ret", ret);
		
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
	
	public String getOrderList(){
		JSONObject jsonobj = new JSONObject();
		JSONArray arr = new JSONArray();
		page.setFilters(filters);
		long totalRecords = ordao.countAll(page,filters);
		
		List<Order> oList = ordao.getOrders(page,filters);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(oList !=null && oList.size()>0){
			for(Order o : oList){
				JSONObject obj = new JSONObject();
				obj.put("order.id", o.getId());
				obj.put("order.serialnumber", o.getSerialnumber());
				obj.put("order.serviceProduct.id", o.getServiceProduct().getTitle());
				if (o.getCompany() != null) {
					obj.put("order.company.id", o.getCompany().getCompany());
				}
				if (o.getUser() != null) {
					obj.put("order.user.id", o.getUser().getName());
				}
				if (o.getServiceShop() != null) {
					obj.put("shopName", o.getServiceShop().getTitle());
					obj.put("shopPhone", o.getServiceShop().getPhone());
					obj.put("shopAddress", o.getServiceShop().getAddress());
					obj.put("order.serviceShop.id", o.getServiceShop().getId());
				}
				if (o.getUserCoupon() != null){
					obj.put("order.userCoupon.id", o.getUserCoupon().getCoupon().getTitle());
				}
				if (o.getPaidType()!=null){
					obj.put("order.paidType.id", o.getPaidType().getName());
				}

				if (o.getType() == 0) {
					obj.put("order.type", "个人订单");
				} else if (o.getType() == 1) {
					obj.put("order.type", "企业订单");
				} else {
					obj.put("order.type", "企业子订单");
				}
				if (o.getCustomername()!= null) {
					obj.put("order.customername", o.getCustomername());
				}
				if (o.getCustomerphone() != null){
					obj.put("order.customerphone", o.getCustomerphone());
				}
				obj.put("order.price", o.getPrice());
//				obj.put("order.paid", o.getPaid());
				obj.put("order.paid", o.getPrice() * o.getNumber());
				if (o.getState() == 0) {
					obj.put("order.state", "已下单");
				} else if (o.getState() == 1) {
					obj.put("order.state", "已付款");
				} else if (o.getState() == 2) {
					obj.put("order.state", "已使用");
				} else if (o.getState() == 3) {
					obj.put("order.state", "已评价");
				} else if (o.getState() == 4) {
					obj.put("order.state", "退款中");
				} else if (o.getState() == 5) {
					obj.put("order.state", "退款成功");
				} else if (o.getState() == 6) {
					obj.put("order.state", "退款失败");
				} else if (o.getState() == -1) {
					obj.put("order.state", "已删除");
				}
				obj.put("order.createdTime", sdf.format(o.getCreatedTime()));
				obj.put("order.updateTime", sdf.format(o.getUpdateTime()));
				arr.add(obj);
			}
		}
		
		long totalPages = page.getPageCount(totalRecords);
		jsonobj.put("totalRecords", totalRecords);
		jsonobj.put("totalPages", totalPages);
		jsonobj.put("curPage", page.getCurPageNo());
		jsonobj.put("dataRows", arr);
		
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

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
}
