package com.kh.BucketStory.bucket.model.vo;

import java.sql.Date;

public class ShareBucket {
	private int sbNo;
	private int bkNo;
	private String userId;
	private Date enrollDate;
	
	public ShareBucket() {}

	public ShareBucket(int sbNo, int bkNo, String userId, Date enrollDate) {
		super();
		this.sbNo = sbNo;
		this.bkNo = bkNo;
		this.userId = userId;
		this.enrollDate = enrollDate;
	}

	public int getSbNo() {
		return sbNo;
	}

	public void setSbNo(int sbNo) {
		this.sbNo = sbNo;
	}

	public int getBkNo() {
		return bkNo;
	}

	public void setBkNo(int bkNo) {
		this.bkNo = bkNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "ShareBucket [sbNo=" + sbNo + ", bkNo=" + bkNo + ", userId=" + userId + ", enrollDate=" + enrollDate
				+ "]";
	}
	
}
