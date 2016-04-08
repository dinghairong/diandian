package com.smart4c.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.smart4c.bean.MyCart;

@Repository
public class MyCartDao extends AbstractDao<MyCart> {

	public MyCartDao() {
		super(MyCart.class);
	}

	public MyCart findMyCartByUserAndProduct(int uid,int pid){
		Query query = entityManager.createQuery("select m from MyCart m where m.user.id = ?1 and m.serviceProduct.id = ?2");
		query.setParameter(1, uid);
		query.setParameter(2, pid);
		
		return getSingleResultOrNull(query);
	}
	
	public MyCart findMyCartByCompanyAndProduct(int cid,int pid){
		Query query = entityManager.createQuery("select m from MyCart m where m.company.id = ?1 and m.serviceProduct.id = ?2");
		query.setParameter(1, cid);
		query.setParameter(2, pid);
		
		return getSingleResultOrNull(query);
	}
	
	@SuppressWarnings("unchecked")
	public List<MyCart> findMyCartByUser(int uid){
		Query query = entityManager.createQuery("select m from MyCart m where m.user.id = ?1");
		query.setParameter(1, uid);
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<MyCart> findMyCartByCompany(int cid){
		Query query = entityManager.createQuery("select m from MyCart m where m.company.id = ?1");
		query.setParameter(1, cid);
		
		return query.getResultList();
	}
	
	public int deleteMyCartByUser(int uid,int pid){
		Query query = entityManager.createQuery("delete from MyCart m where m.user.id = ?1 and m.serviceProduct.id = ?2");
		query.setParameter(1, uid);
		query.setParameter(2, pid);
		
		return query.executeUpdate();
	}
	
	public int deleteMyCartByCompany(int cid,int pid){
		Query query = entityManager.createQuery("delete from MyCart m where m.company.id = ?1 and m.serviceProduct.id = ?2");
		query.setParameter(1, cid);
		query.setParameter(2, pid);
		
		return query.executeUpdate();
	}
	
	public int clearMyCartByUser(int uid){
		Query query = entityManager.createQuery("delete from MyCart m where m.user.id = ?1");
		query.setParameter(1, uid);
		
		return query.executeUpdate();
	}
	
	public int clearMyCartByCompany(int cid){
		Query query = entityManager.createQuery("delete from MyCart m where m.company.id = ?1");
		query.setParameter(1, cid);
		
		return query.executeUpdate();
	}
	
	public void saveNewMyCart(MyCart mycart){
		entityManager.persist(mycart);
	}
	
	public void saveMyCart(MyCart mycart){
		entityManager.merge(mycart);
	}
}
