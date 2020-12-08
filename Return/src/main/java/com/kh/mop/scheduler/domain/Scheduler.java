package com.kh.mop.scheduler.domain;

import java.sql.Date;

public class Scheduler {
	
	private int sId;
	private String sTitle;
	private String sContent;
	private Date sCreateDate;
	private String sTime;
	
	public Scheduler() {}

	public Scheduler(int sId, String sTitle, String sContent, Date sCreateDate, String sTime) {
		super();
		this.sId = sId;
		this.sTitle = sTitle;
		this.sContent = sContent;
		this.sCreateDate = sCreateDate;
		this.sTime = sTime;
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

	public Date getsCreateDate() {
		return sCreateDate;
	}

	public void setsCreateDate(Date sCreateDate) {
		this.sCreateDate = sCreateDate;
	}

	public String getsTime() {
		return sTime;
	}

	public void setsTime(String sTime) {
		this.sTime = sTime;
	}

	@Override
	public String toString() {
		return "Scheduler [sId=" + sId + ", sTitle=" + sTitle + ", sContent=" + sContent + ", sCreateDate="
				+ sCreateDate + ", sTime=" + sTime + "]";
	}
	
	
}
