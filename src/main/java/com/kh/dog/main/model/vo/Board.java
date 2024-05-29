package com.kh.dog.main.model.vo;

import java.sql.Date;

public class Board {
	private int boardNo;
	private String title;
	private String boardContent;
	private int boardView;
	private Date createDate;
	private Date updateDate;
	private String kind;
	private String status;
	private String userId;
	
	
	public Board() {}


	public Board(int boardNo, String title, String boardContent, int boardView, Date createDate, Date updateDate,
			String kind, String status, String userId) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.boardContent = boardContent;
		this.boardView = boardView;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.kind = kind;
		this.status = status;
		this.userId = userId;
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getBoardContent() {
		return boardContent;
	}


	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}


	public int getBoardView() {
		return boardView;
	}


	public void setBoardView(int boardView) {
		this.boardView = boardView;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public Date getUpdateDate() {
		return updateDate;
	}


	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}


	public String getKind() {
		return kind;
	}


	public void setKind(String kind) {
		this.kind = kind;
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


	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", title=" + title + ", boardcontent=" + boardContent + ", boardView="
				+ boardView + ", createDate=" + createDate + ", updateDate=" + updateDate + ", kind=" + kind
				+ ", status=" + status + ", userId=" + userId + "]";
	}
	
	
	
    




}
