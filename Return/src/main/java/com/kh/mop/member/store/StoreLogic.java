package com.kh.mop.member.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mop.member.domain.Member;

@Repository
public class StoreLogic implements Store{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int checkIdDup(String userId) {
		return 0;
	}

	@Override
	public int insertMember(Member member) {
		int result = sqlSession.insert("MemberMapper.insertMember",member);
		return result;
		}

	@Override
	public int updateMember(Member member) {
		return 0;
	}

	@Override
	public int deleteMember(String userId) {
		return 0;
	}

	@Override
	public int reservationMember(Member member) {
		System.out.println("###########");
		return sqlSession.update("MemberMapper.reservationMember",member);
	}

	@Override
	public Member selectOneMember(Member member) {
		Member loginMember = sqlSession.selectOne("MemberMapper.selectOne",member);
		return loginMember;
	}

}
