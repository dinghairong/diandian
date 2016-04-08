package com.smart4c.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.smart4c.bean.Comment;

@Repository
public class CommentDao extends AbstractDao<Comment>{

	public CommentDao() {
		super(Comment.class);
	}

	@SuppressWarnings("unchecked")
	public List<Comment> findComment(){
		Query query = entityManager.createQuery("select c from Comment c order by c.createdTime");
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Comment> findCommentByProduct(int pid){
		Query query = entityManager.createQuery("select c from Comment c where c.serviceProduct.id = ?1");
		query.setParameter(1, pid);
		
		return query.getResultList();
	}
	
	public void saveNewComment(Comment comment){
		entityManager.persist(comment);
	}
	
	public void saveComment(Comment comment){
		entityManager.merge(comment);
	}
}
