package com.smart4c.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.smart4c.bean.Coupon;
import com.smart4c.util.Page;
import com.smart4c.util.SqlTools;
import com.smart4c.util.SqlTools.CallBack;

@Repository
public class CouponDao extends AbstractDao<Coupon>{

	public CouponDao() {
		super(Coupon.class);
	}
	
	@SuppressWarnings("unchecked")
	public List<Coupon> findCouponByStatus(){
		Query query = entityManager.createQuery("select c from Coupon c where c.status = 0");
		
		return query.getResultList();
	}
	
	public Coupon findCouponById(int id){
		Query query = entityManager.createQuery("select c from Coupon c where c.id = ?1");
		query.setParameter(1, id);
		return getSingleResultOrNull(query);
	}
	
	@SuppressWarnings("unchecked")
	public List<Coupon> findCouponByMoney(Double money){
		Query query = entityManager.createQuery("selsect c from Coupon c where c.money=1? and c.status =1");
		query.setParameter(1, money);
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Coupon> findCouponByTitle(String title){
		Query query = entityManager.createQuery("selsect c from Coupon c where c.title=1? and c.status =1");
		query.setParameter(1, title);
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Coupon> findCouponByExpriedays(int days){
		Query query = entityManager.createQuery("selsect c from Coupon c where c.exprie_days=1? and c.status =1");
		query.setParameter(1, days);
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Coupon> findCouponByAll(Double money,String title,int days){
		Query query = entityManager.createQuery("selsect c from Coupon c where c.money=1? and c.title = 2? and c.exprie_days=3? and c.status =1");
		query.setParameter(1, days); 
		query.setParameter(2, title);
		query.setParameter(3, days);
		
		return query.getResultList();
	}
	
	public void saveCoupon(Coupon coupon){
		entityManager.merge(coupon);
	}
	
	public int removeCoupon(int id){
		Query query = entityManager.createQuery("delete from Coupon c where c.id = 1?");
		query.setParameter(1, id);
		return query.executeUpdate();
	}

	public long countAll(Page page, String filters) {
		// TODO Auto-generated method stub
		String sql = "select count(o) from Coupon o ";
		String orderBy = " order by " + page.getOrderBy() + " " + page.getOrder();
		if (!page.get_search()) {
			sql += orderBy;
		} else {
			String queryStr = new SqlTools().constructWhere(filters, new CallBack(){
				public String executeField(String f){
					return f;
				}
				
				public String executeData(String f ,String v){
					if("o.status".equals(f)){
						if ("有效".equals(v)) {
							return "0";
						} else {
							return "1";
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
		return (Long)q.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Coupon> getCoupons(Page page, String filters) {
		// TODO Auto-generated method stub
		String sql = "select o from Coupon o ";
		String orderBy = " order by " + page.getOrderBy() + " " + page.getOrder();
		if (!page.get_search()) {
			sql += orderBy;
		} else {
			String queryStr = new SqlTools().constructWhere(filters, new CallBack(){
				public String executeField(String f){
					return f;
				}
				
				public String executeData(String f ,String v){
					if("o.status".equals(f)){
						if ("有效".equals(v)) {
							return "0";
						} else {
							return "1";
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
		q.setFirstResult((page.getCurPageNo() - 1) * page.getPageSize());
		q.setMaxResults(page.getPageSize());
		return q.getResultList();
	}
}
