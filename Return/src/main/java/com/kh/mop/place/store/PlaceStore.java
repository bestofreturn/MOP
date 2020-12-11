package com.kh.mop.place.store;

import java.util.ArrayList;

import com.kh.mop.place.domain.Place;

public interface PlaceStore {
	
	public ArrayList<Place> selectList(); 
	
	public Place selectOne(int pId);
}
