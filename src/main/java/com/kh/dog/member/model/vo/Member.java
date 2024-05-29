package com.kh.dog.member.model.vo;

import java.sql.Date;

public class Member {
	private String userId;
	private String pwd;
	private String uName;
	private Date birth;
	private String address;
	private String phone;
	private Date joinDate;
	private String isAdmin;
	private String status;
	private String email;
	
	public Member() {}

	public Member(String userId, String pwd, String uName, Date birth, String address, String phone, Date joinDate,
			String isAdmin, String status, String email) {
		super();
		this.userId = userId;
		this.pwd = pwd;
		this.uName = uName;
		this.birth = birth;
		this.address = address;
		this.phone = phone;
		this.joinDate = joinDate;
		this.isAdmin = isAdmin;
		this.status = status;
		this.email = email;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", pwd=" + pwd + ", uName=" + uName + ", birth=" + birth + ", address="
				+ address + ", phone=" + phone + ", joinDate=" + joinDate + ", isAdmin=" + isAdmin + ", status="
				+ status + ", email=" + email + "]";
	}

	
	
}