package com.kh.BucketStory.expert.model.vo;

import java.sql.Date;

public class EsRequest {
	private int esr_no;
	private Date esr_enrollDate;
	private Date esr_startDate;
	private Date esr_endDate;
	private String precautions;
	private String userId;
	private String coId;
	private String bkNo;
	
	public EsRequest() {}
	
	public EsRequest(int esr_no, Date esr_enrollDate, Date esr_startDate, Date esr_endDate, String precautions,
			String userId, String coId, String bkNo) {
		super();
		this.esr_no = esr_no;
		this.esr_enrollDate = esr_enrollDate;
		this.esr_startDate = esr_startDate;
		this.esr_endDate = esr_endDate;
		this.precautions = precautions;
		this.userId = userId;
		this.coId = coId;
		this.bkNo = bkNo;
	}
	public int getEsr_no() {
		return esr_no;
	}
	public void setEsr_no(int esr_no) {
		this.esr_no = esr_no;
	}
	public Date getEsr_enrollDate() {
		return esr_enrollDate;
	}
	public void setEsr_enrollDate(Date esr_enrollDate) {
		this.esr_enrollDate = esr_enrollDate;
	}
	public Date getEsr_startDate() {
		return esr_startDate;
	}
	public void setEsr_startDate(Date esr_startDate) {
		this.esr_startDate = esr_startDate;
	}
	public Date getEsr_endDate() {
		return esr_endDate;
	}
	public void setEsr_endDate(Date esr_endDate) {
		this.esr_endDate = esr_endDate;
	}
	public String getPrecautions() {
		return precautions;
	}
	public void setPrecautions(String precautions) {
		this.precautions = precautions;
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
	public String getBkNo() {
		return bkNo;
	}
	public void setBkNo(String bkNo) {
		this.bkNo = bkNo;
	}
	@Override
	public String toString() {
		return "EsRequest [esr_no=" + esr_no + ", esr_enrollDate=" + esr_enrollDate + ", esr_startDate=" + esr_startDate
				+ ", esr_endDate=" + esr_endDate + ", Precautions=" + precautions + ", userId=" + userId + ", coId="
				+ coId + ", bkNo=" + bkNo + "]";
	}
	
	
}
