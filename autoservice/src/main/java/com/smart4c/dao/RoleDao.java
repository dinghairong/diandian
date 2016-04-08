package com.smart4c.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.smart4c.bean.Role;



@Repository
public class RoleDao extends AbstractDao<Role>{

	public RoleDao() {
		super(Role.class);
	}

	public Role find(int id){
		Query q = entityManager.createQuery("select r from Role r where r.id = ?1");
		q.setParameter(1, id);
		return (Role) q.getSingleResult();
	}
	
	public List<Role> getBackendAdminRoles() {
		Query q = entityManager.createQuery("select r from Role r where r.roleType = '0'");
		return q.getResultList();
	}
	
	public List<Role> findByType(byte roleType) {
		// TODO Auto-generated method stub
		Query q = entityManager.createQuery("select r from Role r where r.roleType=?1");
		q.setParameter(1, roleType);
		return q.getResultList();
	}
	
	public Role findByName(String name) {
		Query q = entityManager.createQuery("select r from Role r where r.name = ?1");
		q.setParameter(1, name);
		List<Role> rList = q.getResultList();
		if (rList.size()>0) {
			return rList.get(0);
		}
		return null;
	}
}
