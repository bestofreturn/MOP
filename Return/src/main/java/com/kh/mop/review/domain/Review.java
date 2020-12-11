package com.kh.mop.review.domain;

import java.sql.Date;

public class Review {

	private int vId;
	private String vWriter;
	private String vContent;
	private String filePath;
	private Date vCreateDate;
	private Date vModifyDate;
	private String vStatus;
	private int vStar;
	private String vImgLogo;
	private int vNo;
	
	public Review() {}
	
	public Review(int vId, String vWriter, String vContent, String filePath, Date vCreateDate, Date vModifyDate,
			String vStatus, int vStar, String vImgLogo, int vNo) {
		super();
		this.vId = vId;
		this.vWriter = vWriter;
		this.vContent = vContent;
		this.filePath = filePath;
		this.vCreateDate = vCreateDate;
		this.vModifyDate = vModifyDate;
		this.vStatus = vStatus;
		this.vStar = vStar;
		this.vImgLogo = vImgLogo;
		this.vNo = vNo;
	}

	public int getvId() {
		return vId;
	}

	public void setvId(int vId) {
		this.vId = vId;
	}

	public String getvWriter() {
		return vWriter;
	}

	public void setvWriter(String vWriter) {
		this.vWriter = vWriter;
	}

	public String getvContent() {
		return vContent;
	}

	public void setvContent(String vContent) {
		this.vContent = vContent;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getvCreateDate() {
		return vCreateDate;
	}

	public void setvCreateDate(Date vCreateDate) {
		this.vCreateDate = vCreateDate;
	}

	public Date getvModifyDate() {
		return vModifyDate;
	}

	public void setvModifyDate(Date vModifyDate) {
		this.vModifyDate = vModifyDate;
	}

	public String getvStatus() {
		return vStatus;
	}

	public void setvStatus(String vStatus) {
		this.vStatus = vStatus;
	}

	public int getvStar() {
		return vStar;
	}

	public void setvStar(int vStar) {
		this.vStar = vStar;
	}

	public String getvImgLogo() {
		return vImgLogo;
	}

	public void setvImgLogo(String vImgLogo) {
		this.vImgLogo = vImgLogo;
	}

	public int getvNo() {
		return vNo;
	}

	public void setvNo(int vNo) {
		this.vNo = vNo;
	}

	@Override
	public String toString() {
		return "Review [vId=" + vId + ", vWriter=" + vWriter + ", vContent=" + vContent + ", filePath=" + filePath
				+ ", vCreateDate=" + vCreateDate + ", vModifyDate=" + vModifyDate + ", vStatus=" + vStatus + ", vStar="
				+ vStar + ", vImgLogo=" + vImgLogo + ", vNo=" + vNo + "]";
	}
	
}
