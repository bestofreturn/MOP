package com.kh.mop.place.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mop.place.domain.Place;
import com.kh.mop.place.store.PlaceStore;

@Service
public class PlaceServiceImpl implements PlaceService {

	@Autowired 
	private PlaceStore pStore;
	
	@Override
	public ArrayList<Place> selectList() {
		return pStore.selectList();
				
	}

	@Override
	public Place selectOne(int pId) {
		// TODO Auto-generated method stub
		return null;
	}

}
