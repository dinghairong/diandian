package com.smart4c.dao;

import com.smart4c.bean.UserExternal;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

@Repository
public class UserExternalDao extends AbstractDao<UserExternal> {

	public UserExternalDao() {
		super(UserExternal.class);
	}

	public UserExternal findUserExternalByUserId(String type, String userId){
		Query query = entityManager.createQuery("select ue from UserExternal ue where ue.type = ?1 and ue.userId = ?2");
		query.setParameter(1, type);
		query.setParameter(2, userId);

		List<UserExternal> list = new ArrayList<UserExternal>();
			list = query.getResultList();
		if(list != null && list.size() > 0){
			return (UserExternal)list.get(0);
		}
		return null;
	}
}
