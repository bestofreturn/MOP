package com.kh.mop.review.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mop.review.domain.PageInfo;
import com.kh.mop.review.domain.Review;
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
	public ArrayList<Review> selectList() {
		return vStore.selectList();
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
