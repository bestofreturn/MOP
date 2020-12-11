package com.kh.mop.member.domain;

import java.sql.Date;

public class Member {
	
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String addr;
	private String phone;
	private String email;
	private String zipCode;
	private String accountNumber;
	private String won;
	private String reservation;
	private Date joinDate;

	
	public Member() {}
	public Member(String memberId, String memberPwd) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
	}


	public Member(String memberId, String memberPwd, String memberName, String addr, String phone, String email,
			String zipCode, String accountNumber, String won, String reservation, Date joinDate) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.addr = addr;
		this.phone = phone;
		this.email = email;
		this.zipCode = zipCode;
		this.accountNumber = accountNumber;
		this.won = won;
		this.reservation = reservation;
		this.joinDate = joinDate;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getMemberPwd() {
		return memberPwd;
	}


	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
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


	public String getZipCode() {
		return zipCode;
	}


	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}


	public String getAccountNumber() {
		return accountNumber;
	}


	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}


	public String getWon() {
		return won;
	}


	public void setWon(String won) {
		this.won = won;
	}


	public String getReservation() {
		return reservation;
	}


	public void setReservation(String reservation) {
		this.reservation = reservation;
	}


	public Date getJoinDate() {
		return joinDate;
	}


	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}


	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName=" + memberName + ", addr="
				+ addr + ", phone=" + phone + ", email=" + email + ", zipCode=" + zipCode + ", accountNumber="
				+ accountNumber + ", won=" + won + ", reservation=" + reservation + ", joinDate=" + joinDate + "]";
	}
	



}