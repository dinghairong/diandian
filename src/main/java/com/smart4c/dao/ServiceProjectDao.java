package com.smart4c.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.smart4c.bean.ServiceProject;

@Repository
public class ServiceProjectDao extends AbstractDao<ServiceProject>{

	public ServiceProjectDao() {
		super(ServiceProject.class);
	}
	
	@SuppressWarnings("unchecked")
	public List<ServiceProject> getAllServiceProject(){
		Query query = entityManager.createQuery("select s from ServiceProject s");
		
		return query.getResultList();
	}
	
	public ServiceProject getServiceProjectById(int sid){
		Query query = entityManager.createQuery("select s from ServiceProject s where s.id = ?1");
		query.setParameter(1, sid);
		
		return getSingleResultOrNull(query);
	}
	
	public List<ServiceProject> getProjectsByClsId(int clsId) {
		// TODO Auto-generated method stub
		Query q = entityManager.createQuery("select distinct sp from ServiceProject sp where sp.serviceClass.id =?1");
		q.setParameter(1, clsId);
		return q.getResultList();
	}
}
