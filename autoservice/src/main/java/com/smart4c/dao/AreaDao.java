package com.smart4c.dao;

import com.smart4c.bean.Area;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import java.util.List;

@Repository
public class AreaDao extends AbstractDao<Area> {

	public AreaDao() {
		super(Area.class);
	}
	
	public Area findAreaByid(int cid){
		Query query = entityManager.createQuery("select a from Area a where a.id = ?1");
		query.setParameter(1, cid);
		
		return getSingleResultOrNull(query);
	}

	@SuppressWarnings("unchecked")
	public List<Area> findAllProvince(){
		Query query = entityManager.createQuery("select o from Area o where o.parentid = 0");
		return query.getResultList();
	}


	@SuppressWarnings("unchecked")
	public List<Area> findCityByProvince(int pid){
		Query query = entityManager.createQuery("select o from Area o where o.parentid = ?1");
		query.setParameter(1, pid);
		return query.getResultList();
	}
	
}
