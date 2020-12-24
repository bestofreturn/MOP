package com.kh.mop.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mop.member.domain.Member;
import com.kh.mop.member.service.MemberService;
import com.kh.mop.place.domain.Place;
import com.kh.mop.place.service.PlaceService;
import com.kh.mop.reservation.domain.Reservation;
import com.kh.mop.reservation.service.ReservationService;

@Controller
public class ReservationController {

	@Autowired 
	private PlaceService pService;
	
	@Autowired
	private ReservationService rService;
	
	@Autowired
	private MemberService mService;
	
	
	
	//예약페이지
	@RequestMapping(value="reserve.do")
	public ModelAndView reserView(ModelAndView mv, int pId) {
		/*
		 * int placeNoReserve = Integer.parseInt(pId); 
		 * mv.addObject("placeNoReserve",placeNoReserve);
		 */
		Place place = pService.selectOne(pId);
		mv.addObject("place",place);
		mv.setViewName("reservation/reservationForm");
		return mv;
	}
	
	//예약추가
	@RequestMapping(value="insertReservation.do", method=RequestMethod.POST)
	public String insertReservation(Reservation reservation, String memberId){
		
		 int result = rService.insertReservation(reservation);
		 
		 
		 if(result > 0) {
			 return "reservationConfirm.do";
		 }else {
			 return "common/errorPage";
		 }
		 
	}
	
}
