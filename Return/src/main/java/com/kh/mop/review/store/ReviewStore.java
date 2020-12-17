package com.kh.mop.review.store;

import java.util.ArrayList;

import com.kh.mop.review.domain.PageInfo;
import com.kh.mop.review.domain.Review;
import com.kh.mop.review.domain.RvReply;

public interface ReviewStore {

	public int getListCount();
	
	public ArrayList<Review> selectList(PageInfo pi);
	
	public Review selectReview(int vId);
	
	public int insertReview(Review review);
	
	public int updateReview(Review review);
	
	public int deleteReview(int vId);
	
	public int insertRvReply(RvReply rvReply);
	
	public ArrayList<RvReply> selectRvReplyList(int vId);
}
