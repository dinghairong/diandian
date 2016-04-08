package com.smart4c.dao;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.smart4c.bean.CorpOrderNumber;

@Repository
public class CorpOrderNumberDao extends AbstractDao<CorpOrderNumber> {

	public CorpOrderNumberDao() {
		super(CorpOrderNumber.class);
	}

	public void saveNewCorpOrderNumber(CorpOrderNumber corpOrderNumber){
		entityManager.persist(corpOrderNumber);
	}
	
	public void saveCorpOrderNumber(CorpOrderNumber corpOrderNumber){
		entityManager.merge(corpOrderNumber);
	}
	
	public CorpOrderNumber findCorpOrderNumberByOrder(int oid){
		Query query = entityManager.createQuery("select c from CorpOrderNumber c where c.order.id = ?1");
		query.setParameter(1, oid);
		
		return getSingleResultOrNull(query);
	}
}
