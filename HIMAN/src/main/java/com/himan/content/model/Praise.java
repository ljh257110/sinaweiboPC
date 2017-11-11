package com.himan.content.model;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
@Entity
@Table(name="praise")
public class Praise {
	/**
	 * Recording the log of this class.
	 */
	private final static Logger LOG = LogManager.getLogger(Praise.class);
	/**
	 * Recording the log of this class.
	 */
	@Id
	@Column(length=30)
	private String praiseId;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(iso=ISO.DATE)
	@Column(name="praiseDate")
	private Date praiseDate;
	@Column(length=100)
	private String praiseRemark;
	@ManyToOne
	@JoinColumn(name="userId")
	private User user;
	@ManyToOne
	@JoinColumn(name="messageId")
	private Message message;
	public String getPraiseId() {
		return praiseId;
	}
	public void setPraiseId(String praiseId) {
		this.praiseId = praiseId;
	}
	public Date getPraiseDate() {
		return praiseDate;
	}
	public void setPraiseDate(Date praiseDate) {
		this.praiseDate = praiseDate;
	}
	public String getPraiseRemark() {
		return praiseRemark;
	}
	public void setPraiseRemark(String praiseRemark) {
		this.praiseRemark = praiseRemark;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	
}
