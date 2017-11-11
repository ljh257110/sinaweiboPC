package com.himan.content.service.impl;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.himan.content.dao.IMessageDao;
import com.himan.content.model.Comment;
import com.himan.content.model.Message;
import com.himan.content.service.IMessageService;
@Service
@Primary
@Transactional
public class MessageService implements IMessageService {
	/**
	 * Recording the log of this class.
	 */
	private final static Logger LOG = LogManager.getLogger(MessageService.class);

	@Resource
	private IMessageDao messageDao;
	@Override
	public List<Message> getHotList() {
		// TODO Auto-generated method stub
		return messageDao.getHotList();
	}
	@Override
	public List<Message> getNewestList() {
		// TODO Auto-generated method stub
		return messageDao.getNewestList();
	}
	@Override
	public List<Message> getStarList() {
		// TODO Auto-generated method stub
		return messageDao.getStarList();
	}
	@Override
	public List<Message> getFunnyList() {
		// TODO Auto-generated method stub
		return messageDao.getFunnyList();
	}
	@Override
	public List<Message> getEmotionList() {
		// TODO Auto-generated method stub
		return messageDao.getFunnyList();
	}
	@Override
	public List<Message> getMilitaryList() {
		// TODO Auto-generated method stub
		return messageDao.getFunnyList();
	}
	@Override
	public List<Message> getSocialList() {
		// TODO Auto-generated method stub
		return messageDao.getFunnyList();
	}
	@Override
	public List<Message> getFashionList() {
		// TODO Auto-generated method stub
		return messageDao.getFunnyList();
	}
	@Override
	public List<Message> getSportsList() {
		// TODO Auto-generated method stub
		return messageDao.getFunnyList();
	}
	@Override
	public List<Message> getCartoonList() {
		// TODO Auto-generated method stub
		return messageDao.getFunnyList();
	}
	@Override
	public Message findByMessageId(String messageId) {
		// TODO Auto-generated method stub
		return messageDao.findByMessageId(messageId);
	}
	@Override
	public Message addPraise(String messageId, String userId) {
		// TODO Auto-generated method stub
		
		return messageDao.addPraise(messageId,userId);
	}
	@Override
	public Message collect(String messageId, String userId) {
		// TODO Auto-generated method stub
		return messageDao.collect(messageId,userId);
	}
	@Override
	public List<Message> attention(String userId) {
		// TODO Auto-generated method stub
		return messageDao.attention(userId);
	}
	@Override
	public List<Message> article() {
		// TODO Auto-generated method stub
		return messageDao.article();
	}
	@Override
	public List<Message> singleImage() {
		// TODO Auto-generated method stub
		return messageDao.singleImage();
	}
	@Override
	public List<Message> fourImage() {
		// TODO Auto-generated method stub
		return messageDao.fourImage();
	}
	@Override
	public List<Message> fuzzySearch(String keyword) {
		// TODO Auto-generated method stub
		return messageDao.fuzzySearch(keyword);
	}
	@Override
	public List<Comment> findCommentByMessageId(String messageId) {
		// TODO Auto-generated method stub
		return messageDao.findCommentByMessageId(messageId);
	}
	@Override
	public List<Message> myCollect(String userId) {
		// TODO Auto-generated method stub
		return messageDao.myCollect(userId);
	}
	@Override
	public List<Message> myPraise(String userId) {
		// TODO Auto-generated method stub
		return messageDao.myPraise(userId);
	}
	@Override
	public Message getByMessageId(String messageId) {
		// TODO Auto-generated method stub
		return messageDao.getByMessageId(messageId);
	}
}
