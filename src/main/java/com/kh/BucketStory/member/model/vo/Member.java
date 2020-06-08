package com.kh.BucketStory.member.model.vo;

import java.sql.Date;

public class Member {
	private String userid;
	private String userpwd;
	private String username;
	private String phone;
	private String email;
	private String birth;
	private String gender;
	private String nickname;
	private String caution;
	private String prImage;
	private String fwCount;
	private Date enrollDate;
	
	public Member() {}

	public Member(String userid, String userpwd) {
		super();
		this.userid = userid;
		this.userpwd = userpwd;
	}

	public Member(String userid, String userpwd, String username, String phone, String email, String birth,
			String gender, String nickname, String caution, String prImage, String fwCount, Date enrollDate) {
		super();
		this.userid = userid;
		this.userpwd = userpwd;
		this.username = username;
		this.phone = phone;
		this.email = email;
		this.birth = birth;
		this.gender = gender;
		this.nickname = nickname;
		this.caution = caution;
		this.prImage = prImage;
		this.fwCount = fwCount;
		this.enrollDate = enrollDate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getCaution() {
		return caution;
	}

	public void setCaution(String caution) {
		this.caution = caution;
	}

	public String getPrImage() {
		return prImage;
	}

	public void setPrImage(String prImage) {
		this.prImage = prImage;
	}

	public String getFwCount() {
		return fwCount;
	}

	public void setFwCount(String fwCount) {
		this.fwCount = fwCount;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Member [userid=" + userid + ", userpwd=" + userpwd + ", username=" + username + ", phone=" + phone
				+ ", email=" + email + ", birth=" + birth + ", gender=" + gender + ", nickname=" + nickname
				+ ", caution=" + caution + ", prImage=" + prImage + ", fwCount=" + fwCount + ", enrollDate="
				+ enrollDate + "]";
	}
}
