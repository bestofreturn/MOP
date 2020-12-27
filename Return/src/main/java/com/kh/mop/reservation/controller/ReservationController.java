package com.kh.mop.reservation.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.aspectj.weaver.patterns.HasThisTypePatternTriedToSneakInSomeGenericOrParameterizedTypePatternMatchingStuffAnywhereVisitor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	
	//결제 페이지
	@RequestMapping(value="payment.do", method=RequestMethod.POST)
	public ModelAndView payView(ModelAndView mv,Reservation reservation, String rPoint) {
		mv.addObject("reservation",reservation).addObject("rPoint", rPoint).setViewName("reservation/payment");
		return mv;
	}
	
	  //예약추가
	  @RequestMapping(value="insertReservation.do", method=RequestMethod.POST)
	  public String insertReservation(Reservation reservation, HttpServletRequest request,String rPoint){
		  
		  HttpSession session = request.getSession();
		  Member member = (Member)session.getAttribute("loginMember");
		  
		  member.setWon(Integer.parseInt(rPoint));
		  
		  
		  int result1	= mService.reservationMember(member);
		  
		  int result = rService.insertReservation(reservation);

		  
		  if(result > 0 && result1 > 0) {
			  return "myPage";
		  }else {
			  return "common/errorPage";
		  }
		  
	  }
	  
	  //예약삭제
	  @RequestMapping(value="deleteReservation.do", method=RequestMethod.POST)
	  public String deleteReservation(String rId) {
		  return "";
	  }
	
	  
	

}
