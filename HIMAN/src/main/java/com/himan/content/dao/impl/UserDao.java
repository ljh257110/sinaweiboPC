package com.himan.content.dao.impl;

import java.util.UUID;

import javax.annotation.Resource;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import com.himan.content.dao.IUserDao;
import com.himan.content.model.User;
import com.himan.others.WoException;
import com.himan.others.WoResultCode;

@Repository
@Primary
public class UserDao implements IUserDao {
	/**
	 * Recording the log of this class
	 */
	private final static Logger LOG = LogManager.getLogger(UserDao.class);
	public final static WoResultCode USER_PWD = new WoResultCode(1, "用户名或密码不正确");

	@Resource
	private SessionFactory sessionFactory;

	@Override
	public User login(String userPhone,String userPwd) {
		// TODO Auto-generated method stub
		String hql = "from User u where u.userPhone=:userPhone and u.userPwd=:userPwd";
		User user = sessionFactory.getCurrentSession().createQuery(hql, User.class).setParameter("userPhone", userPhone).setParameter("userPwd", userPwd).uniqueResult();
		if(user==null){
			throw new WoException(USER_PWD);	
		} 
		return user;
	}

	@Override
	public void register(User user) {
		// TODO Auto-generated method stub
		user.setUserId(UUID.randomUUID().toString());
		sessionFactory.getCurrentSession().persist(user);

	}
	@Override
	public void changeData(User user, String userPhone) {
		// TODO Auto-enerated method stub
		String hql = "from User u where u.userPhone=:userPhone";
		User user2 = sessionFactory.getCurrentSession().createQuery(hql, User.class)
				.setParameter("userPhone", userPhone).uniqueResult();
		String phone = user2.getUserPhone();
		user.setUserPhone(phone);
		sessionFactory.getCurrentSession().merge(user);
	}

	@Override
	public User find(String userPhone) {
		// TODO Auto-generated method stub
		String hql="from User u where u.userPhone=:userPhone";
		User user = sessionFactory.getCurrentSession().createQuery(hql, User.class).setParameter("userPhone", userPhone).uniqueResult();
		return user;
		
	}

	@Override
	public void updateUserHead(User user) {
		sessionFactory.getCurrentSession().update(user);	
	}

	@Override
	public User getUser(String userId) {
		String hql = "from User u where u.userId = :userId";
		return sessionFactory.getCurrentSession().createQuery(hql,User.class)
		.setParameter("userId", userId).uniqueResult();
		
	}

	

	
	
	
	
}
