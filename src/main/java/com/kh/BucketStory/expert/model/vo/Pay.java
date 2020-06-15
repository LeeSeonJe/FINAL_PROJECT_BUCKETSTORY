package com.kh.BucketStory.expert.model.vo;

import java.sql.Date;

/**
 * @author gun
 *
 */
public class Pay {
	private int pa_no; // 결제 번호
	private int pa_pay; // 결제금액
	private String coid; // 기업아이디
	private char status; // 충전여부
	private Date pdate; // 날짜
	
	public Pay(int pa_no, int pa_pay, String coid, char status, Date pdate) {
		super();
		this.pa_no = pa_no;
		this.pa_pay = pa_pay;
		this.coid = coid;
		this.status = status;
		this.pdate = pdate;
	}
	public int getPa_no() {
		return pa_no;
	}
	public void setPa_no(int pa_no) {
		this.pa_no = pa_no;
	}
	public int getPa_pay() {
		return pa_pay;
	}
	public void setPa_pay(int pa_pay) {
		this.pa_pay = pa_pay;
	}
	public String getCoid() {
		return coid;
	}
	public void setCoid(String coid) {
		this.coid = coid;
	}
	public char getStatus() {
		return status;
	}
	public void setStatus(char status) {
		this.status = status;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	
	@Override
	public String toString() {
		return "Pay [pa_no=" + pa_no + ", pa_pay=" + pa_pay + ", coid=" + coid + ", status=" + status + ", pdate="
				+ pdate + "]";
	}

	
	
}
