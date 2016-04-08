package com.smart4c.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.smart4c.bean.Prepaid;
import com.smart4c.util.Page;
import com.smart4c.util.SqlTools;
import com.smart4c.util.SqlTools.CallBack;

@Repository
public class PrepaidDao extends AbstractDao<Prepaid> {

	public PrepaidDao() {
		super(Prepaid.class);
	}
	
	public void saveNewPrepaid(Prepaid prepaid){
		entityManager.persist(prepaid);
	}

	public void savePrepaid(Prepaid prepaid){
		entityManager.merge(prepaid);
	}

	public long countAll(Page page, String filters) {
		// TODO Auto-generated method stub
		String sql = "select count(o) from Prepaid o ";
		String orderBy = " order by " + page.getOrderBy() + " " + page.getOrder();
		if(!page.get_search()){
			sql += orderBy;
		}else{
			String queryStr = new SqlTools().constructWhere(filters, new CallBack(){
				public String executeField(String f){
					return f;
				}
				
				public String executeData(String f ,String v){
					if("o.state".equals(f)){
						if ("成功".equals(v)) {
							return "0";
						} else {
							return "1";
						}
					}
					return v;
				}
			});
			if(!queryStr.isEmpty()){
				sql +=" "+ "where " +" "+ queryStr;
			}
			sql += orderBy;
		}
		Query q = entityManager.createQuery(sql);
		return (Long) q.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Prepaid> findPrepaidByCompanyAndMonth(int cid,Date year1,Date year2){
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String sql = "select p from Prepaid p where p.company.id = '" + cid + "' and p.state = '0' and p.createdTime > '" + df.format(year1) + "' and p.createdTime < '" + df.format(year2) + "'";
		
		Query query = entityManager.createQuery(sql);
		
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Prepaid> getHistory(Page page, String filters) {
		String sql = "select o from Prepaid o";
		String orderBy = " order by " + page.getOrderBy() + " " + page.getOrder();
		if(!page.get_search()){
			sql += orderBy;
		}else{
			String queryStr = new SqlTools().constructWhere(filters, new CallBack(){
				public String executeField(String f){
					return f;
				}
				
				public String executeData(String f ,String v){
					if("o.state".equals(f)){
						if ("成功".equals(v)) {
							return "0";
						} else {
							return "1";
						}
					}
					return v;
				}
			});
			if(!queryStr.isEmpty()){
				sql += " where " + queryStr;
			}
			sql += orderBy;
		}
		Query q = entityManager.createQuery(sql);
		q.setFirstResult((page.getCurPageNo() - 1) * page.getPageSize());
		q.setMaxResults(page.getPageSize());
		return q.getResultList();
	}
	
	public Prepaid findPrepaidBySerialnumber(String serialnumber){
		Query query = entityManager.createQuery("select p from Prepaid p where p.serialnumber = ?1");
		query.setParameter(1, serialnumber);
		
		return getSingleResultOrNull(query);
	}
}
