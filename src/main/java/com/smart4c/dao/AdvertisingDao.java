package com.smart4c.dao;

import java.util.List;

import javax.persistence.Query;
import org.springframework.stereotype.Repository;

import com.smart4c.bean.Advertising;
@Repository
public class AdvertisingDao extends AbstractDao<Advertising>{

	public AdvertisingDao() {
		super(Advertising.class);
	}

	@SuppressWarnings("unchecked")
	public List<Advertising> findAdvByLocation(int location){
		Query query = entityManager.createQuery("select a from Advertising a where a.location = ?1 and a.status = '0'");
		query.setParameter(1, location);
		
		return query.getResultList();
	}
}
