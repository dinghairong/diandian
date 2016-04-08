package com.smart4c.dao;

import java.util.List;

import javax.persistence.Query;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.smart4c.util.Page.OrderByCB;
import com.smart4c.util.Page.LeftJoinCB;
import com.smart4c.util.SqlTools;
import com.smart4c.util.SqlTools.CallBack;
import com.smart4c.bean.ServiceShop;
import com.smart4c.util.Page;

@Repository
public class ServiceShopDao extends AbstractDao<ServiceShop>{
	public ServiceShopDao() {
		super(ServiceShop.class);
	}
	
	public void updateLicense(String path, String license,int id) {
		Query q = entityManager.createQuery("update ServiceShop s set s.license=?1, s.path=?2 where s.id=?3");
		q.setParameter(1, license);
		q.setParameter(2, path);
		q.setParameter(3, id);
		q.executeUpdate();
	}
	
	public void updateShopImg(String path, String img, int id) {
		Query q = entityManager.createQuery("update ServiceShop s set s.image=?1, s.path=?2 where s.id=?3");
		q.setParameter(1, img);
		q.setParameter(2, path);
		q.setParameter(3, id);
		q.executeUpdate();
	}

	public long countAll(Page page, String filters) {
		// TODO Auto-generated method stub
		String sql = "select count(s) from ServiceShop s ";
		String leftJoin = page.getLeftJoinString(new LeftJoinCB(){
			public String getLeftJoin(boolean _search, String orderBy, String filters) {
				if (!_search) {
					if (orderBy.equals("province") || orderBy.equals("city") || orderBy.equals("county")) {
						return "left join s.areaDetail ad ";
					} else if (orderBy.equals("paidtype")) {
						return "left join s.paidtype p ";
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
						if (field.equals("province") || field.equals("city") || field.equals("county")) {
							leftJoin += "left join s.areaDetail ad ";
						} else if (field.equals("paidtype")) {
							leftJoin += "left join s.paidtype p ";
						}
					}
					return leftJoin;
				}
			}
		});
		
//		String orderBy = page.getOrderByString(new OrderByCB() {
//			public String getOrderBy(String f) {
//				if (f.equals("province")) {
//					return "ad.province";
//				} else if (f.equals("city")) {
//					return "ad.city";
//				} else if (f.equals("county")) {
//					return "ad.county";
//				} else if (f.equals("paidtype")) {
//					return "p.name";
//				}
//				return f;
//			}
//		});
		//orderBy = " order by " + orderBy + " " + page.getOrder();
		
		if (!page.get_search()) {
			sql += leftJoin;
			//sql += orderBy;
		} else {
			sql += leftJoin;
			String queryStr = new SqlTools().constructWhere(filters, new CallBack() {
				public String executeField(String f) {
					if (f.equals("province")) {
						return "ad.province";
					} else if (f.equals("city")) {
						return "ad.city";
					} else if (f.equals("county")) {
						return "ad.county";
					} else if (f.equals("paidtype")) {
						return "p.name";
					}
					return f;
				}

				public String executeData(String f, String v) {
					if (f.equals("s.status")) {
						if (v.equals("审核通过")) {
							return "0";
						} else if (v.equals("待审核")) {
							return "1";
						} else if (v.equals("已删除")) {
							return "2";
						}
					}
					return v;
				}
			});
			if (!queryStr.isEmpty()) {
				sql += " where " + queryStr;
			} 
			
			//sql += orderBy;
		}
				
		Query q = entityManager.createQuery(sql);
		return (Long)q.getSingleResult();
	}
	
