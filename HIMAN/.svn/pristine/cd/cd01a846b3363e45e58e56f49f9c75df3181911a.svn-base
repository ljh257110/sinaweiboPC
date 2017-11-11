package com.himan.content.dao.impl;




import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.himan.content.dao.ISendDao;
import com.himan.content.model.MImage;
import com.himan.content.model.Message;
import com.himan.content.model.User;

@Repository
public class SendDao implements ISendDao{
	/**
	 * Recording the log of this class.
	 */

	private final static Logger LOG = LogManager.getLogger(SendDao.class);
	
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public void sendWB(Message weiBo) {
		sessionFactory.getCurrentSession().persist(weiBo);
		
	}
	@Override
	public void deleteWB(String messageId) {
		String hql="from Message m where m.messageId= :messageId";
		Message m=sessionFactory.getCurrentSession().createQuery(hql,Message.class).setParameter("messageId",messageId).uniqueResult();
		sessionFactory.getCurrentSession().delete(m);
	}
	@Override
	public void forward(String messageId,String zuserId) {
		String hql="from Message m where m.messageId= :messageId";
		Message m=sessionFactory.getCurrentSession().createQuery(hql, Message.class).setParameter("messageId", messageId).uniqueResult();
		String hql1 = "from User u where u.userId = :userId";
		List<User> list2 = sessionFactory.getCurrentSession().createQuery(hql1,User.class).setParameter("userId", zuserId).getResultList();
		User user = list2.get(0);
		m.setUser(user);
		m.setMessageIsForward(Message.ISFORWARD_YES);
		m.setMessageForwardId((m.getMessageForwardId()+1));
		sessionFactory.getCurrentSession().persist(m);
	}
	@Override
	public void save(MImage m) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().persist(m);
	}
	
	
	
	
	
}
