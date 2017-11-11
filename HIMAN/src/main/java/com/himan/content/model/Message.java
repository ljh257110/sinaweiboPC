package com.himan.content.model;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name="message")
public class Message {
	/**
	 * Recording the log of this class.
	 */

	private final static Logger LOG = LogManager.getLogger(Message.class);
	public final static String TYPE_FUNNY = "1";
	public final static String TYPE_EMOTION = "2";
	public final static String TYPE_MILITARY = "3";
	public final static String TYPE_SOCIAL = "4";
	public final static String TYPE_FASHION = "5";
	public final static String TYPE_SPORTS = "6";
	public final static String TYPE_CARTOON = "7";
	
	public final static String ISPRAISE_YES = "1";
	public final static String ISPRAISE_NO = "0";
	
	public final static String ISCOLLECT_YES = "1";
	public final static String ISCOLLECT_NO = "0";
	
	public final static String ISFORWARD_YES = "1";
	public final static String ISFORWARD_NO = "0";

	@Id
	@Column(length=200)
	private String messageId;
	
	@ManyToOne
	@JoinColumn(name="userId")
	private User user;
	
	@Column(length=300)
	private String messageContent;

	@Column(name="messageCollect")
	private String messageCollect;

	public String getMessageCollect() {
		return messageCollect;
	}

	public void setMessageCollect(String messageCollect) {
		this.messageCollect = messageCollect;
	}

	@Column(name="messageForward")
	private int messageForward;
	
	@Column(name="messageReview")
	private int messageReview;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(iso=ISO.DATE)
	@Column(name="messageDate")
	private Date messageDate;
	
	@Column(length=50)
	private String messageIsForward;
	
	@Column(length=30)
	private String messageForwardId;
	
	@Column(length=100)
	private String messageLink;
	
	@Column(length=100)
	private String messageRemark;
	
	@Column(length=50)
	private String messageIsCollect;
	
	@Column(name="messagePraise")
	private int messagePraise;

	@Column(length=10)
	private String messageIsPraise;
	
	@Column(length=50)
	private String messageType;
	
	@Column(length=100)
	private String messageTile;
	@JsonIgnore
	@OneToMany(mappedBy="message")
	private List<Comment> comments;
	/*@JsonIgnore
	@OneToMany(mappedBy="message")
	private List<Collect> collects;*/
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="message_mImage",
	joinColumns = { @JoinColumn(name = "messageId") }, 
	inverseJoinColumns = {@JoinColumn(name = "mImageId") })
	private List<MImage> mImages;

	public List<MImage> getmImages() {
		return mImages;
	}

	public void setmImages(List<MImage> mImages) {
		this.mImages = mImages;
	}

	public String getMessageId() {
		return messageId;
	}

	public void setMessageId(String messageId) {
		this.messageId = messageId;
	}


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public int getMessageForward() {
		return messageForward;
	}

	public void setMessageForward(int messageForward) {
		this.messageForward = messageForward;
	}

	public int getMessageReview() {
		return messageReview;
	}

	public void setMessageReview(int messageReview) {
		this.messageReview = messageReview;
	}

	public Date getMessageDate() {
		return messageDate;
	}

	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}

	public String getMessageIsForward() {
		return messageIsForward;
	}

	public void setMessageIsForward(String messageIsForward) {
		this.messageIsForward = messageIsForward;
	}

	public String getMessageForwardId() {
		return messageForwardId;
	}

	public void setMessageForwardId(String messageForwardId) {
		this.messageForwardId = messageForwardId;
	}

	public String getMessageLink() {
		return messageLink;
	}

	public void setMessageLink(String messageLink) {
		this.messageLink = messageLink;
	}

	public String getMessageRemark() {
		return messageRemark;
	}

	public void setMessageRemark(String messageRemark) {
		this.messageRemark = messageRemark;
	}

	public String getMessageIsCollect() {
		return messageIsCollect;
	}

	public void setMessageIsCollect(String messageIsCollect) {
		this.messageIsCollect = messageIsCollect;
	}

	public int getMessagePraise() {
		return messagePraise;
	}

	public void setMessagePraise(int messagePraise) {
		this.messagePraise = messagePraise;
	}

	public String getMessageIsPraise() {
		return messageIsPraise;
	}

	public void setMessageIsPraise(String messageIsPraise) {
		this.messageIsPraise = messageIsPraise;
	}

	public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}


	public String getMessageTile() {
		return messageTile;
	}

	public void setMessageTile(String messageTile) {
		this.messageTile = messageTile;
	}
	
	
	
}