	public List<ServiceShop> getShopList(Page page, String filters) {
		// TODO Auto-generated method stub
		String sql = "select s from ServiceShop s ";
		String leftJoin = page.getLeftJoinString(new LeftJoinCB(){
			public String getLeftJoin(boolean _search, String orderBy, String filters) {
				if (!_search) {
					if (orderBy.equals("province") || orderBy.equals("city") || orderBy.equals("county")) {
						return "left join s.areaDetail ad ";
					} else if (orderBy.equals("paidtype")) {
						return "left join s.paidtype p ";
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
						if (field.equals("province") || field.equals("city") || field.equals("county")) {
							leftJoin += "left join s.areaDetail ad ";
						} else if (field.equals("paidtype")) {
							leftJoin += "left join s.paidtype p ";
						}
					}
					return leftJoin;
				}
			}
		});
		
		String orderBy = page.getOrderByString(new OrderByCB() {
			public String getOrderBy(String f) {
				if (f.equals("province")) {
					return "ad.province";
				} else if (f.equals("city")) {
					return "ad.city";
				} else if (f.equals("county")) {
					return "ad.county";
				} else if (f.equals("paidtype")) {
					return "p.name";
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
					if (f.equals("province")) {
						return "ad.province";
					} else if (f.equals("city")) {
						return "ad.city";
					} else if (f.equals("county")) {
						return "ad.county";
					} else if (f.equals("paidtype")) {
						return "p.name";
					}
					return f;
				}

				public String executeData(String f, String v) {
					if (f.equals("s.status")) {
						if (v.equals("审核通过")) {
							return "0";
						} else if (v.equals("待审核")) {
							return "1";
						} else if (v.equals("已删除")) {
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

	public ServiceShop findByPhone(String phone) {
		// TODO Auto-generated method stub
		Query q = entityManager.createQuery("select s from ServiceShop s where s.phone = ?1 and s.status='0'");
		q.setParameter(1, phone);
		List<ServiceShop> sList = q.getResultList();
		if (sList.size() == 0) {
			return null;
		}
		return sList.get(0);
	}

	public int batchRemove(String ids) {
		// TODO Auto-generated method stub
		Query q = entityManager.createNativeQuery("update serviceshop set phone=concat('@#del',phone), status='2' where id in ("
				+ ids + ")");
		return q.executeUpdate();
	}
	
	@SuppressWarnings("unchecked")
	public List<ServiceShop> findAllServiceShop(){
		Query q = entityManager.createQuery("select s from ServiceShop s");
		
		return q.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<ServiceShop> findServiceShopByCity(String city){
		Query q = entityManager.createQuery("select s from ServiceShop s where s.areaDetail.city = ?1");
		q.setParameter(1, city);
		
		return q.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<ServiceShop> findServiceShopByProvince(String province){
		Query q = entityManager.createQuery("select s from ServiceShop s where s.areaDetail.province like '%" + province + "%'");
		
		return q.getResultList();
	}
	
	public ServiceShop findServiceShopById(int id){
		Query q = entityManager.createQuery("select s from ServiceShop s where s.id = ?1");
		q.setParameter(1, id);
		
		return getSingleResultOrNull(q);
	}
	
	public ServiceShop findServiceShopByPhone(String phone){
		Query q = entityManager.createQuery("select s from ServiceShop s where s.phone = ?1");
		q.setParameter(1, phone);
		
		return getSingleResultOrNull(q);
	}

	public List<ServiceShop> queryServiceShopByPhone(String phone){
		Query q = entityManager.createQuery("select s from ServiceShop s where s.phone like ?1");
		q.setParameter(1, "%" + phone + "%");

		return q.getResultList();
	}
	
	public void saveNewServiceShop(ServiceShop serviceShop){
		entityManager.persist(serviceShop);
	}
	
	public void saveServiceShop(ServiceShop serviceShop){
		entityManager.merge(serviceShop);
	}

	public long countShAll(Page page, String filters) {
		// TODO Auto-generated method stub
		String sql = "select count(s) from ServiceShop s ";
		String leftJoin = page.getLeftJoinString(new LeftJoinCB(){
			public String getLeftJoin(boolean _search, String orderBy, String filters) {
				if (!_search) {
					if (orderBy.equals("province") || orderBy.equals("city") || orderBy.equals("county")) {
						return "left join s.areaDetail ad ";
					} else if (orderBy.equals("paidtype")) {
						return "left join s.paidtype p ";
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
						if (field.equals("province") || field.equals("city") || field.equals("county")) {
							leftJoin += "left join s.areaDetail ad ";
						} else if (field.equals("paidtype")) {
							leftJoin += "left join s.paidtype p ";
						}
					}
					return leftJoin;
				}
			}
		});
		
		String orderBy = page.getOrderByString(new OrderByCB() {
			public String getOrderBy(String f) {
				if (f.equals("province")) {
					return "ad.province";
				} else if (f.equals("city")) {
					return "ad.city";
				} else if (f.equals("county")) {
					return "ad.county";
				} else if (f.equals("paidtype")) {
					return "p.name";
				}
				return f;
			}
		});
		orderBy = " order by " + orderBy + " " + page.getOrder();
		
		if (!page.get_search()) {
			sql += leftJoin;
			sql += " where s.status='1' ";
			sql += orderBy;
		} else {
			sql += leftJoin;
			String queryStr = new SqlTools().constructWhere(filters, new CallBack() {
				public String executeField(String f) {
					if (f.equals("province")) {
						return "ad.province";
					} else if (f.equals("city")) {
						return "ad.city";
					} else if (f.equals("county")) {
						return "ad.county";
					} else if (f.equals("paidtype")) {
						return "p.name";
					}
					return f;
				}

				public String executeData(String f, String v) {
					if (f.equals("s.status")) {
						if (v.equals("审核通过")) {
							return "0";
						} else if (v.equals("待审核")) {
							return "1";
						} else if (v.equals("已删除")) {
							return "2";
						}
					}
					return v;
				}
			});
			if (!queryStr.isEmpty()) {
				sql += " where s.status='1' and " + queryStr;
			} else {
				sql += " where s.status='1' ";
			}
			
			sql += orderBy;
		}
				
		Query q = entityManager.createQuery(sql);
		return (Long)q.getSingleResult();
	}

	public List<ServiceShop> getShopShList(Page page, String filters) {
		// TODO Auto-generated method stub
		String sql = "select s from ServiceShop s ";
		String leftJoin = page.getLeftJoinString(new LeftJoinCB(){
			public String getLeftJoin(boolean _search, String orderBy, String filters) {
				if (!_search) {
					if (orderBy.equals("province") || orderBy.equals("city") || orderBy.equals("county")) {
						return "left join s.areaDetail ad ";
					} else if (orderBy.equals("paidtype")) {
						return "left join s.paidtype p ";
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
						if (field.equals("province") || field.equals("city") || field.equals("county")) {
							leftJoin += "left join s.areaDetail ad ";
						} else if (field.equals("paidtype")) {
							leftJoin += "left join s.paidtype p ";
						}
					}
					return leftJoin;
				}
			}
		});
		
		String orderBy = page.getOrderByString(new OrderByCB() {
			public String getOrderBy(String f) {
				if (f.equals("province")) {
					return "ad.province";
				} else if (f.equals("city")) {
					return "ad.city";
				} else if (f.equals("county")) {
					return "ad.county";
				} else if (f.equals("paidtype")) {
					return "p.name";
				}
				return f;
			}
		});
		orderBy = " order by " + orderBy + " " + page.getOrder();
		
		if (!page.get_search()) {
			sql += leftJoin;
			sql += " where s.status='1' ";
			sql += orderBy;
		} else {
			sql += leftJoin;
			String queryStr = new SqlTools().constructWhere(filters, new CallBack() {
				public String executeField(String f) {
					if (f.equals("province")) {
						return "ad.province";
					} else if (f.equals("city")) {
						return "ad.city";
					} else if (f.equals("county")) {
						return "ad.county";
					} else if (f.equals("paidtype")) {
						return "p.name";
					}
					return f;
				}

				public String executeData(String f, String v) {
					if (f.equals("s.status")) {
						if (v.equals("审核通过")) {
							return "0";
						} else if (v.equals("待审核")) {
							return "1";
						} else if (v.equals("已删除")) {
							return "2";
						}
					}
					return v;
				}
			});
			if (!queryStr.isEmpty()) {
				sql += " where s.status='1' and " + queryStr;
			} else {
				sql += " where s.status='1' ";
			}
			
			sql += orderBy;
		}
				
		Query q = entityManager.createQuery(sql);
		q.setFirstResult((page.getCurPageNo() - 1) * page.getPageSize());
		q.setMaxResults(page.getPageSize());
		return q.getResultList();
	}

	public List<ServiceShop> searchShops(String term) {
		// TODO Auto-generated method stub
		Query q = entityManager.createQuery("select o from ServiceShop o where o.status='0' and o.title like ?1");
		q.setParameter(1, "%" + term + "%");
		return q.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<ServiceShop> findAllServiceShopByState(){
		Query query = entityManager.createQuery("select s from ServiceShop s where s.status = '0'");
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<ServiceShop> findServiceShopByPlace(String province,String city,int order1,int order2){
		String condition = "";
		String sql = "";
		if(order2 != 2){
			sql = "select s ,count(a) as aa from ServiceShop s left join s.comments a where s.status = 0";
		}else{
			sql = "select s from ServiceShop s where s.status = 0";
		}
		if(null != province && province.length() > 0){
			sql = sql + " and s.areaDetail.province = '" + province + "'";
		}
		if(null != city && city.length() > 0){
			sql = sql + " and s.areaDetail.city = '" + city + "'";
		}
		if(order1 != 2){
			if(order1 == 0){
				condition = " order by s.id desc";
			}else{
				condition = " order by s.id asc";
			}
		}else{
			if(order2 != 2){
				if(order2 == 0){
					condition = " order by aa desc";
				}else{
					condition = " order by aa asc";
				}
			}
		}
		sql = sql + condition;
		Query query = entityManager.createQuery(sql);
		
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<ServiceShop> findServiceShopByArea(String province,
			String city, String county) {
		Query q = entityManager.createQuery("select s from ServiceShop s where s.status = 0 and s.areaDetail.province = '" + province + "' and s.areaDetail.city = '" + city + "' and s.areaDetail.county = '" + county + "'");
		return q.getResultList();
	}
	public Long countServiceShopPageByArea(String province, String city, String county) {
		String sql ="select count(*) from ServiceShop s where s.status = 0 and s.areaDetail.province = '" + province+"'";
		if(StringUtils.isNotEmpty(city)){
			sql=sql+" and s.areaDetail.city = '" + city+"'";
		}
		if(StringUtils.isNotEmpty(county)){
			sql = sql + " and s.areaDetail.county = '" + county + "'";
		}
		Query q = entityManager.createQuery(sql);
		return (Long)q.getSingleResult();
	}

	public List<ServiceShop> findServiceShopPageByArea(Page page,String province, String city, String county) {
		String sql ="select s from ServiceShop s where s.status = 0 and s.areaDetail.province = '" + province+"'";
		if(StringUtils.isNotEmpty(city)){
			sql=sql+" and s.areaDetail.city = '" + city+"'";
		}
		if(StringUtils.isNotEmpty(county)){
			sql = sql + " and s.areaDetail.county = '" + county + "'";
		}
		Query q = entityManager.createQuery(sql);
		q.setFirstResult((page.getCurPageNo() - 1) * page.getPageSize());
		q.setMaxResults(page.getPageSize());
		return q.getResultList();
	}
	
}
