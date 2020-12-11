package com.kh.mop.scheduler.domain;

import java.sql.Date;

public class Scheduler {
	
	private int sId;
	private String sTitle;
	private String sContent;
	private String sCreateDate;
	private String startDate;
	private String endDate;
	private String sWriter;
	
	public Scheduler() {}

	public Scheduler(int sId, String sTitle, String sContent, String sCreateDate, String startDate, String endDate,
			String sWriter) {
		super();
		this.sId = sId;
		this.sTitle = sTitle;
		this.sContent = sContent;
		this.sCreateDate = sCreateDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.sWriter = sWriter;
	}

	public int getsId() {
		return sId;
	}

	public void setsId(int sId) {
		this.sId = sId;
	}

	public String getsTitle() {
		return sTitle;
	}

	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}

	public String getsContent() {
		return sContent;
	}

	public void setsContent(String sContent) {
		this.sContent = sContent;
	}

	public String getsCreateDate() {
		return sCreateDate;
	}

	public void setsCreateDate(String sCreateDate) {
		this.sCreateDate = sCreateDate;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getsWriter() {
		return sWriter;
	}

	public void setsWriter(String sWriter) {
		this.sWriter = sWriter;
	}

	@Override
	public String toString() {
		return "Scheduler [sId=" + sId + ", sTitle=" + sTitle + ", sContent=" + sContent + ", sCreateDate="
				+ sCreateDate + ", startDate=" + startDate + ", endDate=" + endDate + ", sWriter=" + sWriter + "]";
	}

	
	
	
}
