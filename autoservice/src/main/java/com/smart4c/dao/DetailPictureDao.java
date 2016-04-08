package com.smart4c.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.smart4c.bean.DetailPicture;

@Repository
public class DetailPictureDao extends AbstractDao<DetailPicture> {

	public DetailPictureDao() {
		super(DetailPicture.class);
	}

	@SuppressWarnings("unchecked")
	public List<DetailPicture> findDetailPictureByTypeAndObjectid(int type,int objectid){
		Query query = entityManager.createQuery("select d from DetailPicture d where d.type = ?1 and d.objectId = ?2 order by d.publicize");
		query.setParameter(1, type);
		query.setParameter(2, objectid);
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<DetailPicture> getShopThumbnails(int spId) {
		Query q = entityManager.createQuery("select dp from DetailPicture dp where dp.type='0' and dp.status = '0' " +
				"and dp.thumbnail = '1' and dp.objectId = ?1");
		q.setParameter(1, spId);
		return q.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<DetailPicture> getShopDetailPics(int spId) {
		Query q = entityManager.createQuery("select dp from DetailPicture dp where dp.type='2' and dp.status = '0' " +
				"and dp.thumbnail = '0' and dp.objectId = ?1");
		q.setParameter(1, spId);
		return q.getResultList();
	}

}
