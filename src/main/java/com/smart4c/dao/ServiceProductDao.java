package com.smart4c.dao;

import java.util.List;

import javax.persistence.Query;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Repository;

import com.smart4c.bean.ServiceProduct;
import com.smart4c.util.Page;
import com.smart4c.util.Page.LeftJoinCB;
import com.smart4c.util.Page.OrderByCB;
import com.smart4c.util.SqlTools;
import com.smart4c.util.SqlTools.CallBack;


@Repository
public class ServiceProductDao extends AbstractDao<ServiceProduct>{

	public ServiceProductDao() {
		super(ServiceProduct.class);
	}
	
	@SuppressWarnings("unchecked")
	public List<ServiceProduct> findAllServiceProduct(){
		Query query = entityManager.createQuery("select s from ServiceProduct s");
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<ServiceProduct> findServiceProductByProgectIdAndNum(int pid,int num,int start){
		Query query = entityManager.createQuery("select s from ServiceProduct s where s.serviceProject.id = ?1");
		query.setParameter(1, pid);
		if(num > 0){
			query.setMaxResults(num);
			query.setFirstResult(start);
		}
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<ServiceProduct> findServiceProductByOrder(int pid,int num,int start,String order){
		Query query = entityManager.createQuery("select s from ServiceProduct s where s.serviceProject.id = ?1 order by " + order);
		query.setParameter(1, pid);
		if(num > 0){
			query.setMaxResults(num);
			query.setFirstResult(start);
		}
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<ServiceProduct> findServiceProductByFuzzyAndNum(String fuzzy,int num,int start){
		String sql = "select s from ServiceProduct s where s.title like '%" + fuzzy + "%' or s.serviceProject.name like '%" + fuzzy + "%' or s.serviceProject.serviceClass.name like '%"  + fuzzy +"%' or s.abstract_ like '" + fuzzy + "' or s.description like '%" + fuzzy +"%' or s.accessory like '%" + fuzzy + "%'";
		Query query = entityManager.createQuery(sql);
		if(num > 0){
			query.setMaxResults(num);
			query.setFirstResult(start);
		}
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<ServiceProduct> findServiceProductByFuzzyAndNumAndOrder(String fuzzy,int num,int start,String order){
		String sql = "select s from ServiceProduct s where s.title like '%" + fuzzy + "%' or s.serviceProject.name like '%" + fuzzy + "%' or s.serviceProject.serviceClass.name like '%"  + fuzzy +"%' or s.abstract_ like '" + fuzzy + "' or s.description like '%" + fuzzy +"%' or s.accessory like '%" + fuzzy + "%' order by " + order;
		Query query = entityManager.createQuery(sql);
		if(num > 0){
			query.setMaxResults(num);
			query.setFirstResult(start);
		}
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<ServiceProduct> findServiceProductByFirst(int service_class_id){
		Query query = entityManager.createQuery("select s from ServiceProduct s where s.serviceProject.serviceClass.id = ?1 and s.isfirst = 1");
		query.setParameter(1, service_class_id);
		
		return query.getResultList();
	}
	
	public ServiceProduct findServiceProductById(int pid){
		Query query = entityManager.createQuery("select s from ServiceProduct s where s.id = ?1");
		query.setParameter(1, pid);
		
		return getSingleResultOrNull(query);
	}
	
	@SuppressWarnings("unchecked")
	public List<ServiceProduct> getProductsByProjId(int projId) {
		Query q = entityManager.createQuery("select sp from ServiceProduct sp where sp.status = '0' and sp.serviceProject.id = ?1");
		q.setParameter(1, projId);
		return q.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<ServiceProduct> getProductsByProjId(int projId, boolean all) {
		String sql = "select sp from ServiceProduct sp where ";
		if (!all) {
			sql += " sp.status = '0' and ";
		} 
		sql += "sp.serviceProject.id = ?1";
		Query q = entityManager.createQuery(sql);
		q.setParameter(1, projId);
		return q.getResultList();
	}

	public long countAll(Page page, String filters) {
		String sql = "select count(s) from ServiceProduct s ";
		String leftJoin = page.getLeftJoinString(new LeftJoinCB(){
			public String getLeftJoin(boolean _search, String orderBy, String filters) {
				if (!_search) {
					if (orderBy.equals("class")) {
						return "left join s.serviceProject.serviceClass sc ";
					} else if (orderBy.equals("project")) {
						return "left join s.serviceProject spj";
					} else {
						return "";
					}
				} else {
					JSONObject jsono = JSONObject.fromObject(filters);
					JSONArray jsonArr = (JSONArray)jsono.get("rules");
					int i = 0;
					String leftJoin = "";
					for (; i<jsonArr.size(); i++) {
						String field = (String) jsonArr.getJSONObject(i).get("field");
						if (field.equals("class")) {
							leftJoin += "left join s.serviceProject.serviceClass sc ";
						} else if (field.equals("project")) {
							leftJoin += "left join s.serviceProject spj ";
						}
					}
					return leftJoin;
				}
			}
		});
		
		String orderBy = page.getOrderByString(new OrderByCB() {
			public String getOrderBy(String f) {
				if (f.equals("class")) {
					return "sc.name";
				} else if (f.equals("project")) {
					return "spj.name";
				} 
				return f;
			}
		});
		orderBy = " order by " + orderBy + " " + page.getOrder();
		
		if (!page.get_search()) {
			sql += leftJoin;
			sql += orderBy;
		} else {
			sql += leftJoin;
			String queryStr = new SqlTools().constructWhere(filters, new CallBack() {
				public String executeField(String f) {
					if (f.equals("class")) {
						return "sc.name";
					} else if (f.equals("project")) {
						return "spj.name";
					}
					return f;
				}

				public String executeData(String f, String v) {
					if (f.equals("s.status")) {
						if (v.equals("已下架")) {
							return "1";
						} else if (v.equals("上架")) {
							return "0";
						}
					}
					if (f.equals("s.isfirst")) {
						if (v.equals("是")) {
							return "1";
						} else {
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
		return (Long)q.getSingleResult();
	}

	@SuppressWarnings("unchecked")
	public List<ServiceProduct> getProductList(Page page, String filters) {
		
		String sql = "select s from ServiceProduct s ";
		String leftJoin = page.getLeftJoinString(new LeftJoinCB(){
			public String getLeftJoin(boolean _search, String orderBy, String filters) {
				if (!_search) {
					if (orderBy.equals("class")) {
						return "left join s.serviceProject.serviceClass sc ";
					} else if (orderBy.equals("project")) {
						return "left join s.serviceProject spj";
					} else if (orderBy.equals("s.id")) {
						return "left join s.serviceProject.serviceClass sc left join s.serviceProject spj";
					} else {
						return "";
					}
				} else {
					JSONObject jsono = JSONObject.fromObject(filters);
					JSONArray jsonArr = (JSONArray)jsono.get("rules");
					int i = 0;
					String leftJoin = "";
					for (; i<jsonArr.size(); i++) {
						String field = (String) jsonArr.getJSONObject(i).get("field");
						if (field.equals("class")) {
							leftJoin += "left join s.serviceProject.serviceClass sc ";
						} else if (field.equals("project")) {
							leftJoin += "left join s.serviceProject spj ";
						}
					}
					return leftJoin;
				}
			}
		});
		
		String orderBy = page.getOrderByString(new OrderByCB() {
			public String getOrderBy(String f) {
				if (f.equals("class")) {
					return "sc.name";
				} else if (f.equals("project")) {
					return "spj.name";
				} 
				return f;
			}
		});
		orderBy = " order by " + orderBy + " " + page.getOrder();
		
		if (!page.get_search()) {
			sql += leftJoin;
			if (orderBy.indexOf("s.id") != -1) {
				sql += " order by sc.name, spj.name, s.id " + page.getOrder();
			} else {
				sql += orderBy;
			}
			
		} else {
			sql += leftJoin;
			String queryStr = new SqlTools().constructWhere(filters, new CallBack() {
				public String executeField(String f) {
					if (f.equals("class")) {
						return "sc.name";
					} else if (f.equals("project")) {
						return "spj.name";
					}
					return f;
				}

				public String executeData(String f, String v) {
					if (f.equals("s.status")) {
						if (v.equals("已下架")) {
							return "1";
						} else if (v.equals("上架")) {
							return "0";
						}
					}
					if (f.equals("s.isfirst")) {
						if (v.equals("是")) {
							return "1";
						} else {
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

	@SuppressWarnings("unchecked")
	public Long getCountProductsByServiceClassId(Page page,int scId) {
		String sql = "select count(*) from ServiceProduct s left join s.serviceProject spj where spj.serviceClass.id=?1 order by s.isfirst,s.id";
		Query q = entityManager.createQuery(sql);
		q.setParameter(1, scId);

		return (Long)q.getSingleResult();
	}

	@SuppressWarnings("unchecked")
	public List<ServiceProduct> getProductsByServiceClassId(Page page, int scId) {
		String sql = "select s from ServiceProduct s left join s.serviceProject spj where spj.serviceClass.id=?1 order by s.isfirst,s.id";
		Query q = entityManager.createQuery(sql);
		q.setParameter(1, scId);
		q.setFirstResult((page.getCurPageNo() - 1) * page.getPageSize());
		q.setMaxResults(page.getPageSize());
		return q.getResultList();
	}


}
