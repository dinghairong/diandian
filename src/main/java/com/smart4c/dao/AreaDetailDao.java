package com.smart4c.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.smart4c.bean.AreaDetail;

@Repository
public class AreaDetailDao extends AbstractDao<AreaDetail> {

	public AreaDetailDao() {
		super(AreaDetail.class);
	}
	
	public AreaDetail findAreaByid(int cid){
		Query query = entityManager.createQuery("select a from AreaDetail a where a.id = ?1");
		query.setParameter(1, cid);
		
		return getSingleResultOrNull(query);
	}
	
	@SuppressWarnings("unchecked")
	public List<AreaDetail> findAreaDetailByHot(){
		Query query = entityManager.createQuery("select a from AreaDetail a where a.ishot = 1");
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<AreaDetail> findAllProvince(){
		Query query = entityManager.createQuery("select  a from AreaDetail a");
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<String> findProvince(){
		Query query = entityManager.createQuery("select distinct province from AreaDetail a");
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<AreaDetail> findAllCityByProvince(String province){
		Query query = entityManager.createQuery("select a from AreaDetail a where a.province like '%" + province + "%'");
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<AreaDetail> findAllCountyByCity(String city){
		Query query = entityManager.createQuery("select a from AreaDetail a where a.city = ?1");
		query.setParameter(1, city);
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<AreaDetail> findAreaDetailByFirstLetter(String first){
		Query query = entityManager.createQuery("select a from AreaDetail a where a.firstletter = ?1");
		query.setParameter(1, first);
		
		return query.getResultList();
	}
	
	public List<String> getProvinces() {
		Query q = entityManager.createQuery("select province from AreaDetail group by province order by firstletter");
		return (List<String>)q.getResultList();
	}
	
	public List<String> getCites(String province, String term) {
		Query q = entityManager.createQuery("select distinct city from AreaDetail where province = ?1 and city like ?2");
		q.setParameter(1, province);
		q.setParameter(2, "%"+term+"%");
		return (List<String>)q.getResultList();
	}

	public List<String> getCites(String province) {
		Query q = entityManager.createQuery("select distinct city from AreaDetail where province = ?1");
		q.setParameter(1, province);
		return (List<String>)q.getResultList();
	}
	
	public List<String> getCounties(String province, String city, String term) {
		Query q = entityManager.createQuery("select distinct county from AreaDetail where province =?1 and city =?2 and county like ?3");
		q.setParameter(1, province);
		q.setParameter(2, city);
		q.setParameter(3, "%" + term + "%");
		return (List<String>)q.getResultList();
	}

	public List<String> getCounties(String province, String city) {
		Query q = entityManager.createQuery("select distinct county from AreaDetail where province =?1 and city =?2 ");
		q.setParameter(1, province);
		q.setParameter(2, city);
		return (List<String>)q.getResultList();
	}
	
	public AreaDetail getDefaultArea(String province) {
		Query q = entityManager.createQuery("select a from AreaDetail a where a.province = ?1");
		q.setParameter(1, province);
		List<AreaDetail> aList = q.getResultList();
		if (aList.size() == 0) {
			return null;
		}
		return aList.get(0);
	}

	public AreaDetail findByProvinceCityCounty(String province, String city,
			String county) {
		// TODO Auto-generated method stub
		Query q = entityManager.createQuery("select a from AreaDetail a where a.province=?1 "
				+ " and a.city=?2 and a.county=?3");
		q.setParameter(1, province);
		q.setParameter(2, city);
		q.setParameter(3, county);
		List<AreaDetail> aList = q.getResultList();
		if (aList.size() != 1) {
			return null;
		}
		return aList.get(0);
	}
}
