package com.kh.mop.review.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mop.review.domain.PageInfo;
import com.kh.mop.review.domain.Review;
import com.kh.mop.review.domain.RvReply;

@Repository
public class ReviewStoreLogic implements ReviewStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Review> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getReviewLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getReviewLimit());
		return (ArrayList)sqlSession.selectList("reviewMapper.selectList", null, rowBounds);
	}
	
	@Override
	public Review selectReview(int vId) {
		return sqlSession.selectOne("reviewMapper.selectOne", vId);
	}

	@Override
	public int insertReview(Review review) {
		return sqlSession.insert("reviewMapper.insertReview", review);
	}

	@Override
	public int updateReview(Review review) {
		return sqlSession.update("reviewMapper.updateReview", review);
	}

	@Override
	public int deleteReview(int vId) {
		return sqlSession.update("reviewMapper.deleteReview", vId);
	}

	@Override
	public int insertRvReply(RvReply rvReply) {
		return sqlSession.insert("reviewMapper.insertRvReply", rvReply);
	}

	@Override
	public ArrayList<RvReply> selectRvReplyList(int vId) {
		return (ArrayList)sqlSession.selectList("reviewMapper.selectRvReplyList", vId);
	}

}
