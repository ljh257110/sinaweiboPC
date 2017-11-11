package com.himan.content.dao;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.himan.content.model.Comment;
public interface ICommentDao {

	public void sendCM(Comment comment);

	public void deleteWB(String commentId);

}
