package com.smart4c.dao;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.smart4c.bean.Order;
import com.smart4c.util.Page;
import com.smart4c.util.Page.OrderByCB;
import com.smart4c.util.SqlTools;
import com.smart4c.util.SqlTools.CallBack;

@Repository
public class OrderDao extends AbstractDao<Order> {

	public OrderDao() {
		super(Order.class);
	}

	@SuppressWarnings("unchecked")
	public List<Order> findOrderByProduct(int pid){
		Query query = entityManager.createQuery("select o from Order o where o.serviceProduct.id = ?1");
		query.setParameter(1, pid);
		
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public Long countOrderByProduct(int pid){
		Query query = entityManager.createQuery("select count(*) from Order o where o.serviceProduct.id = ?1");
		query.setParameter(1, pid);

		return (Long)query.getSingleResult();
	}

	@SuppressWarnings("unchecked")
	public List<Order> findOrderByUser(int uid){
		Query query = entityManager.createQuery("select o from Order o where o.user.id = ?1");
		query.setParameter(1, uid);
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> findOrderByUserAndNum(int uid,int number,int start){
		Query query = entityManager.createQuery("select o from Order o where o.user.id = ?1");
		query.setParameter(1, uid);
		if(number > 0){
			query.setFirstResult(start);
			query.setMaxResults(number);
		}
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> findOrderByUserAndNumAndState(int uid,int number,int start,int state){
		Query query = entityManager.createQuery("select o from Order o where o.user.id = ?1 and o.state=?2");
		query.setParameter(1, uid);
		query.setParameter(2, state);
		if(number > 0){
			query.setFirstResult(start);
			query.setMaxResults(number);
		}
		
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Order> findOrderByUserPageAndState(int uid,int number,int start,int state){
		String sql = "";
		if(4 == state){
			sql = "select o from Order o where o.user.id = ?1 and ( o.state=?2 or o.state=5 or o.state=6 ) order by o.createdTime DESC";
		}else if(100==state){
			sql = "select o from Order o where o.user.id = ?1 order by o.createdTime DESC";
		}else if(2==state){
			sql = "select o from Order o where o.user.id = ?1 and ( o.state=?2 or o.state=3 ) order by o.createdTime DESC";
		}else{
			sql = "select o from Order o where o.user.id = ?1 and o.state=?2 order by o.createdTime DESC";
		}
		Query query = entityManager.createQuery(sql);
		query.setParameter(1, uid);
		if(state != 100){
			query.setParameter(2, state);
		}
		if(number > 0){
			query.setFirstResult(start);
			query.setMaxResults(number);
		}

		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public Long findOrderCountByUserAndNumAndState(int uid,int number,int start,int state){
		String sql = "";
		if(4 == state){
			sql = "select count(*) from Order o where o.user.id = ?1 and ( o.state=?2 or o.state=5 or o.state=6 )";
		}else if(100==state){
			sql = "select count(*) from Order o where o.user.id = ?1 ";
		}else if(2==state){
			sql = "select count(*) from Order o where o.user.id = ?1 and ( o.state=?2 or o.state =3 )";
		}else{
			sql = "select count(*) from Order o where o.user.id = ?1 and o.state=?2";
		}
		Query query = entityManager.createQuery(sql);
		query.setParameter(1, uid);
		if(state != 100){
			query.setParameter(2, state);
		}

		return (Long) query.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> findOrderByServiceShop(int sid){
		Query query = entityManager.createQuery("select o from Order o where o.serviceShop.id = ?1");
		query.setParameter(1, sid);
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> findOrderByUserAndState(int uid,int status){
		Query query = entityManager.createQuery("select o from Order o where o.user.id = ?1 and o.state = ?2");
		query.setParameter(1, uid);
		query.setParameter(2, status);
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> findOrderBySerialnumber(String serialnumber){
		Query query = entityManager.createQuery("select o from Order o where o.serialnumber = ?1");
		query.setParameter(1, serialnumber);
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> findOrderByServiceShopAndState(int vid,int state){
		Query query = entityManager.createQuery("select o from Order o where o.serviceShop.id = ?1 and o.state = ?2");
		query.setParameter(1, vid);
		query.setParameter(2, state);
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> findOrderByServiceShopState(int sid){
		Query query = entityManager.createQuery("select o from Order o where o.serviceShop.id = ?1 and (o.state = '2' or o.state = '3')");
		query.setParameter(1, sid);
		
		return query.getResultList();
	}

	public Order findOrderById(Integer id) {
		Query query = entityManager.createQuery("select o from Order o where o.id = ?1");
		query.setParameter(1, id);
		return (Order) query.getSingleResult();
	}
	
	public int batchRemove(String ids){
		Query query = entityManager.createQuery("update Order set status='1' where id in (" + ids + ")");
		return query.executeUpdate();
	}

	public long countAll(Page page, String filters) {
		String sql = "select count(o) from Order o";
		
		String orderBy = page.getOrderByString(
				new OrderByCB(){
					public String getOrderBy(String f){
						return f;
					}
		});
		orderBy = " order by " + orderBy + " " + page.getOrder();
		if(!page.get_search()){
			sql += orderBy;
		}else{
			String queryStr = new SqlTools().constructWhere(filters, new CallBack(){
				public String executeField(String f){
					return f;
				}
				
				public String executeData(String f ,String v){
					if("o.state".equals(f)){
						if ("已下单".equals(v)) {
							return "0";
						} else if ("已付款".equals(v)) {
							return "1";
						} else if ("已使用".equals(v)) {
							return "2";
						} else if ("已评价".equals(v)) {
							return "3";
						} else if ("退款中".equals(v)) {
							return "4";
						} else if ("退款成功".equals(v)) {
							return "5";
						} else if ("退款失败".equals(v)) {
							return "6";
						} else if ("已删除".equals(v)) {
							return "-1";
						}
					} else if ("o.type".equals(f)) {
						if ("个人订单".equals(v)) {
							return "0";
						} else if ("企业订单".equals(v)) {
							return "1";
						} else {
							return "2";
						}
					}
					return v;
				}
			});
			if(!queryStr.isEmpty()){
				sql += "where" + queryStr;
			}
			sql += orderBy;
		}
		Query q = entityManager.createQuery(sql);
		return (Long) q.getSingleResult();
	}

	@SuppressWarnings("unchecked")
	public List<Order> getOrders(Page page, String filters) {
		String sql = "select o from Order o ";
		String orderBy = page.getOrderByString(new OrderByCB() {
			public String getOrderBy(String f) {
				return f;
			}
		});
		orderBy = " order by " + orderBy + " " + page.getOrder();
		
		if (!page.get_search()) {
			sql += orderBy;
		} else {
			String queryStr = new SqlTools().constructWhere(filters, new CallBack() {
				public String executeField(String f) {
					return f;
				}

				public String executeData(String f, String v) {
					if ("o.state".equals(f)) {
						if ("已下单".equals(v)) {
							return "0";
						} else if ("已付款".equals(v)) {
							return "1";
						} else if ("已使用".equals(v)) {
							return "2";
						} else if ("已评价".equals(v)) {
							return "3";
						} else if ("退款中".equals(v)) {
							return "4";
						} else if ("退款成功".equals(v)) {
							return "5";
						} else if ("退款失败".equals(v)) {
							return "6";
						} else if ("已删除".equals(v)) {
							return "-1";
						}
					} else if ("o.type".equals(f)) {
						if ("个人订单".equals(v)) {
							return "0";
						} else if ("企业订单".equals(v)) {
							return "1";
						} else {
							return "2";
						}
					}
					return v;
				}
			});
			if (!queryStr.isEmpty()) {
				sql += " where " + queryStr;
			}
			
			sql += orderBy;
		}
		Query q = entityManager.createQuery(sql);
		q.setFirstResult((page.getCurPageNo() - 1) * page.getPageSize());
		q.setMaxResults(page.getPageSize());
		return q.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Order> findOrderByServiceShopAndStateAndPage(int vid,int state,int num,int start) {
		Query query = entityManager.createQuery("select o from Order o where o.serviceShop.id = ?1 and o.state = ?2");
		query.setParameter(1, vid);
		query.setParameter(2, state);
		query.setFirstResult(start);
		query.setMaxResults(num);
		
		return query.getResultList();
	}

	public long countOrdersServiceShopAndState(int vid,int state) {
		String sql = "select count(o) from Order o where o.serviceShop.id = ?1 and o.state = ?2";
		Query query = entityManager.createQuery(sql);
		query.setParameter(1, vid);
		query.setParameter(2, state);

		return (Long) query.getSingleResult();
	}

	@SuppressWarnings("unchecked")
	public List<Order> findOrderByServiceShopAndPage(int vid, int num,int start) {
		Query query = entityManager.createQuery("select o from Order o where o.serviceShop.id = ?1");
		query.setParameter(1, vid);
		query.setFirstResult(start);
		query.setMaxResults(num);

		return query.getResultList();
	}

	public long countOrdersServiceShop(int vid) {
		String sql = "select count(o) from Order o where o.serviceShop.id = ?1";
		Query query = entityManager.createQuery(sql);
		query.setParameter(1, vid);

		return (Long) query.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> findOrderByCompany(int cid){
		Query query = entityManager.createQuery("select o from Order o where o.company.id = ?1");
		query.setParameter(1, cid);
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> findOrderByCompanyAndType(int cid,int type){
		Query query = entityManager.createQuery("select o from Order o where o.company.id = ?1 and o.type = ?2");
		query.setParameter(1, cid);
		query.setParameter(2, type);
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> findOrderByCompanyAndState(int cid){
		Query query = entityManager.createQuery("select o from Order o where o.company.id = ?1 and o.state > 0 and o.state < 4");
		query.setParameter(1, cid);
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> findOrderByCompanyAndMonthAndState(int cid){
		String sql = "select o from Order o where o.company.id = ?1 ";
		int setnum = 0 - 1;
		Calendar cal = Calendar.getInstance();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		cal.add(Calendar.MONTH ,setnum);
		sql = sql + " and o.createdTime > '" + df.format(cal.getTime()) + "' and o.state > 0 and o.state < 4";
		
		Query query = entityManager.createQuery(sql);
		query.setParameter(1, cid);
		
		return query.getResultList();
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Order> findOrderBySomething(int id,String searchdate,String name,String products,String status,String money,String type,String searchowner){
		String sql = "select o from Order o where o.serviceShop.id = " + String.valueOf(id);
		if(searchdate.length() > 0){
			if(!searchdate.equals("0")){
				Calendar cal = Calendar.getInstance();
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				if(searchdate.equals("1")){
					int dayofweek = cal.get(Calendar.DAY_OF_WEEK);
					int lastday = 7 - dayofweek;
					cal.set(Calendar.DAY_OF_MONTH, -lastday);
					sql = sql + " and o.createdTime > '" + df.format(cal.getTime()) + "'";
				}
				if(searchdate.equals("2")){
					int setnum = 0 - 1;
					cal.add(Calendar.MONTH ,setnum);
					sql = sql + " and o.createdTime > '" + df.format(cal.getTime()) + "'";
				}
				if(searchdate.equals("3")){
					int setnum = 0 - 3;
					cal.add(Calendar.MONTH ,setnum);
					
					sql = sql + " and o.createdTime > '" + df.format(cal.getTime()) + "'";
				}
			}
		}
		if(name.length() > 0){
			sql = sql +" and (o.user.name like '%" + name + "%' or o.user.phone = '" + name + "' or o.company.contacts like '%" + name + "%' or o.company.phone = '" + name + "' or o.customername like '%" + name + "%' or o.customerphone = " + name + ")";
		}
		if(products.length() > 0){
			sql = sql  + " and ( o.serviceProduct.title like '%" + products + "%' or o.serviceShop.name like '%" + products + "%')";
		}
		if(status.length() > 0 && !status.equals("6")){
			sql = sql + " and o.state = '" + status + "'";
		}
		if(money.length() > 0){
			sql = sql + " and o.paid = '" + money + "' or o.price = '" + money + "'";
		}
		if(searchowner.length() > 0 && !searchowner.equals("0")){
			sql = sql +" and (o.user.name like '%" + searchowner + "%' or o.company.contacts like '%" + name + "%' or o.customername like '%" + name + "%')";
		}
		if(type.length() > 0 && !type.equals("0")){
			sql = sql + " and o.serviceProduct.serviceProgect.serviceClass.id = '" + type + "'";
		}
		
		Query query = entityManager.createQuery(sql);
		
		return query.getResultList();
	}
	
	public void saveNewOrder(Order order){
		entityManager.persist(order);
	}
	
	public void saveOrder(Order order){
		entityManager.merge(order);
	}

	@SuppressWarnings("unchecked")
	public List<Order> findOrderByServiceShopAndYearAndState(int sid,int yearnum,String year,int state){
		String sql = "select o from Order b where b.createdTime > ?1 and b.serviceShop.id = ?2";
		if(state == 0){
			sql = sql + " and b.state = 0";
		}else{
			sql = sql + " and b.state > " + state;
		}
		if(yearnum != 0){
			int setnum = 0 - yearnum;
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.YEAR ,setnum);
			Query query = entityManager.createQuery(sql);
			query.setParameter(1, cal.getTime());
			query.setParameter(2, sid);
			
			return query.getResultList();
		}else{
			if(year.length() > 0){
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Date setyear = null;
				try {
					setyear = df.parse(year + "-00-00");
				} catch (ParseException e) {
					e.printStackTrace();
				}
				Query query = entityManager.createQuery(sql);
				query.setParameter(1, setyear);
				query.setParameter(2, sid);
				
				return query.getResultList();
			}else{
				return null;
			}
		}
	}

	public Order findOrderBySerialnumberAndProduct(String serialnumber,int spid){
		Query query = entityManager.createQuery("select o from Order o where o.serialnumber = ?1 and o.serviceProduct.id = ?2");
		query.setParameter(1, serialnumber);
		query.setParameter(2, spid);
		
		return getSingleResultOrNull(query);
	}
	
	public Order findOrderBySerialnumberAndProductAndUser(String serialnumber,int spid,int uid){
		Query query = entityManager.createQuery("select o from Order o where o.serialnumber = ?1 and o.serviceProduct.id = ?2 and o.user.id = ?3");
		query.setParameter(1, serialnumber);
		query.setParameter(2, spid);
		query.setParameter(3, uid);
		
		return getSingleResultOrNull(query);
	}
	
	public Order findOrderBySerialnumberAndProductAndCompany(String serialnumber,int spid,int cyid){
		Query query = entityManager.createQuery("select o from Order o where o.serialnumber = ?1 and o.serviceProduct.id = ?2 and o.company.id = ?3");
		query.setParameter(1, serialnumber);
		query.setParameter(2, spid);
		query.setParameter(3, cyid);
		
		return getSingleResultOrNull(query);
	}
	
	public Date getEarliestPaidOrder() {
		Query q = entityManager.createQuery("select createdTime from Order where state > 0 order by createdTime");
		q.setMaxResults(1);
		Date date = null;
		try {
			date = (Date)q.getSingleResult();
		} catch (Exception e) {
			date = new Date();
		}
		
		return date;
	}

	public Double getTotalSales(Date beg, Date end) {
		Query q = entityManager.createQuery("select sum(paid) from Order where state > 0 "+ "and createdTime >= ?1 and createdTime <=?2");
		q.setParameter(1, beg);
		q.setParameter(2, end);
		
		return (Double) q.getSingleResult();
	}

	public Double getTimes(Date beg, Date end, int id) {
		Query q = entityManager.createQuery("select sum(number) from Order o where state > 0 "+ "and createdTime >= ?1 and createdTime <=?2 and o.serviceProduct.serviceProject.serviceClass.id=?3 ");
		q.setParameter(1, beg);
		q.setParameter(2, end);
		q.setParameter(3, id);
		
		return (Double) q.getSingleResult();
	}

	public Double getSalesByClass(Date beg, Date end, int id) {
		Query q = entityManager.createQuery("select sum(paid) from Order o where state > 0 "+ "and createdTime >= ?1 and createdTime <=?2 and o.serviceProduct.serviceProject.serviceClass.id=?3 ");
		q.setParameter(1, beg);
		q.setParameter(2, end);
		q.setParameter(3, id);
		
		return (Double) q.getSingleResult();
	}

	public Long getTotalPurchasedUser(Date begDate, Date endDate) {
		Query q = entityManager.createQuery("select count(o) from Order o "
				+ " where o.state>0 and o.createdTime >= ?1 and o.createdTime<=?2");
		q.setParameter(1, begDate);
		q.setParameter(2, endDate);
		return (Long)q.getSingleResult();
	}
	
}
