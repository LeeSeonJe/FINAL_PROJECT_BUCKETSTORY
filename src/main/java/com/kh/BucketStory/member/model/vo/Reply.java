package com.kh.BucketStory.member.model.vo;

import java.sql.Date;

import com.kh.BucketStory.common.model.vo.Member;

public class Reply {
	private int rpNo;
	private String rpContent;
	private int cmNo;
	private Date rpDate;
	private String userid;
	private char status;
	private Member rmember;

	public Reply() {
		// TODO Auto-generated constructor stub
	}

	public Reply(int rpNo, String rpContent, int cmNo, Date rpDate, String userid, char status, Member rmember) {
		super();
		this.rpNo = rpNo;
		this.rpContent = rpContent;
		this.cmNo = cmNo;
		this.rpDate = rpDate;
		this.userid = userid;
		this.status = status;
		this.rmember = rmember;
	}

	public int getRpNo() {
		return rpNo;
	}

	public void setRpNo(int rpNo) {
		this.rpNo = rpNo;
	}

	public String getRpContent() {
		return rpContent;
	}

	public void setRpContent(String rpContent) {
		this.rpContent = rpContent;
	}

	public int getCmNo() {
		return cmNo;
	}

	public void setCmNo(int cmNo) {
		this.cmNo = cmNo;
	}

	public Date getRpDate() {
		return rpDate;
	}

	public void setRpDate(Date rpDate) {
		this.rpDate = rpDate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public Member getRmember() {
		return rmember;
	}

	public void setRmember(Member rmember) {
		this.rmember = rmember;
	}

	@Override
	public String toString() {
		return "Reply [rpNo=" + rpNo + ", rpContent=" + rpContent + ", cmNo=" + cmNo + ", rpDate=" + rpDate
				+ ", userid=" + userid + ", status=" + status + ", rmember=" + rmember + "]";
	}

}
