package com.smart4c.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.smart4c.bean.InfoClass;

@Repository
public class InfoclassDao extends AbstractDao<InfoClass> {

	public InfoclassDao() {
		super(InfoClass.class);
	}
	
	public List<InfoClass> getAll(){
		Query q = entityManager.createQuery("select i from InfoClass i");
		return q.getResultList();
	}

}
