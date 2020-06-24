package com.kh.BucketStory.bucket.model.vo;

import java.sql.Date;

public class BucketList {

	private int bkNo;
	private String bkName;
	private String bkContent;
	private String tag;
	private Date enrolldate;
	private int bkLike;
	private String userId;
	private String complete;
	private int cateNum;

	private Media media;

	public BucketList() {
	}

	public BucketList(int bkNo, String bkName, String bkContent, String tag, Date enrolldate, int bkLike, String userId,
			String complete, int cateNum) {
		super();
		this.bkNo = bkNo;
		this.bkName = bkName;
		this.bkContent = bkContent;
		this.tag = tag;
		this.enrolldate = enrolldate;
		this.bkLike = bkLike;
		this.userId = userId;
		this.complete = complete;
		this.cateNum = cateNum;
	}

	public BucketList(int bkNo, String bkName, String bkContent, String tag, Date enrolldate, int bkLike, String userId,
			String complete, int cateNum, Media media) {
		super();
		this.bkNo = bkNo;
		this.bkName = bkName;
		this.bkContent = bkContent;
		this.tag = tag;
		this.enrolldate = enrolldate;
		this.bkLike = bkLike;
		this.userId = userId;
		this.complete = complete;
		this.cateNum = cateNum;
		this.media = media;
	}

	public int getBkNo() {
		return bkNo;
	}

	public void setBkNo(int bkNo) {
		this.bkNo = bkNo;
	}

	public String getBkName() {
		return bkName;
	}

	public void setBkName(String bkName) {
		this.bkName = bkName;
	}

	public String getBkContent() {
		return bkContent;
	}

	public void setBkContent(String bkContent) {
		this.bkContent = bkContent;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	public int getBkLike() {
		return bkLike;
	}

	public void setBkLike(int bkLike) {
		this.bkLike = bkLike;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getComplete() {
		return complete;
	}

	public void setComplete(String complete) {
		this.complete = complete;
	}

	public int getCateNum() {
		return cateNum;
	}

	public void setCateNum(int cateNum) {
		this.cateNum = cateNum;
	}

	public Media getMedia() {
		return media;
	}

	public void setMedia(Media media) {
		this.media = media;
	}

	@Override
	public String toString() {
		return "BucketList [bkNo=" + bkNo + ", bkName=" + bkName + ", bkContent=" + bkContent + ", tag=" + tag
				+ ", enrolldate=" + enrolldate + ", bkLike=" + bkLike + ", userId=" + userId + ", complete=" + complete
				+ ", cateNum=" + cateNum + ", media=" + media + "]";
	}

}
