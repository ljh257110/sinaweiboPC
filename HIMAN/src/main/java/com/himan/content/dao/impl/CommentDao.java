package com.himan.content.dao.impl;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.himan.content.dao.ICommentDao;
import com.himan.content.model.Comment;
import com.himan.content.model.Message;
@Repository
public class CommentDao implements ICommentDao {
	/**
	 * Recording the log of this class.
	 */

	private final static Logger LOG = LogManager.getLogger(CommentDao.class);
	
	@Resource
	private SessionFactory sessionFactory;
	
	@Override
	public void sendCM(Comment comment) {
		sessionFactory.getCurrentSession().persist(comment);
	}

	@Override
	public void deleteWB(String commentId) {
		String hql="from Comment c where c.commentId= :commentId";
		List<Comment> resultList = sessionFactory.getCurrentSession().createQuery(hql,Comment.class).setParameter("commentId",commentId).getResultList();
		sessionFactory.getCurrentSession().delete(resultList.get(0));
		
	}
}
