package com.smart4c.dao;

import java.util.List;

import javax.persistence.Query;




import org.springframework.stereotype.Repository;

import com.smart4c.bean.NewsInfo;
import com.smart4c.util.Page;
import com.smart4c.util.Page.OrderByCB;
import com.smart4c.util.SqlTools;
import com.smart4c.util.SqlTools.CallBack;

@Repository
public class NewsInfoDao extends AbstractDao<NewsInfo> {


	public NewsInfoDao(){
		super(NewsInfo.class);
	}
	
	@SuppressWarnings("unchecked")
	public List<NewsInfo> findNewsInfoByVid(int vid){
		Query query = entityManager.createQuery("select n from NewsInfo n where n.serviceShop.vid=?1");
		query.setParameter(1, vid);
		return query.getResultList();
		
	}
	
	public void SaveNewNewsInfo(NewsInfo news){
		entityManager.persist(news);
	}
	
	public void saveNewsInfo(NewsInfo news){
		entityManager.merge(news);
	}
	
	@SuppressWarnings("unused")
	public Long countAll(Page page,String filters) {
		String sql = "select count(ni) from NewsInfo ni ";
		
		String orderBy = page.getOrderByString(
				new OrderByCB() {
					public String getOrderBy(String f) {
						return f;
					}
				});
		orderBy = " order by " + orderBy + " " + page.getOrder();
		
		if (!page.get_search()) {
			sql += orderBy;
		} else {
			String queryStr = new SqlTools().constructWhere(filters, new CallBack() {
				public String executeField(String f){
					return f;
				}
				public String executeData(String f, String v) {
					return v;
				}
			});
			if (!queryStr.isEmpty()) {
				sql += " where " + queryStr;
			}
			sql += orderBy;
		}
				
		Query q = entityManager.createQuery(sql);
		return (Long)q.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<NewsInfo> getNews(Page page,String filters){
		String sql = "select ni from NewsInfo ni ";
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
					if ("ni.isread".equals(f)) {
						if ("已读".equals(v)) {
							return "1";
						} else if ("未读".equals(v)) {
							return "0";
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
	
	
	public int batchRemove(String ids) {
		Query q = entityManager.createQuery("delete from NewsInfo where oid in (" + ids + ")");
		return q.executeUpdate();
	}
	
	public NewsInfo findNewInfoByOid(int oid){
		Query query = entityManager.createQuery("select n from NewsInfo n where n.oid = ?1");
		query.setParameter(1, oid);
		
		if(query.getResultList().size() > 0){
			return (NewsInfo)query.getResultList().get(0);
		}
		return null;
	}
	
	public List<NewsInfo> findNewInfoByServiceShop(int id){
		Query q = entityManager.createQuery("select n from NewsInfo n where n.serviceShop.id = ?1");
		q.setParameter(1, id);
		
		return q.getResultList();
	}
	
	
}
