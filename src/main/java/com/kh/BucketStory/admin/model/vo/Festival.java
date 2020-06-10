package com.kh.BucketStory.admin.model.vo;

import java.sql.Date;

public class Festival {
	private int feno;
	private String fetitle;
	private String feDate;
	private String feplace;
	private String fecontent;
	private Date enrolldate;

	public Festival() {}

	public Festival(int feno, String fetitle, String feDate, String feplace, String fecontent, Date enrolldate) {
		super();
		this.feno = feno;
		this.fetitle = fetitle;
		this.feDate = feDate;
		this.feplace = feplace;
		this.fecontent = fecontent;
		this.enrolldate = enrolldate;
	}

	public int getFeno() {
		return feno;
	}

	public void setFeno(int feno) {
		this.feno = feno;
	}

	public String getFetitle() {
		return fetitle;
	}

	public void setFetitle(String fetitle) {
		this.fetitle = fetitle;
	}

	public String getFeDate() {
		return feDate;
	}

	public void setFeDate(String feDate) {
		this.feDate = feDate;
	}

	public String getFeplace() {
		return feplace;
	}

	public void setFeplace(String feplace) {
		this.feplace = feplace;
	}

	public String getFecontent() {
		return fecontent;
	}

	public void setFecontent(String fecontent) {
		this.fecontent = fecontent;
	}

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	@Override
	public String toString() {
		return "Festival [feno=" + feno + ", fetitle=" + fetitle + ", feDate=" + feDate + ", feplace=" + feplace
				+ ", fecontent=" + fecontent + ", enrolldate=" + enrolldate + "]";
	}
}


