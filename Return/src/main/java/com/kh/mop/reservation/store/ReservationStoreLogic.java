package com.kh.mop.reservation.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mop.reservation.domain.Reservation;

@Repository
public class ReservationStoreLogic implements ReservationStore{

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public ArrayList<Reservation> resertvationList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReservation(Reservation reservation) {
		return sqlSession.insert("ReservationMapper.insertReservation",reservation);
	}

	@Override
	public int deleteReservation(int rId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
