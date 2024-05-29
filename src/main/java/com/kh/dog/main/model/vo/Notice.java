package com.kh.dog.main.model.vo;

import java.sql.Date;



public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeCreateDate;
	private Date noticeModifyDate;
	private String noticeSatatus;
	private String userId;
	private int noticeCount;
	private String noticeOriginalName;
	private String noticeRenameName;
	private String noticeAttmPath;
	private String noticeAttmSatatus;
	private int noticeType;
	
	public Notice() {}

	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date noticeCreateDate, Date noticeModifyDate,
			String noticeSatatus, String userId, int noticeCount, String noticeOriginalName, String noticeRenameName,
			String noticeAttmPath, String noticeAttmSatatus, int noticeType) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeCreateDate = noticeCreateDate;
		this.noticeModifyDate = noticeModifyDate;
		this.noticeSatatus = noticeSatatus;
		this.userId = userId;
		this.noticeCount = noticeCount;
		this.noticeOriginalName = noticeOriginalName;
		this.noticeRenameName = noticeRenameName;
		this.noticeAttmPath = noticeAttmPath;
		this.noticeAttmSatatus = noticeAttmSatatus;
		this.noticeType = noticeType;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeCreateDate() {
		return noticeCreateDate;
	}

	public void setNoticeCreateDate(Date noticeCreateDate) {
		this.noticeCreateDate = noticeCreateDate;
	}

	public Date getNoticeModifyDate() {
		return noticeModifyDate;
	}

	public void setNoticeModifyDate(Date noticeModifyDate) {
		this.noticeModifyDate = noticeModifyDate;
	}

	public String getNoticeSatatus() {
		return noticeSatatus;
	}

	public void setNoticeSatatus(String noticeSatatus) {
		this.noticeSatatus = noticeSatatus;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getNoticeCount() {
		return noticeCount;
	}

	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}

	public String getNoticeOriginalName() {
		return noticeOriginalName;
	}

	public void setNoticeOriginalName(String noticeOriginalName) {
		this.noticeOriginalName = noticeOriginalName;
	}

	public String getNoticeRenameName() {
		return noticeRenameName;
	}

	public void setNoticeRenameName(String noticeRenameName) {
		this.noticeRenameName = noticeRenameName;
	}

	public String getNoticeAttmPath() {
		return noticeAttmPath;
	}

	public void setNoticeAttmPath(String noticeAttmPath) {
		this.noticeAttmPath = noticeAttmPath;
	}

	public String getNoticeAttmSatatus() {
		return noticeAttmSatatus;
	}

	public void setNoticeAttmSatatus(String noticeAttmSatatus) {
		this.noticeAttmSatatus = noticeAttmSatatus;
	}

	public int getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(int noticeType) {
		this.noticeType = noticeType;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeCreateDate=" + noticeCreateDate + ", noticeModifyDate=" + noticeModifyDate
				+ ", noticeSatatus=" + noticeSatatus + ", userId=" + userId + ", noticeCount=" + noticeCount
				+ ", noticeOriginalName=" + noticeOriginalName + ", noticeRenameName=" + noticeRenameName
				+ ", noticeAttmPath=" + noticeAttmPath + ", noticeAttmSatatus=" + noticeAttmSatatus + ", noticeType="
				+ noticeType + "]";
	}

	
	
}
	
	