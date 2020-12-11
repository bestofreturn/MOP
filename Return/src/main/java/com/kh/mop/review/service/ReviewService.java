package com.kh.mop.review.service;

import java.util.ArrayList;

import com.kh.mop.review.domain.PageInfo;
import com.kh.mop.review.domain.Review;

public interface ReviewService {

	public int getListCount();
	
	public ArrayList<Review> selectList();
	
	public int insertReview(Review review);
	
	public int updateReview(Review review);
	
	public int deleteReview(int vId);
	
}
