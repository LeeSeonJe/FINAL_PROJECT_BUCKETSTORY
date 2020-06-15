package com.kh.BucketStory.member.model.vo;

import java.sql.Date;

public class Board {
	private int bNo;
	private String bTitle;
	private String bContent;
	private int bLike;
	private int bCount;
	private Date enrollDate;
	private String status;
	private String userid;
	private int bkNo;

	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(String userid, int bkNo) {
		super();
		this.userid = userid;
		this.bkNo = bkNo;
	}

	public Board(String bTitle, String bContent, String userid, int bkNo) {
		super();
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.userid = userid;
		this.bkNo = bkNo;
	}

	public Board(int bNo, String bTitle, String bContent, int bLike, int bCount, Date enrollDate, String status,
			String userid, int bkNo) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bLike = bLike;
		this.bCount = bCount;
		this.enrollDate = enrollDate;
		this.status = status;
		this.userid = userid;
		this.bkNo = bkNo;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public int getbLike() {
		return bLike;
	}

	public void setbLike(int bLike) {
		this.bLike = bLike;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getBkNo() {
		return bkNo;
	}

	public void setBkNo(int bkNo) {
		this.bkNo = bkNo;
	}

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bLike=" + bLike + ", bCount="
				+ bCount + ", enrollDate=" + enrollDate + ", status=" + status + ", userid=" + userid + ", bkNo=" + bkNo
				+ "]";
	}

}
