package com.smart4c.dao;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.smart4c.bean.ServiceshopService;

@Repository
public class ServiceshopServiceDao extends AbstractDao<ServiceshopService>{
	public ServiceshopServiceDao() {
		super(ServiceshopService.class);
	}
	
	public List<ServiceshopService> findBySSIDOrderByClassProject(int ssid) {
		Query q = entityManager.createQuery("select s from ServiceshopService s where s.serviceshop.id = ?1" +
				" and s.serviceProduct.status = '0'" +
				" order by s.serviceProduct.serviceProject.serviceClass.name, s.serviceProduct.serviceProject.name");
		q.setParameter(1, ssid);
		return q.getResultList();
	}
	
	public Set<Integer> getSPIDySSID(int ssid, boolean all) {
		String sql = "select distinct s.serviceProduct.id from ServiceshopService s where ";
		if (!all) {
			sql += " s.serviceProduct.status = '0' and ";
		}
		sql += " s.serviceshop.id = ?1 ";
		Query q = entityManager.createQuery(sql);
		q.setParameter(1, ssid);
		return new HashSet<Integer>(q.getResultList());
	}

	public ServiceshopService find(int ssId, int id) {
		// TODO Auto-generated method stub
		Query q = entityManager.createQuery("select sps from ServiceshopService sps where sps.serviceshop.id = ?1 and " +
				" sps.serviceProduct.id = ?2");
		q.setParameter(1, ssId);
		q.setParameter(2, id);
		List<ServiceshopService> spsList = q.getResultList();
		if (spsList.size() == 0) {
			return null;
		}
		
		return spsList.get(0);
	}

	public int deleteServiceshopServiceByService(int ssid,int spid){
		Query query = entityManager.createQuery("delete from ServiceshopService s where s.serviceshop.id = ?1 and s.serviceProduct.id = ?2");
		query.setParameter(1, ssid);
		query.setParameter(2, spid);
		
		return query.executeUpdate();
	}
	
	public void saveNewServiceshopService(ServiceshopService serviceshopService){
		entityManager.persist(serviceshopService);
	}
	
	public void saveServiceshopService(ServiceshopService serviceshopService){
		entityManager.merge(serviceshopService);
	}
}
