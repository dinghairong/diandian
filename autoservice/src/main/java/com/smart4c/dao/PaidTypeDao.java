package com.smart4c.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.smart4c.bean.PaidType;

@Repository
public class PaidTypeDao extends AbstractDao<PaidType> {
	public PaidTypeDao() {
		super(PaidType.class);
	}
	
	public PaidType findPaidTypeById(int id){
		Query q = entityManager.createQuery("select p from PaidType p where p.id = ?1");
		q.setParameter(1, id);
		
		return getSingleResultOrNull(q);
	}
	
	public List<PaidType> getAll() {
		Query q = entityManager.createQuery("select p from PaidType p");
		return q.getResultList();
	}
}
