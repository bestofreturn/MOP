package com.kh.mop.place.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mop.place.domain.Place;
import com.kh.mop.place.service.PlaceService;
import com.kh.mop.review.domain.PageInfo;
import com.kh.mop.review.domain.Review;
import com.kh.mop.review.service.ReviewService;

@Controller
public class PlaceController {

	@Autowired 
	private PlaceService pService;
	private ReviewService rService;
	
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
	
	// 게시판 카테고리 분류 하여 출력 하는 부분 
	@ResponseBody
	@RequestMapping(value="psort.do")
	public ModelAndView categoryList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pCode = request.getParameter("pCode");

		  Map<String, String> m = new HashMap<String, String>();
		  m.put("pCode", "%" + pCode + "%");
		
		// 카테고리 해당 부분 불러오기 
		ArrayList<Place> categoryList = pService.categoryList(m);
		ModelAndView categoryMv = new ModelAndView("place/placeList");
		categoryMv.addObject("pCode", pCode);
		categoryMv.addObject("categoryList", categoryList);
		
		System.out.println(categoryList);
		return categoryMv;
	}
	
	// 게시판 상세보기 페이지로 넘어가는 메소드 
	@RequestMapping(value="placeDetail.do")
	public String placeDetailView(int pId, Model model) {
		model.addAttribute("pId", pId);
		return "place/placeDetail";
	}
	
	/*
	 * @RequestMapping(value="reviewList.do") public ModelAndView reviewListView
	 * (int vNo, ModelAndView mv, PageInfo pi) { ArrayList<Review> rList =
	 * rService.selectList(pi, vNo); if(!rList.isEmpty()) { mv.addObject("rList",
	 * rList); mv.setViewName("review/reviewList"); } else { mv.addObject("msg",
	 * "리뷰 조회 실패"); mv.setViewName("common/errorPage"); } return mv; }
	 */
	
}
