package com.kh.mop.review.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mop.review.domain.PageInfo;
import com.kh.mop.review.domain.Review;
import com.kh.mop.review.domain.RvReply;
import com.kh.mop.review.store.ReviewStore;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	public ReviewStore vStore;

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Review> selectList(PageInfo pi) {
		return vStore.selectList(pi);
	}
	
	@Override
	public Review selectReview(int vId) {
		return vStore.selectReview(vId);
	}

	@Override
	public int insertReview(Review review) {
		return vStore.insertReview(review);
	}

	@Override
	public int updateReview(Review review) {
		return vStore.updateReview(review);
	}

	@Override
	public int deleteReview(int vId) {
		return vStore.deleteReview(vId);
	}

	@Override
	public int insertRvReply(RvReply rvReply) {
		return vStore.insertRvReply(rvReply);
	}

	@Override
	public ArrayList<RvReply> selectRvReplyList(int vId) {
		return vStore.selectRvReplyList(vId);
	}

}
