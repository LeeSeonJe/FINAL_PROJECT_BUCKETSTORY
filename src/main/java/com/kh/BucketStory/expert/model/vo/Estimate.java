package com.kh.BucketStory.expert.model.vo;

import java.sql.Date;

public class Estimate {
	private int es_no;
	private int esr_no;
	private String es_content;
	private Date enrollDate;
	private String es_price;
	private String es_option;
	private String es_phone;
	private String userId;
	private String coId;
	private String reviewContent;
	private int reviewScore;
	private int bkNo;
	private int status;
	
	
	public Estimate() {}


	public Estimate(int es_no, int esr_no, String es_content, Date enrollDate, String es_price, String es_option,
			String es_phone, String userId, String coId, String reviewContent, int reviewScore, int bkNo, int status) {
		super();
		this.es_no = es_no;
		this.esr_no = esr_no;
		this.es_content = es_content;
		this.enrollDate = enrollDate;
		this.es_price = es_price;
		this.es_option = es_option;
		this.es_phone = es_phone;
		this.userId = userId;
		this.coId = coId;
		this.reviewContent = reviewContent;
		this.reviewScore = reviewScore;
		this.bkNo = bkNo;
		this.status = status;
	}


	public int getEs_no() {
		return es_no;
	}


	public void setEs_no(int es_no) {
		this.es_no = es_no;
	}


	public int getEsr_no() {
		return esr_no;
	}


	public void setEsr_no(int esr_no) {
		this.esr_no = esr_no;
	}


	public String getEs_content() {
		return es_content;
	}


	public void setEs_content(String es_content) {
		this.es_content = es_content;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public String getEs_price() {
		return es_price;
	}


	public void setEs_price(String es_price) {
		this.es_price = es_price;
	}


	public String getEs_option() {
		return es_option;
	}


	public void setEs_option(String es_option) {
		this.es_option = es_option;
	}


	public String getEs_phone() {
		return es_phone;
	}


	public void setEs_phone(String es_phone) {
		this.es_phone = es_phone;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getCoId() {
		return coId;
	}


	public void setCoId(String coId) {
		this.coId = coId;
	}


	public String getReviewContent() {
		return reviewContent;
	}


	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}


	public int getReviewScore() {
		return reviewScore;
	}


	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}


	public int getBkNo() {
		return bkNo;
	}


	public void setBkNo(int bkNo) {
		this.bkNo = bkNo;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Estimate [es_no=" + es_no + ", esr_no=" + esr_no + ", es_content=" + es_content + ", enrollDate="
				+ enrollDate + ", es_price=" + es_price + ", es_option=" + es_option + ", es_phone=" + es_phone
				+ ", userId=" + userId + ", coId=" + coId + ", reviewContent=" + reviewContent + ", reviewScore="
				+ reviewScore + ", bkNo=" + bkNo + ", status=" + status + "]";
	}
	
	
}
