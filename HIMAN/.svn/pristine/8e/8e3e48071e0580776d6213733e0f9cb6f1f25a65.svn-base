package com.himan.content.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
@Entity
@Table(name="m_image")
public class MImage {
	/**
	 * Recording the log of this class.
	 */
	private final static Logger LOG = LogManager.getLogger(MImage.class);
	@Id
	@Column(length=200)
	private String mImageId;
	@Column(length=100)
	private String url;
	public String getmImageId() {
		return mImageId;
	}
	public void setmImageId(String mImageId) {
		this.mImageId = mImageId;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
}
