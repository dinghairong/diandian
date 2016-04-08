package com.smart4c.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.smart4c.bean.UserCoupon;

@Repository
public class UserCouponDao extends AbstractDao<UserCoupon> {

	public UserCouponDao() {
		super(UserCoupon.class);
	}

	@SuppressWarnings("unchecked")
	public List<UserCoupon> findUserCouponByPid(int pid){
		Query query = entityManager.createQuery("select u from UserCoupon u where u.paid.id = ?1");
		query.setParameter(1, pid);
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<UserCoupon> findCouponByCompanyAndStatus(int cid,int state){
		Query query = entityManager.createQuery("select u from UserCoupon u where u.company.id = ?1 and u.status = ?2");
		query.setParameter(1, cid);
		query.setParameter(2, state);
		
		return query.getResultList();
	}
}
