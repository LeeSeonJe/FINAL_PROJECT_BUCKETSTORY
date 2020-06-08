package com.kh.BucketStory.expert.model.vo;

import java.sql.Date;

public class Company {
	
	private String coId;
	private String coPwd;
	private String coName;
	private String compaName;
	private String apName;
	private String homePage;
	private String coTel;
	private Date enrollDate;
	private char status;
	private char approval;
	private String busiEmail;
	private int cpCheck;
	private String checkImg;
	private int point;
	private int cateNum;
	private String coIntro;
	private String coInfo;
	
	public Company() {}
	
	public Company(String coId, String coPwd, String coName, String compaName, String apName, String homePage,
			String coTel, Date enrollDate, char status, char approval, String busiEmail, int cpCheck, String checkImg,
			int point, int cateNum, String coIntro, String coInfo) {
		super();
		this.coId = coId;
		this.coPwd = coPwd;
		this.coName = coName;
		this.compaName = compaName;
		this.apName = apName;
		this.homePage = homePage;
		this.coTel = coTel;
		this.enrollDate = enrollDate;
		this.status = status;
		this.approval = approval;
		this.busiEmail = busiEmail;
		this.cpCheck = cpCheck;
		this.checkImg = checkImg;
		this.point = point;
		this.cateNum = cateNum;
		this.coIntro = coIntro;
		this.coInfo = coInfo;
	}

	public Company(String coId, String coName, String homePage, String coTel, Date enrollDate, String busiEmail,
			int cpCheck, String checkImg, int cateNum, String coIntro, String coInfo) {
		super();
		this.coId = coId;
		this.coName = coName;
		this.homePage = homePage;
		this.coTel = coTel;
		this.enrollDate = enrollDate;
		this.busiEmail = busiEmail;
		this.cpCheck = cpCheck;
		this.checkImg = checkImg;
		this.cateNum = cateNum;
		this.coIntro = coIntro;
		this.coInfo = coInfo;
	}

	public String getCoId() {
		return coId;
	}

	public void setCoId(String coId) {
		this.coId = coId;
	}

	public String getCoPwd() {
		return coPwd;
	}

	public void setCoPwd(String coPwd) {
		this.coPwd = coPwd;
	}

	public String getCoName() {
		return coName;
	}

	public void setCoName(String coName) {
		this.coName = coName;
	}

	public String getCompaName() {
		return compaName;
	}

	public void setCompaName(String compaName) {
		this.compaName = compaName;
	}

	public String getApName() {
		return apName;
	}

	public void setApName(String apName) {
		this.apName = apName;
	}

	public String getHomePage() {
		return homePage;
	}

	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}

	public String getCoTel() {
		return coTel;
	}

	public void setCoTel(String coTel) {
		this.coTel = coTel;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public char getApproval() {
		return approval;
	}

	public void setApproval(char approval) {
		this.approval = approval;
	}

	public String getBusiEmail() {
		return busiEmail;
	}

	public void setBusiEmail(String busiEmail) {
		this.busiEmail = busiEmail;
	}

	public int getCpCheck() {
		return cpCheck;
	}

	public void setCpCheck(int cpCheck) {
		this.cpCheck = cpCheck;
	}

	public String getCheckImg() {
		return checkImg;
	}

	public void setCheckImg(String checkImg) {
		this.checkImg = checkImg;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getCateNum() {
		return cateNum;
	}

	public void setCateNum(int cateNum) {
		this.cateNum = cateNum;
	}

	public String getCoIntro() {
		return coIntro;
	}

	public void setCoIntro(String coIntro) {
		this.coIntro = coIntro;
	}

	public String getCoInfo() {
		return coInfo;
	}

	public void setCoInfo(String coInfo) {
		this.coInfo = coInfo;
	}

	@Override
	public String toString() {
		return "Company [coId=" + coId + ", coPwd=" + coPwd + ", coName=" + coName + ", compaName=" + compaName
				+ ", apName=" + apName + ", homePage=" + homePage + ", coTel=" + coTel + ", enrollDate=" + enrollDate
				+ ", status=" + status + ", approval=" + approval + ", busiEmail=" + busiEmail + ", cpCheck=" + cpCheck
				+ ", checkImg=" + checkImg + ", point=" + point + ", cateNum=" + cateNum + ", coIntro=" + coIntro
				+ ", coInfo=" + coInfo + "]";
	}
	
	
	
	
}
