package com.himan.content.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity//包扫描  扫描有entity注解的类  
@Table(name = "user")//映射一张表
public class User {
	private final static Logger LOG = LogManager.getLogger(User.class);
	@Id
	@Column(length = 30)
	private String userId;
	@Column(length = 20, unique = true)
	private String UserName;
	@Column(length = 100)
	private String userHead;
	@Column(length = 50)
	private String userAccount;
	@Column(length = 20)
	private String userPwd;

	@Column(length = 20)
	private String userEmail;
	@Column(length = 10)
	private String userSex;

	@Column(length = 50)
	private String userSchool;
	@Column(length = 50)
	private String userCompany;

	@Column(length = 40)
	private String userPhone;
	@Column(length = 20)
	private String userProvince;
	@Column(length = 20)
	private String userCity;
	@Column(length = 100)
	private String userBlogAddress;

	@Column(length = 20)
	private String userRegisterDate;
	@Column(length = 20)
	private String userBirthday;


	@Column(length = 100)
	private String userBackground;
	@Column(length = 100)
	private String userIntroduce;
	/*@JsonIgnore
	@OneToMany(mappedBy="user",fetch=FetchType.EAGER)
	private List<Message> messages;*/
	/*@JsonIgnore
	@OneToMany(mappedBy="user",fetch=FetchType.EAGER)
	private List<Comment> comments;*/
	/*public List<Message> getMessages() {
		return messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}*/

	/*public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}*/

	/*public List<Collect> getCollects() {
		return collects;
	}

	public void setCollects(List<Collect> collects) {
		this.collects = collects;
	}*/

	/*@JsonIgnore
	@OneToMany(mappedBy="userId",fetch=FetchType.EAGER)
	private List<Collect> collects;*/
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public String getUserHead() {
		return userHead;
	}

	public void setUserHead(String userHead) {
		this.userHead = userHead;
	}

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getUserSchool() {
		return userSchool;
	}

	public void setUserSchool(String userSchool) {
		this.userSchool = userSchool;
	}

	public String getUserCompany() {
		return userCompany;
	}

	public void setUserCompany(String userCompany) {
		this.userCompany = userCompany;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserProvince() {
		return userProvince;
	}

	public void setUserProvince(String userProvince) {
		this.userProvince = userProvince;
	}

	public String getUserCity() {
		return userCity;
	}

	public void setUserCity(String userCity) {
		this.userCity = userCity;
	}

	public String getUserBlogAddress() {
		return userBlogAddress;
	}

	public void setUserBlogAddress(String userBlogAddress) {
		this.userBlogAddress = userBlogAddress;
	}

	public String getUserRegisterDate() {
		return userRegisterDate;
	}

	public void setUserRegisterDate(String userRegisterDate) {
		this.userRegisterDate = userRegisterDate;
	}

	public String getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(String userBirthday) {
		this.userBirthday = userBirthday;
	}

	public String getUserBackground() {
		return userBackground;
	}

	public void setUserBackground(String userBackground) {
		this.userBackground = userBackground;
	}

	public String getUserIntroduce() {
		return userIntroduce;
	}

	public void setUserIntroduce(String userIntroduce) {
		this.userIntroduce = userIntroduce;
	}

}
