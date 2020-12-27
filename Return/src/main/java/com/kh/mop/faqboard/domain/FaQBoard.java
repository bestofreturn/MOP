package com.kh.mop.faqboard.domain;

import java.sql.Date;

public class FaQBoard {

	private String faqId;
	private String faqTitle;
	private String faqContent;
	private String faqWriter;
	private Date faqWriteDate;
	
	
	public FaQBoard() {}
	
	public FaQBoard(String faqId, String faqTitle, String faqContent, String faqWriter, Date faqWriteDate) {
		super();
		this.faqId = faqId;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqWriter = faqWriter;
		this.faqWriteDate = faqWriteDate;
	}
	public String getFaqId() {
		return faqId;
	}
	public void setFaqId(String faqId) {
		this.faqId = faqId;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	public String getFaqWriter() {
		return faqWriter;
	}
	public void setFaqWriter(String faqWriter) {
		this.faqWriter = faqWriter;
	}
	public Date getFaqWriteDate() {
		return faqWriteDate;
	}
	public void setFaqWriteDate(Date faqWriteDate) {
		this.faqWriteDate = faqWriteDate;
	}
	@Override
	public String toString() {
		return "FaQ [faqId=" + faqId + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", faqWriter="
				+ faqWriter + ", faqWriteDate=" + faqWriteDate + "]";
	}
	
	
}
