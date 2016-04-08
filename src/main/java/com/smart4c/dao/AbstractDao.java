package com.smart4c.dao;


import com.smart4c.bean.AbstractModel;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Transactional
public abstract class AbstractDao<T extends AbstractModel<?>> {
	protected Class<T> modelClass;

	@PersistenceContext
	protected EntityManager entityManager = null;

	public EntityManager getEntityManager() {
		return entityManager;
	}

	protected AbstractDao(Class<T> modelClass) {
		this.modelClass = modelClass;
	}

	/**
	 * aka update
	 */
	public void merge(T o) {
		entityManager.merge(o);
	}

	/**
	 * aka create
	 */
	public void persist(T o) {
		entityManager.persist(o);
	}

	/**
	 * You can only remove attached instances.
	 */
	public void remove(T o) {
		entityManager.remove(o);
	}

	/**
	 * You can only refresh attached instances.
	 */
	public void refresh(T o) {
		entityManager.refresh(o);
	}

	public T find(Object id) {
		return (entityManager.find(modelClass, id));
	}

	public void remove(Object id) {
		T abstractModel = find(id);
		if (abstractModel != null) remove(abstractModel);
	}

	protected T getSingleResultOrNull(Query query) {
		query.setMaxResults(1);
		
		@SuppressWarnings("unchecked")
		List<T> results = query.getResultList();
		if (results.size() == 1) return (results.get(0));
		else if (results.size() == 0) return (null);
		else throw (new NonUniqueResultException("SingleResult requested but result was not unique : " + results.size()));
	}

	public int getCountAll() {
		// new JPA way of doing it, but our hibernate is too old or doesn't support primitives yet?
		// String sqlCommand="select count(*) from "+modelClass.getSimpleName();
		// Query query = entityManager.createNativeQuery(sqlCommand, Integer.class);
		// return((Integer)query.getSingleResult());

		String tableName = modelClass.getSimpleName();
		javax.persistence.Table t= modelClass.getAnnotation(javax.persistence.Table.class);
		if(t != null && t.name() != null && t.name().length()>0) {
			tableName = t.name();
		}

		// older hibernate work around
		String sqlCommand = "select count(*) from " + tableName;
		Query query = entityManager.createNativeQuery(sqlCommand);
		return (((Number) query.getSingleResult()).intValue());
	}
}

