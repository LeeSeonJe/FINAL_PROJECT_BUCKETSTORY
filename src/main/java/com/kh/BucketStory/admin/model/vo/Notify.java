package com.kh.BucketStory.admin.model.vo;

import java.sql.Date;

public class Notify {
	private int no_no; // 신고번호
	private Date enrolldata; // 신고일
	private char status; // status
	private int no_kind; // 신고종류
	private char no_check; // 처리여부
	private int bno; // 글번호
	private int cmno; // 댓글 번호
	private int rpno; // 답글 번호
	private String sinuser; // 신고자
	private String pigouser; //피고자
	
	public Notify() {}

	public Notify(int no_no, Date enrolldata, char status, int no_kind, char no_check, int bno, int cmno, int rpno,
			String sinuser, String pigouser) {
		super();
		this.no_no = no_no;
		this.enrolldata = enrolldata;
		this.status = status;
		this.no_kind = no_kind;
		this.no_check = no_check;
		this.bno = bno;
		this.cmno = cmno;
		this.rpno = rpno;
		this.sinuser = sinuser;
		this.pigouser = pigouser;
	}

	public int getNo_no() {
		return no_no;
	}

	public void setNo_no(int no_no) {
		this.no_no = no_no;
	}

	public Date getEnrolldata() {
		return enrolldata;
	}

	public void setEnrolldata(Date enrolldata) {
		this.enrolldata = enrolldata;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public int getNo_kind() {
		return no_kind;
	}

	public void setNo_kind(int no_kind) {
		this.no_kind = no_kind;
	}

	public char getNo_check() {
		return no_check;
	}

	public void setNo_check(char no_check) {
		this.no_check = no_check;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getCmno() {
		return cmno;
	}

	public void setCmno(int cmno) {
		this.cmno = cmno;
	}

	public int getRpno() {
		return rpno;
	}

	public void setRpno(int rpno) {
		this.rpno = rpno;
	}

	public String getSinuser() {
		return sinuser;
	}

	public void setSinuser(String sinuser) {
		this.sinuser = sinuser;
	}

	public String getPigouser() {
		return pigouser;
	}

	public void setPigouser(String pigouser) {
		this.pigouser = pigouser;
	}

	@Override
	public String toString() {
		return "Notify [no_no=" + no_no + ", enrolldata=" + enrolldata + ", status=" + status + ", no_kind=" + no_kind
				+ ", no_check=" + no_check + ", bno=" + bno + ", cmno=" + cmno + ", rpno=" + rpno + ", sinuser="
				+ sinuser + ", pigouser=" + pigouser + "]";
	}
	
	
	
}
