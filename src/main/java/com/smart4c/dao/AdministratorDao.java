package com.smart4c.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.smart4c.bean.Administrator;
import com.smart4c.bean.User;
import com.smart4c.util.Page;
import com.smart4c.util.SqlTools;
import com.smart4c.util.SqlTools.CallBack;

@Repository
public class AdministratorDao extends AbstractDao<Administrator> {
	public AdministratorDao() {
		super(Administrator.class);
	}

	public Administrator findUserByName(String name) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from Administrator u where u.name = ?1");
		query.setParameter(1, name);
		
		if(query.getResultList().size() > 0){
			return (Administrator)query.getResultList().get(0);
		}
		return null;
	}
	
	

	public long countAll(Page page, String filters) {
		// TODO Auto-generated method stub
		String sql = "select count(u) from Administrator u ";
		String orderBy = page.getOrderBy();
		orderBy = " order by " + orderBy + " " + page.getOrder();
		
		if (!page.get_search()) {
			sql += " where u.status = '0' ";
			sql += orderBy;
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
				sql += " where u.status='0' and " + queryStr;
			} else {
				sql += " where u.status = '0' ";
			}
			
			sql += orderBy;
		}
				
		Query q = entityManager.createQuery(sql);
		return (Long)q.getSingleResult();
	}

	public List<Administrator> getUsers(Page page, String filters) {
		// TODO Auto-generated method stub
		String sql = "select u from Administrator u ";
		String orderBy = page.getOrderBy();
		orderBy = " order by " + orderBy + " " + page.getOrder();
		
		if (!page.get_search()) {
			sql += " where u.status = '0' ";
			sql += orderBy;
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
				sql += " where u.status='0' and " + queryStr;
			} else {
				sql += " where u.status = '0' ";
			}
			
			sql += orderBy;
		}
				
		Query q = entityManager.createQuery(sql);
		q.setFirstResult((page.getCurPageNo() - 1) * page.getPageSize());
		q.setMaxResults(page.getPageSize());
		return q.getResultList();
	}
	
	public int batchRemove(String ids) {
		Query q = entityManager.createQuery("delete from Administrator where id in (" + ids + ")");
		return q.executeUpdate();
	}
}
