package com.smart4c.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.smart4c.bean.Advisory;
import com.smart4c.util.Page;
import com.smart4c.util.Page.OrderByCB;
import com.smart4c.util.SqlTools;
import com.smart4c.util.SqlTools.CallBack;

@Repository
public class AdvisoryDao extends AbstractDao<Advisory> {

	public AdvisoryDao() {
		super(Advisory.class);
	}

	@SuppressWarnings("unchecked")
	public List<Advisory> findAdvisory(){
		Query query = entityManager.createQuery("select a from Advisory a order by a.usetime");
		
		return query.getResultList();
	}
	
	public long countAll(Page page, String filters) {
		String sql = "select count(a) from Advisory a ";
		
		String orderBy = page.getOrderByString(new OrderByCB() {
			public String getOrderBy(String f) {
				return f;
			}
		});
		orderBy = " order by " + orderBy + " " + page.getOrder();
		
		if (!page.get_search()) {
			sql += orderBy;
			//sql += " where a.uutime=null";
		} else {
			String queryStr = new SqlTools().constructWhere(filters, new CallBack() {
				public String executeField(String f) {
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
	public List<Advisory> getQuestions(Page page, String filters) {
		String sql = "select a from Advisory a ";
		String orderBy = page.getOrderByString(new OrderByCB() {
			public String getOrderBy(String f) {
				return f;
			}
		});
		orderBy = " order by " + orderBy + " " + page.getOrder();
		
		if (!page.get_search()) {
			//sql += " where a.uutime=null";
			sql += orderBy;
		} else {
			String queryStr = new SqlTools().constructWhere(filters, new CallBack() {
				public String executeField(String f) {
					return f;
				}

				public String executeData(String f, String v) {
					if ("adv.iscommon".equals(f)) {
						if ("是".equals(v)) {
							return "0";
						} else if ("否".equals(v)) {
							return "1";
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
	
	public void saveNewAdvisory(Advisory advisory){
		entityManager.persist(advisory);
	}
	
	@SuppressWarnings("unchecked")
	public List<Advisory> findAdvisoryByUid(int uid){
		Query query = entityManager.createQuery("select a from Advisory a where a.user.id = ?1");
		query.setParameter(1, uid);
		return query.getResultList();
	}
	
	public boolean deleteAdvisoryByUid(int uid){
		Query query = entityManager.createQuery("delete from Advisory a where a.user.id = ?1");
		query.setParameter(1, uid);
		if(query.executeUpdate() > 0){
			return true;
		}
		return false;
	}
	
	@SuppressWarnings("unchecked")
	public List<Advisory> findAdvisoryByStart(int start,int max){
		Query query = entityManager.createQuery("select a from Advisory a order by a.uutime");
		query.setFirstResult(start);
		query.setMaxResults(max);
		
		return query.getResultList();
	}
	
	public Advisory findAdvisoryByProblam(String content){
		Query query = entityManager.createQuery("select a from Advisory a where a.usecontent = ?1");
		query.setParameter(1, content);
		if(query.getResultList().size() > 0){
			return (Advisory)query.getResultList().get(0);
		}
		return null;
	}
	
	public int batchRemove(String ids) {
		Query q = entityManager.createQuery("delete from Advisory where id in (" + ids + ")");
		return q.executeUpdate();
	}
	
	@SuppressWarnings("unchecked")
	public List<Advisory> findAdvisoryByCommon(){
		Query query = entityManager.createQuery("select a from Advisory a where a.iscommon = '0'");
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Advisory> findAdvisoryBySearch(String search){
		Query query = entityManager.createQuery("select a from Advisory a where a.usecontent like '%" + search + "%' or a.uucontent like '%" + search + "%'");
		
		return query.getResultList();
	}
}
