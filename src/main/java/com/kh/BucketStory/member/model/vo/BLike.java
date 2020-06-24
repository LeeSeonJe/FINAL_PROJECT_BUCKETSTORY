package com.kh.BucketStory.member.model.vo;

import java.sql.Date;

public class BLike {
	private int loveNo;
	private Date loveDate;
	private int bNo;
	private String userId;

	public BLike() {
		// TODO Auto-generated constructor stub
	}

	public BLike(int loveNo, Date loveDate, int bNo, String userId) {
		super();
		this.loveNo = loveNo;
		this.loveDate = loveDate;
		this.bNo = bNo;
		this.userId = userId;
	}

	public int getLoveNo() {
		return loveNo;
	}

	public void setLoveNo(int loveNo) {
		this.loveNo = loveNo;
	}

	public Date getLoveDate() {
		return loveDate;
	}

	public void setLoveDate(Date loveDate) {
		this.loveDate = loveDate;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "bLike [loveNo=" + loveNo + ", loveDate=" + loveDate + ", bNo=" + bNo + ", userId=" + userId + "]";
	}

}
