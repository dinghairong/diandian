package com.smart4c.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.smart4c.bean.Company;
import com.smart4c.util.Page;
import com.smart4c.util.SqlTools;
import com.smart4c.util.SqlTools.CallBack;

@Repository
public class CompanyDao extends AbstractDao<Company>{

	protected CompanyDao() {
		super(Company.class);
	}
	
	public Company findCompanyById(int cid){
		Query query = entityManager.createQuery("select c from Company c where c.id = ?1");
		query.setParameter(1, cid);
		
		return getSingleResultOrNull(query);
	}

	@SuppressWarnings("unchecked")
	public List<Company> findAllCompanyByPhone(String phone){
		Query query = entityManager.createQuery("select c from Company c where c.phone = ?1");
		query.setParameter(1, phone);
		
		return query.getResultList();
	}
	
	public Company findCompanyByPhone(String phone){
		Query query = entityManager.createQuery("select c from Company c where c.phone = ?1");
		query.setParameter(1, phone);
		
		return getSingleResultOrNull(query);
	}
	
	public boolean findCompanyByPhone(String phone,String password){
		Query query = entityManager.createQuery("select c from Company c where c.phone = ?1 and c.password = ?2");
		query.setParameter(1, phone);
		query.setParameter(2, password);
		
		if(query.getResultList().size() > 0){
			return true;
		}
		return false;
	}
	
	@SuppressWarnings("unchecked")
	public List<Company> findCompanyUserByMasterId(int masterid){
		Query query = entityManager.createQuery("select c from Company c where c.masterId = ?1");
		query.setParameter(1, masterid);
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Company> findCompanyUserBySearchAndId(String search,int id){
		Query query = entityManager.createQuery("select c from Company c where c.masterId = ?1 and (c.company like '%" + search + "%' or c.phone like '%" + search + "%')");
		query.setParameter(1, id);
		
		return query.getResultList();
	}
	
	public int deleteCompanyById(int id){
		Query query = entityManager.createQuery("delete from Company c where c.id = ?1");
		query.setParameter(1, id);
		
		return query.executeUpdate();
	}

	public void saveCompany(Company company){
		entityManager.merge(company);
	}
	
	public void saveNewCompany(Company company){
		entityManager.persist(company);
	}

	public long countAll(Page page, String filters) {
		// TODO Auto-generated method stub
		String sql = "select count(o) from Company o ";
		String orderBy = page.getOrderBy();
		orderBy = " order by " + orderBy + " " + page.getOrder();
		
		if (!page.get_search()) {
			sql += " where o.status='0' ";
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
				sql += " where o.status='0' and " + queryStr;
			} else {
				sql += " where o.status='0' ";
			}
			
			sql += orderBy;
		}
				
		Query q = entityManager.createQuery(sql);
		return (Long)q.getSingleResult();
	}

	public List<Company> getComList(Page page, String filters) {
		// TODO Auto-generated method stub
		String sql = "select o from Company o ";
		String orderBy = page.getOrderBy();
		orderBy = " order by " + orderBy + " " + page.getOrder();
		
		if (!page.get_search()) {
			sql += " where o.status='0' and o.role.name = 'company' ";
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
				sql += " where o.status='0' and o.role.name = 'company'  and " + queryStr;
			} else {
				sql += " where o.status='0' and o.role.name = 'company'";
			}
			
			sql += orderBy;
		}
				
		Query q = entityManager.createQuery(sql);
		q.setFirstResult((page.getCurPageNo() - 1) * page.getPageSize());
		q.setMaxResults(page.getPageSize());
		return q.getResultList();
	}
	
	public int batchRemove(String ids) {
		// TODO Auto-generated method stub
		Query q = entityManager.createNativeQuery("update company set phone=concat('@#del',phone), status='1' where id in ("
				+ ids + ")");
		return q.executeUpdate();
	}
}
