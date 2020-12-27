package com.kh.mop.faqboard.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mop.faqboard.domain.FaQBoard;
import com.kh.mop.freeboard.domain.FreeBoardPageInfo;
@Repository
public class FaQBoardStoreLogic implements FaQBoardStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		return sqlSession.selectOne("FaQBoardMapper.getListCount");
	}

	@Override
	public int addReadCount(int faqId) {
		return sqlSession.update("FaQBoardMapper.updateCount",faqId);
	}

	@Override
	public FaQBoard selectFaQBoard(int faqId) {
		FaQBoard faqb = sqlSession.selectOne("FaQBoardMapper.selectOne",faqId);
		return sqlSession.selectOne("FaQBoardMapper.selectOne",faqId);
	}

	@Override
	public int updateFaQBoard(FaQBoard faqBoard) {
		return sqlSession.update("FaQBoardMapper.updateFaQBoard",faqBoard);
	}

	@Override
	public int deleteFaQBoard(int faqId) {
		return sqlSession.update("FaQBoardMapper.deleteFaQBoard",faqId);
	}

	@Override
	public int insertFaQBoard(FaQBoard faqBoard) {
		System.out.println(faqBoard);
		return sqlSession.insert("FaQBoardMapper.insertFaQBoard",faqBoard);
	}

	@Override
	public ArrayList<FaQBoard> selectList(FreeBoardPageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("FaQBoardMapper.selectList",null,rowBounds);
	}
}
