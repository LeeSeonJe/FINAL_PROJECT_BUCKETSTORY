package com.kh.BucketStory.member.model.vo;

import com.kh.BucketStory.common.model.vo.Member;

public class Follow {
	private int fno;
	private String enrolldate;
	private String following;
	private String follower;
	private Member member;

	public Follow() {
		// TODO Auto-generated constructor stub
	}

	public Follow(int fno, String enrolldate, String following, String follower, Member member) {
		super();
		this.fno = fno;
		this.enrolldate = enrolldate;
		this.following = following;
		this.follower = follower;
		this.member = member;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(String enrolldate) {
		this.enrolldate = enrolldate;
	}

	public String getFollowing() {
		return following;
	}

	public void setFollowing(String following) {
		this.following = following;
	}

	public String getFollower() {
		return follower;
	}

	public void setFollower(String follower) {
		this.follower = follower;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "Follow [fno=" + fno + ", enrolldate=" + enrolldate + ", following=" + following + ", follower="
				+ follower + ", member=" + member + "]";
	}

}
