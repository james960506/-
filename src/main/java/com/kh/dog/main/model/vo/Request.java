package com.kh.dog.main.model.vo;

import java.sql.Date;

public class Request {
	
	private int requestNo;
	private String email;
	private String consultingType;
	private Date requestDay;
	private String requestTime;
	private String dogInfo;
	private String status;
	private String userId;
	private String userName;
	private String adminStatus;
	
	
	public Request() {}


	public Request(int requestNo, String email, String consultingType, Date requestDay, String requestTime,
			String dogInfo, String status, String userId, String userName, String adminStatus) {
		super();
		this.requestNo = requestNo;
		this.email = email;
		this.consultingType = consultingType;
		this.requestDay = requestDay;
		this.requestTime = requestTime;
		this.dogInfo = dogInfo;
		this.status = status;
		this.userId = userId;
		this.userName = userName;
		this.adminStatus = adminStatus;
	}


	@Override
	public String toString() {
		return "Request [requestNo=" + requestNo + ", email=" + email + ", consultingType=" + consultingType
				+ ", requestDay=" + requestDay + ", requestTime=" + requestTime + ", dogInfo=" + dogInfo + ", status="
				+ status + ", userId=" + userId + ", userName=" + userName + ", adminStatus=" + adminStatus + "]";
	}


	public int getRequestNo() {
		return requestNo;
	}


	public void setRequestNo(int requestNo) {
		this.requestNo = requestNo;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getConsultingType() {
		return consultingType;
	}


	public void setConsultingType(String consultingType) {
		this.consultingType = consultingType;
	}


	public Date getRequestDay() {
		return requestDay;
	}


	public void setRequestDay(Date requestDay) {
		this.requestDay = requestDay;
	}


	public String getRequestTime() {
		return requestTime;
	}


	public void setRequestTime(String requestTime) {
		this.requestTime = requestTime;
	}


	public String getDogInfo() {
		return dogInfo;
	}


	public void setDogInfo(String dogInfo) {
		this.dogInfo = dogInfo;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getAdminStatus() {
		return adminStatus;
	}


	public void setAdminStatus(String adminStatus) {
		this.adminStatus = adminStatus;
	}
	
	
	
	

}
