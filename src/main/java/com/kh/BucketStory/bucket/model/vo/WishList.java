package com.kh.BucketStory.bucket.model.vo;

import java.sql.Date;

public class WishList {
	private int wiNo;
	private Date enrollDate;
	private int bkNo;
	private String userId;
	
	public WishList() {}

	public WishList(int wiNo, Date enrollDate, int bkNo, String userId) {
		super();
		this.wiNo = wiNo;
		this.enrollDate = enrollDate;
		this.bkNo = bkNo;
		this.userId = userId;
	}

	public int getWiNo() {
		return wiNo;
	}

	public void setWiNo(int wiNo) {
		this.wiNo = wiNo;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
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

	@Override
	public String toString() {
		return "WishList [wiNo=" + wiNo + ", enrollDate=" + enrollDate + ", bkNo=" + bkNo + ", userId=" + userId + "]";
	}
	
}
