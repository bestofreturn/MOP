package com.kh.mop.place.store;

import java.util.ArrayList;
import java.util.Map;

import com.kh.mop.place.domain.Place;
import com.kh.mop.review.domain.PageInfo;
import com.kh.mop.review.domain.Review;

public interface PlaceStore {
	
	public ArrayList<Place> selectList(); 
	
	public Place selectOne(int pId);
	
	public ArrayList<Place> categoryList(Map m);
	
	public ArrayList<Review> reviewList(PageInfo pi, int vNo); 
}
