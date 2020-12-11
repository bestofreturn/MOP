package com.kh.mop.review.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mop.review.domain.PageInfo;
import com.kh.mop.review.domain.Review;

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
	public ArrayList<Review> selectList() {
		/*
		 * int offset = (pi.getCurrentPage() - 1) * pi.getReviewLimit(); RowBounds
		 * rowBounds = new RowBounds(offset, pi.getReviewLimit());
		 */
		return (ArrayList)sqlSession.selectList("reviewMapper.selectList");
	}

	@Override
	public int insertReview(Review review) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReview(Review review) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReview(int vId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
