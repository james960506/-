package com.kh.dog.member.model.vo;

public class Dog {
	private int dno;
	private String dogName;
	private String dogSize;
	private String userId;
	private String breed;
	
	public Dog() {}

	public Dog(int dno, String dogName, String dogSize, String userId, String breed) {
		super();
		this.dno = dno;
		this.dogName = dogName;
		this.dogSize = dogSize;
		this.userId = userId;
		this.breed = breed;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public String getDogName() {
		return dogName;
	}

	public void setDogName(String dogName) {
		this.dogName = dogName;
	}

	public String getDogSize() {
		return dogSize;
	}

	public void setDogSize(String dogSize) {
		this.dogSize = dogSize;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	@Override
	public String toString() {
		return "Dog [dno=" + dno + ", dogName=" + dogName + ", dogSize=" + dogSize + ", userId=" + userId + ", breed="
				+ breed + "]";
	}
	
	
	
}