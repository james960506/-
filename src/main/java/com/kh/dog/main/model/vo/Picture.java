package com.kh.dog.main.model.vo;

public class Picture {
	private int pictureNo;
	private int boardNo;
	private String fileName;
	private String fileRename;
	private String fileLocation;
	private String thumbnail;
	private String status;
	
	public Picture() {}

	public Picture(int pictureNo, int boardNo, String fileName, String fileRename, String fileLocation,
			String thumbnail, String status) {
		super();
		this.pictureNo = pictureNo;
		this.boardNo = boardNo;
		this.fileName = fileName;
		this.fileRename = fileRename;
		this.fileLocation = fileLocation;
		this.thumbnail = thumbnail;
		this.status = status;
	}

	public int getPictureNo() {
		return pictureNo;
	}

	public void setPictureNo(int pictureNo) {
		this.pictureNo = pictureNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileRename() {
		return fileRename;
	}

	public void setFileRename(String fileRename) {
		this.fileRename = fileRename;
	}

	public String getFileLocation() {
		return fileLocation;
	}

	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Picture [pictureNo=" + pictureNo + ", boardNo=" + boardNo + ", fileName=" + fileName + ", fileRename="
				+ fileRename + ", fileLocation=" + fileLocation + ", thumbnail=" + thumbnail + ", status=" + status
				+ "]";
	}
}
