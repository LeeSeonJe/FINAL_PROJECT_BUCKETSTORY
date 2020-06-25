package com.kh.BucketStory.bucket.model.vo;

import java.sql.Date;

import com.kh.BucketStory.common.model.vo.Member;

public class WishList {
	private int wiNo;
	private Date enrollDate;
	private int bkNo;
	private String userId;
	private String bucketId;

	private int cateNum;
	private String cateName;
	private BucketList bucketList;
	private Media media;
	private Member member;
	private ShareBucket shareBucket;

	public WishList() {
	}

	public WishList(int wiNo, Date enrollDate, int bkNo, String userId) {
		super();
		this.wiNo = wiNo;
		this.enrollDate = enrollDate;
		this.bkNo = bkNo;
		this.userId = userId;
	}
	
	

	public WishList(int wiNo, Date enrollDate, int bkNo, String userId, String bucketId) {
		super();
		this.wiNo = wiNo;
		this.enrollDate = enrollDate;
		this.bkNo = bkNo;
		this.userId = userId;
		this.bucketId = bucketId;
	}

	public WishList(int wiNo, Date enrollDate, int bkNo, String userId, int cateNum, String cateName,
			BucketList bucketList, Media media, Member member, ShareBucket shareBucket) {
		super();
		this.wiNo = wiNo;
		this.enrollDate = enrollDate;
		this.bkNo = bkNo;
		this.userId = userId;
		this.cateNum = cateNum;
		this.cateName = cateName;
		this.bucketList = bucketList;
		this.media = media;
		this.member = member;
		this.shareBucket = shareBucket;
	}

	
	public String getBucketId() {
		return bucketId;
	}

	public void setBucketId(String bucketId) {
		this.bucketId = bucketId;
	}

	public ShareBucket getShareBucket() {
		return shareBucket;
	}

	public void setShareBucket(ShareBucket shareBucket) {
		this.shareBucket = shareBucket;
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

	public BucketList getBucketList() {
		return bucketList;
	}

	public void setBucketList(BucketList bucketList) {
		this.bucketList = bucketList;
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
		return "WishList [wiNo=" + wiNo + ", enrollDate=" + enrollDate + ", bkNo=" + bkNo + ", userId=" + userId
				+ ", cateNum=" + cateNum + ", cateName=" + cateName + ", bucketList=" + bucketList + ", media=" + media
				+ ", member=" + member + ", shareBucket=" + shareBucket + "]";
	}

}
