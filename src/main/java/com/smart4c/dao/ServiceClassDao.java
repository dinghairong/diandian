package com.smart4c.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.smart4c.bean.ServiceClass;

@Repository
public class ServiceClassDao extends AbstractDao<ServiceClass> {
	
	public ServiceClassDao() {
		super(ServiceClass.class);
	}
	
	@SuppressWarnings("unchecked")
	public List<ServiceClass> getAllClass() {
		Query q = entityManager.createQuery("select sc from ServiceClass sc");
		return q.getResultList();
	}
}
