package com.kh.mop.member.service;

import com.kh.mop.member.domain.Member;

public interface MemberService {
	
	
	public Member loginMember(Member member);
	
	public int checkIdDup(String userId);
	
	public int insertMember(Member member);
	
	public int modifyMember(Member member);
	
	public int deleteMember(String userId);

}