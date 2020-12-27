package com.kh.mop.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mop.member.domain.Member;
import com.kh.mop.member.store.Store;
@Service
public class ServiceImpl implements MemberService{
	
	@Autowired
	private Store store;

	@Override
	public Member loginMember(Member member) {
		return store.selectOneMember(member);
	}

	@Override
	public int checkIdDup(String userId) {
		return 0;
	}

	@Override
	public int insertMember(Member member) {
		return store.insertMember(member);
	}

	@Override
	public int modifyMember(Member member) {
		return 0;
	}

	@Override
	public int deleteMember(String userId) {
		return 0;
	}

	@Override
	public int reservationMember(Member member) {
		System.out.println("This is MemberServiceImpl" + member);
		return store.reservationMember(member);
	}

}
