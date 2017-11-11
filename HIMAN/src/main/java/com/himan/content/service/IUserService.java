package com.himan.content.service;

import java.util.List;

import com.himan.content.model.Message;
import com.himan.content.model.User;

public interface IUserService {

	public User login(String userPhone, String userPwd);

	public void register(User user);

	public void changeData(User user, String userPhone);

	public User find(String userPhone);

	void updateUserHead(User user);

	List<Message> findMyWei(String userId);

}
