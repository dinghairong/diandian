package com.smart4c.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.smart4c.bean.User;
import com.smart4c.dao.AbstractDao;
import com.smart4c.util.Page;
import com.smart4c.util.SqlTools;
import com.smart4c.util.SqlTools.CallBack;

@Repository
public class UsersDao extends AbstractDao<User>{

	public UsersDao() {
		super(User.class);
	}

	public void saveUser(User user){
		entityManager.merge(user);
	}

	public void saveNewUser(User user){
		entityManager.persist(user);
	}
	
	public User findUserByPhone(String phone){
		Query query = entityManager.createQuery("select u from User u where u.phone = ?1");
		query.setParameter(1, phone);

		return getSingleResultOrNull(query);
	}

	public User findUserById(int id){
		Query query = entityManager.createQuery("select u from User u where u.id = ?1");
		query.setParameter(1, id);

		return (User)query.getSingleResult();
	}

	public boolean findUserByPhone(String phone,String password){
		Query query = entityManager.createQuery("select u from User u where u.phone = ?1 and u.password = ?2");
		query.setParameter(1, phone);
		query.setParameter(2, password);

		if(query.getResultList().size() > 0){
			return true;
		}
		return false;
	}

	public User findByPhone(String phone){
		Query query = entityManager.createQuery("select u from User u where u.phone = ?1");
		query.setParameter(1, phone);

		if(query.getResultList().size() > 0){
			return (User)query.getResultList().get(0);
		}
		return null;
	}

	public User findUserByName(String name){
		Query query = entityManager.createQuery("select u from User u where u.name = ?1");
		query.setParameter(1, name);

		if(query.getResultList().size() > 0){
			return (User)query.getResultList().get(0);
		}
		return null;
	}

	public long countAll(Page page, String filters) {
		// TODO Auto-generated method stub
		String sql = "select count(u) from User u ";
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

	/**
	 * @param page
	 * @param filters
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<User> getUsers(Page page, String filters) {
		String sql = "select u from User u";
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

	public List<User> findByType(byte roleType) {
		Query q = entityManager.createQuery("select r from Role r where r.roleType=?1");
		q.setParameter(1, roleType);
		return q.getResultList();	}

	public int batchRemove(String ids) {
		Query q = entityManager.createQuery("delete from User where uid in (" + ids + ")");
		return q.executeUpdate();
	}

	public Date getEarlistRegisterDate() {
		Query q = entityManager.createQuery("select createdTime from User u where u.status=0");
		Date date = null;
		try {
			date = (Date)q.getSingleResult();
		} catch (Exception e) {
			date = new Date();
		}
		return date;

	}

	public Long getTotalRegisterUser(Date begDate, Date endDate) {
		Query q = entityManager.createQuery("select count(u) from User u where u.createdTime >= ?1 " +
				" and u.createdTime <= ?2 and u.status = 0");
		q.setParameter(1, begDate);
		q.setParameter(2, endDate);
		return (Long) q.getSingleResult();

	}
	
	public Date getCompanyEarlistRegisterDate() {
		Query q = entityManager.createQuery("select createdTime from Company c where  c.status=0 ");
		Date date = null;
		try {
			date = (Date)q.getSingleResult();
		} catch (Exception e) {
			date = new Date();
		}
		return date;

	}

	public Long getCompanyTotalRegisterUser(Date begDate, Date endDate) {
		Query q = entityManager.createQuery("select count(c) from Company c where u.createdTime >= ?1 " +
				" and u.createdTime <= ?2 and u.status = 0");
		q.setParameter(1, begDate);
		q.setParameter(2, endDate);
		return (Long) q.getSingleResult();

	}
	
	
}