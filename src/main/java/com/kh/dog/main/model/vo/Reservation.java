package com.kh.dog.main.model.vo;

import java.sql.Date;

public class Reservation {
	private int rno;
	private Date inDate;
	private Date outDate;
	private String status;
	private Date reserveDate;
	private int totalprice;
	private String payMethod;
	private String cardName;
	private String userId;
	private String etc;
	private String dnos;
	
	private String uName;
	private String phone;
	private String email;
	public Reservation() {}
	
	public Reservation(int rno, Date inDate, Date outDate, String status, Date reserveDate, int totalprice,
			String payMethod, String cardName, String userId, String etc, String dnos, String uName, String phone,
			String email) {
		super();
		this.rno = rno;
		this.inDate = inDate;
		this.outDate = outDate;
		this.status = status;
		this.reserveDate = reserveDate;
		this.totalprice = totalprice;
		this.payMethod = payMethod;
		this.cardName = cardName;
		this.userId = userId;
		this.etc = etc;
		this.dnos = dnos;
		this.uName = uName;
		this.phone = phone;
		this.email = email;
	}

	@Override
	public String toString() {
		return "Reservation [rno=" + rno + ", inDate=" + inDate + ", outDate=" + outDate + ", status=" + status
				+ ", reserveDate=" + reserveDate + ", totalprice=" + totalprice + ", payMethod=" + payMethod
				+ ", cardName=" + cardName + ", userId=" + userId + ", etc=" + etc + ", dnos=" + dnos + ", uName="
				+ uName + ", phone=" + phone + ", email=" + email + "]";
	}

	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public Date getInDate() {
		return inDate;
	}
	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}
	public Date getOutDate() {
		return outDate;
	}
	public void setOutDate(Date outDate) {
		this.outDate = outDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getReserveDate() {
		return reserveDate;
	}
	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getDnos() {
		return dnos;
	}
	public void setDnos(String dnos) {
		this.dnos = dnos;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
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
	
	
	
	
	
}
