package com.himan.content.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.aspectj.bridge.IMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.himan.content.dao.IMessageDao;
import com.himan.content.dao.IUserDao;
import com.himan.content.model.Message;
import com.himan.content.model.User;
import com.himan.content.service.IUserService;
import com.himan.others.WoException;
import com.himan.others.WoResultCode;

/**
 * 
 * @author dg
 *
 */
@Service
@Transactional
@Primary
public class UserService implements IUserService {
	
	@Autowired
	private IUserDao userDao;
	
	@Resource
	private IMessageDao messageDao;
	
	private final static Logger LOG = LogManager.getLogger(UserService.class);
	
	// private IUserDao userDao;
	public User login(String userPhone, String userPwd) {
		// TODO Auto-generated method stub
		User user = userDao.login(userPhone,userPwd);

		return user;
	}

	@Override
	public void register(User user) {
		// TODO Auto-generated method stub
		userDao.register(user);
	}
	
	@Override
	public void changeData(User user, String userPhone) {
		// TODO Auto-generated method stub
		userDao.changeData(user, userPhone);
	}

	@Override
	public User find(String userPhone) {
		// TODO Auto-generated method stub
		userDao.find(userPhone);

		return null;
	}

	@Override
	public void updateUserHead(User user) {
		// TODO Auto-generated method stub
		userDao.updateUserHead(user);
	}

	@Override
	public List<Message> findMyWei(String userId) {
		// TODO Auto-generated method stub
//		User user = userDao.getUser(userId);
		List<Message> messgaes = messageDao.getAllMessages(userId);
		return messgaes;
	}

	

	
}
