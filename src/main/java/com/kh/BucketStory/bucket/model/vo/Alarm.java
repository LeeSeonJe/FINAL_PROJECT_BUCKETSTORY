package com.kh.BucketStory.bucket.model.vo;

import java.sql.Date;

public class Alarm {
	private int aNum;
	private Date aDate;
	private String aLink;
	private String aContent;
	private String aCheck;
	private String userId;
	private String coId;
	
	public Alarm() {
	}
	
	
	public Alarm(int aNum, Date aDate, String aLink, String aContent, String aCheck, String userId, String coId) {
		super();
		this.aNum = aNum;
		this.aDate = aDate;
		this.aLink = aLink;
		this.aContent = aContent;
		this.aCheck = aCheck;
		this.userId = userId;
		this.coId = coId;
	}


	public int getaNum() {
		return aNum;
	}
	public void setaNum(int aNum) {
		this.aNum = aNum;
	}
	public Date getaDate() {
		return aDate;
	}
	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}
	public String getaLink() {
		return aLink;
	}
	public void setaLink(String aLink) {
		this.aLink = aLink;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public String getaCheck() {
		return aCheck;
	}
	public void setaCheck(String aCheck) {
		this.aCheck = aCheck;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCoId() {
		return coId;
	}
	public void setCoId(String coId) {
		this.coId = coId;
	}
	@Override
	public String toString() {
		return "Alarm [aNum=" + aNum + ", aDate=" + aDate + ", aLink=" + aLink + ", aContent=" + aContent + ", aCheck="
				+ aCheck + ", userId=" + userId + ", coId=" + coId + "]";
	}
	
	
}
