package com.himan.content.service.impl;
import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.himan.content.dao.ICommentDao;
import com.himan.content.model.Comment;
import com.himan.content.service.ICommentService;
@Service
@Transactional
public class CommentService implements ICommentService {
	/**
	 * Recording the log of this class.
	 */

	private final static Logger LOG = LogManager.getLogger(CommentService.class);
	
	@Resource
	private ICommentDao commentDao;
	@Override
	public void sendCM(Comment comment) {
		
		commentDao.sendCM(comment);
	}
	@Override
	public void deleteWB(String commentId) {
		commentDao.deleteWB(commentId);
		
	}
}
