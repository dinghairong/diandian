package com.smart4c.dao;

import com.smart4c.bean.Store;

import org.springframework.stereotype.Repository;

import javax.persistence.Query;

import java.util.List;

@Repository
public class StoreDao extends AbstractDao<Store> {

	public StoreDao() {
		super(Store.class);
	}

	public void saveNewStore(Store store){
		entityManager.persist(store);
	}

	@SuppressWarnings("unchecked")
	public Store findStoreById(int sid){
		Query query = entityManager.createQuery("select o from Store o where o.id = ?1");
		query.setParameter(1, sid);
		
		return getSingleResultOrNull(query);
	}

	@SuppressWarnings("unchecked")
	public List<Store> findAllStore(){
		Query query = entityManager.createQuery("select o from Store o");

		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public int findAllStoreNum(){
		Query query = entityManager.createQuery("select o from Store o");

		List<Store> list = query.getResultList();
		if(null != list && list.size() > 0){
			return list.size();
		}
		return 0;
	}

	@SuppressWarnings("unchecked")
	public Store findStoreByStoreName(String storename){
		Query query = entityManager.createQuery("select o from Store o where o.storename = ?1");
		query.setParameter(1, storename);
		List<Store> storeList = query.getResultList();
		if(null != storeList && 0 < storeList.size()){
			return storeList.get(0);
		}
		return null;
	}



}
