package com.kh.mop.place.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mop.place.domain.Place;
import com.kh.mop.place.service.PlaceService;

@Controller
public class PlaceController {

	@Autowired 
	private PlaceService pService;
	
	@RequestMapping(value="placeList.do")
	public ModelAndView placeList (ModelAndView mv) {
		ArrayList<Place> pList = pService.selectList();
		if(!pList.isEmpty()) {
			mv.addObject("pList", pList);
			mv.setViewName("place/placeList");
		} else {
			mv.addObject("msg", "장소 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
}
