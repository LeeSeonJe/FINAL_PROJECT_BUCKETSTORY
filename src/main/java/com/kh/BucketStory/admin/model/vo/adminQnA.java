package com.kh.BucketStory.admin.model.vo;

import java.sql.Date;

public class adminQnA {
	private int q_no; // qna번호
	private String q_title; // 문의 제목
	private String q_content; // 문의 내용
	private Date q_date; // 문의날짜
	private char answer; // 답변여부
	private Date an_date; // 답변날짜
	private String an_content; // 답변내용
	private String userid; // 답변내용
	private String coid; // 답변내용
	
	public adminQnA() {}

	public adminQnA(int q_no, String q_title, String q_content, Date q_date, char answer, Date an_date,
			String an_content, String userid, String coid) {
		super();
		this.q_no = q_no;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_date = q_date;
		this.answer = answer;
		this.an_date = an_date;
		this.an_content = an_content;
		this.userid = userid;
		this.coid = coid;
	}

	
	
	public adminQnA(String q_title, String q_content, Date q_date, String coid) {
		super();
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_date = q_date;
		this.coid = coid;
	}
	
	public adminQnA(String q_title, String q_content, String userId, Date q_date) {
		super();
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_date = q_date;
		this.userid = userId;
	}
	

	public adminQnA(int q_no, String title, String content) {
		this.q_no = q_no;
		this.q_title = title;
		this.q_content = content;
	}

	public int getQ_no() {
		return q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public Date getQ_date() {
		return q_date;
	}

	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}

	public char getAnswer() {
		return answer;
	}

	public void setAnswer(char answer) {
		this.answer = answer;
	}

	public Date getAn_date() {
		return an_date;
	}

	public void setAn_date(Date an_date) {
		this.an_date = an_date;
	}

	public String getAn_content() {
		return an_content;
	}

	public void setAn_content(String an_content) {
		this.an_content = an_content;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getCoid() {
		return coid;
	}

	public void setCoid(String coid) {
		this.coid = coid;
	}

	@Override
	public String toString() {
		return "adminQnA [q_no=" + q_no + ", q_title=" + q_title + ", q_content=" + q_content + ", q_date=" + q_date
				+ ", answer=" + answer + ", an_date=" + an_date + ", an_content=" + an_content + ", userid=" + userid
				+ ", coid=" + coid + "]";
	}


	
	
}
