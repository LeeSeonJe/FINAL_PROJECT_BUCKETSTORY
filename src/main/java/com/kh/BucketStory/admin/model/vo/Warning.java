package com.kh.BucketStory.admin.model.vo;

public class Warning {
	private int bkNo;
	private String nickName;
	private int bNo;
	private String userId;
	
	public Warning() {}

	public Warning(int bkNo, String nickName, int bNo, String userId) {
		super();
		this.bkNo = bkNo;
		this.nickName = nickName;
		this.bNo = bNo;
		this.userId = userId;
	}

	public int getBkNo() {
		return bkNo;
	}

	public void setBkNo(int bkNo) {
		this.bkNo = bkNo;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
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
		return "Warning [bkNo=" + bkNo + ", nickName=" + nickName + ", bNo=" + bNo + ", userId=" + userId + "]";
	}

	
}
