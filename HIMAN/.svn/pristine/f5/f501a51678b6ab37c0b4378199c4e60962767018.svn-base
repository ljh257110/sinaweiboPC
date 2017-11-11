package com.himan.content.dao;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.himan.content.model.User;
import com.himan.others.WoResultCode;

public interface IUserDao {
	public final static WoResultCode USER_PWD = new WoResultCode(1, "用户名或密码不正确");
	public final static WoResultCode USER_Register = new WoResultCode(2, "注册失败 请重新注册");

	//public User login(String userPhone);

	public void register(User user);

	public void changeData(User user, String userPhone);
      public User find(String userPhone);

	public User login(String userPhone, String userPwd);

	void updateUserHead(User user);

	User getUser(String userId);
}
