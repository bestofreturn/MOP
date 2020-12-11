package com.kh.mop.place.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mop.place.domain.Place;

@Repository
public class PlaceStoreLogic implements PlaceStore {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Place> selectList() {
		return (ArrayList)sqlSession.selectList("PlaceMapper.selectList");
	}

	@Override
	public Place selectOne(int pId) {
		// TODO Auto-generated method stub
		return null;
	}

}
