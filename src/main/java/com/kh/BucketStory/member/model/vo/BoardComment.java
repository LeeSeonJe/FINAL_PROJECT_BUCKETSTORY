package com.kh.BucketStory.member.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.BucketStory.common.model.vo.Member;

public class BoardComment {
	private int cmNo;
	private String cmContent;
	private Date enrollDate;
	private int bNo;
	private String userid;
	private int secret;
	private char status;
	private Member member;
	private ArrayList<Reply> reply;

	public BoardComment() {
		// TODO Auto-generated constructor stub
	}

	public BoardComment(int cmNo, String cmContent, Date enrollDate, int bNo, String userid, int secret, char status,
			ArrayList<Reply> reply) {
		super();
		this.cmNo = cmNo;
		this.cmContent = cmContent;
		this.enrollDate = enrollDate;
		this.bNo = bNo;
		this.userid = userid;
		this.secret = secret;
		this.status = status;
		this.reply = reply;
	}

	public BoardComment(int cmNo, String cmContent, Date enrollDate, int bNo, String userid, int secret, char status,
			Member member, ArrayList<Reply> reply) {
		super();
		this.cmNo = cmNo;
		this.cmContent = cmContent;
		this.enrollDate = enrollDate;
		this.bNo = bNo;
		this.userid = userid;
		this.secret = secret;
		this.status = status;
		this.member = member;
		this.reply = reply;
	}

	public int getCmNo() {
		return cmNo;
	}

	public void setCmNo(int cmNo) {
		this.cmNo = cmNo;
	}

	public String getCmContent() {
		return cmContent;
	}

	public void setCmContent(String cmContent) {
		this.cmContent = cmContent;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getSecret() {
		return secret;
	}

	public void setSecret(int secret) {
		this.secret = secret;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public ArrayList<Reply> getReply() {
		return reply;
	}

	public void setReply(ArrayList<Reply> reply) {
		this.reply = reply;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "BoardComment [cmNo=" + cmNo + ", cmContent=" + cmContent + ", enrollDate=" + enrollDate + ", bNo=" + bNo
				+ ", userid=" + userid + ", secret=" + secret + ", status=" + status + ", member=" + member + ", reply="
				+ reply + "]";
	}

}
