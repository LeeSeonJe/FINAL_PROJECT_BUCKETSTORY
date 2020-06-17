package com.kh.BucketStory.member.model.vo;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.common.model.vo.Member;

public class MemberMyBucketList {
	private int bkNo;
	private int cateNum;
	private String cateName;
	private BucketList bucket;
	private Media media;
	private Member member;

	public MemberMyBucketList() {
		// TODO Auto-generated constructor stub
	}

	public MemberMyBucketList(int bkNo, int cateNum, String cateName, BucketList bucket, Media media, Member member) {
		super();
		this.bkNo = bkNo;
		this.cateNum = cateNum;
		this.cateName = cateName;
		this.bucket = bucket;
		this.media = media;
		this.member = member;
	}

	public int getBkNo() {
		return bkNo;
	}

	public void setBkNo(int bkNo) {
		this.bkNo = bkNo;
	}

	public int getCateNum() {
		return cateNum;
	}

	public void setCateNum(int cateNum) {
		this.cateNum = cateNum;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public BucketList getBucket() {
		return bucket;
	}

	public void setBucket(BucketList bucket) {
		this.bucket = bucket;
	}

	public Media getMedia() {
		return media;
	}

	public void setMedia(Media media) {
		this.media = media;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "MemberMyBucketList [bkNo=" + bkNo + ", cateNum=" + cateNum + ", cateName=" + cateName + ", bucket="
				+ bucket + ", media=" + media + ", member=" + member + "]";
	}

}
