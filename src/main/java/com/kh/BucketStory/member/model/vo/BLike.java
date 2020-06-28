package com.kh.BucketStory.member.model.vo;

import java.sql.Date;

import com.kh.BucketStory.common.model.vo.Member;

public class BLike {
	private int loveNo;
	private Date loveDate;
	private int bNo;
	private String userId;

	private Board board;
	private Member bl_member;
	private Member b_member;

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

	public BLike(int loveNo, Date loveDate, int bNo, String userId, Board board, Member bl_member, Member b_member) {
		super();
		this.loveNo = loveNo;
		this.loveDate = loveDate;
		this.bNo = bNo;
		this.userId = userId;
		this.board = board;
		this.bl_member = bl_member;
		this.b_member = b_member;
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

	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}

	public Member getBl_member() {
		return bl_member;
	}

	public void setBl_member(Member bl_member) {
		this.bl_member = bl_member;
	}

	public Member getB_member() {
		return b_member;
	}

	public void setB_member(Member b_member) {
		this.b_member = b_member;
	}

	@Override
	public String toString() {
		return "BLike [loveNo=" + loveNo + ", loveDate=" + loveDate + ", bNo=" + bNo + ", userId=" + userId + ", board="
				+ board + ", bl_member=" + bl_member + ", b_member=" + b_member + "]";
	}

}
