package com.kh.BucketStory.bucket.model.vo;

import java.sql.Date;

public class ComInBucket {
	private int coinbucket;
	private String coId;
	private String bkNo;
	private Date bucketEnroll;
	
	public ComInBucket() {}

	public ComInBucket(int coinbucket, String coId, String bkNo, Date bucketEnroll) {
		super();
		this.coinbucket = coinbucket;
		this.coId = coId;
		this.bkNo = bkNo;
		this.bucketEnroll = bucketEnroll;
	}

	public int getCoinbucket() {
		return coinbucket;
	}

	public void setCoinbucket(int coinbucket) {
		this.coinbucket = coinbucket;
	}

	public String getCoId() {
		return coId;
	}

	public void setCoId(String coId) {
		this.coId = coId;
	}

	public String getBkNo() {
		return bkNo;
	}

	public void setBkNo(String bkNo) {
		this.bkNo = bkNo;
	}

	public Date getBucketEnroll() {
		return bucketEnroll;
	}

	public void setBucketEnroll(Date bucketEnroll) {
		this.bucketEnroll = bucketEnroll;
	}

	@Override
	public String toString() {
		return "ComInBucket [coinbucket=" + coinbucket + ", coId=" + coId + ", bkNo=" + bkNo + ", bucketEnroll="
				+ bucketEnroll + "]";
	}
	
	
}
