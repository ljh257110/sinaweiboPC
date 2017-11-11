package com.himan.content.service.impl;
import javax.transaction.Transactional;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.himan.content.dao.ISendDao;
import com.himan.content.model.MImage;
import com.himan.content.model.Message;
import com.himan.content.service.ISendService;
@Service
@Transactional
public class SendService implements ISendService{
	/**
	 * Recording the log of this class.
	 */

	private final static Logger LOG = LogManager.getLogger(SendService.class);
	@Autowired
	private ISendDao sendDao;
	@Override
	public void sendWB(Message weiBo) {
		sendDao.sendWB(weiBo);		
	}
	@Override
	public void deleteWB(String messageId) {
		sendDao.deleteWB(messageId);		
		
	}
	@Override
	public void forward(String messageId,String zuserId) {
		sendDao.forward(messageId,zuserId);
		
	}
	@Override
	public void save(MImage m) {
		// TODO Auto-generated method stub
		sendDao.save(m);
	}
	

	

	
	
	

	
	
	
	




}
