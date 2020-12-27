package com.kh.mop.faqboard.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mop.common.Pagination;
import com.kh.mop.faqboard.domain.FaQBoard;
import com.kh.mop.faqboard.service.FaQBoardService;
import com.kh.mop.freeboard.domain.FreeBoardPageInfo;
import com.kh.mop.member.domain.Member;


@Controller
public class FaQController {
	@Autowired
	private FaQBoardService faqService;


	//질문게시판 등록화면 
	@RequestMapping(value="FaQBoardWriteView.do", method=RequestMethod.GET)
	public String FAQBoardWriteView() {
		return "/faqboard/FaQBoardWriteForm";
	}


	//질문게시판 글 등록
	@RequestMapping(value="insertFaQBoard.do",method=RequestMethod.POST)
	public String insertFaQBoard(FaQBoard faqBoard, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		faqBoard.setFaqWriter(((Member)session.getAttribute("loginMember")).getMemberId());
		int result = 0;
		String path = null;
		result = faqService.insertFaQBoard(faqBoard);
		System.out.println(faqBoard);
		if(result > 0) {
			path = "redirect:FaQBoardList.do";
		}else {
			model.addAttribute("msg","질문게시판 글 등록 실패");
			path = "common/errorPage";
		}
		return path;
	}
	//질문게시판 상세 페이지
	@RequestMapping(value="faqBoardDetail.do", method=RequestMethod.GET)
	public ModelAndView FaQBoardDetail(ModelAndView mv, int faqId, Integer page) {
		int currentPage = page != null ? page : 1;
		//게시글 상세 조회
		FaQBoard faqBoard = faqService.selectFaQBoard(faqId);
		if(faqBoard != null) {
			//메서드체이닝
			mv.addObject("faqBoard",faqBoard)
				.addObject("currentPage",currentPage)
					.setViewName("faqboard/FaQBoardDetailView");
		}else {
			mv.addObject("msg","게시글 상세 조회 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	//질문게시판 글 전체 조회
		@RequestMapping(value="FaQBoardList.do", method=RequestMethod.GET)
		public ModelAndView FaQBoardList(ModelAndView mv, @RequestParam(value="page",required=false)Integer page) {
			
			
			int currentPage = (page != null) ? page : 1;
			int listCount = faqService.getListCount();
			FreeBoardPageInfo pi = Pagination.getFreeBoardPageInfo(currentPage, listCount);
			
			ArrayList<FaQBoard> faqList = faqService.selectList(pi);
			
			if(!faqList.isEmpty()) {
				mv.addObject("faqList",faqList);
				mv.addObject("pi",pi);
				mv.setViewName("faqboard/FaQBoardListView");
			}else {
				mv.addObject("msg","자유게시판 전체조회 실패");
				mv.setViewName("common/errorPage");
			}
			return mv;
		}


	//질문게시판 삭제
	@RequestMapping(value="faqBoardDelete.do", method=RequestMethod.GET)
	public String FaQBoardDelete(int faqId, HttpServletRequest request, Model model) {
		
		//DB에서 삭제
		int result = faqService.deleteFaQBoard(faqId);
		if(result > 0) {
			return "redirect:FaQBoardList.do";
		}else {
			model.addAttribute("msg","게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	//질문게시판 수정화면
	@RequestMapping("faqBoardUpdateView.do")
	public ModelAndView FaQBoardUpdate(ModelAndView mv, @RequestParam("faqId") int faqId,
											@RequestParam(value="page",required=false) Integer page) {
		mv.addObject("faqBoard",faqService.selectFaQBoard(faqId)).addObject("currentPage",page).setViewName("faqboard/FaQBoardUpdateForm");
		return mv;
	}
	
	 
	//질문게시판 수정하기
	@RequestMapping(value="faqBoardUpdate.do", method=RequestMethod.POST)
	public ModelAndView FaQBoardUpdate(@ModelAttribute FaQBoard faqBoard, ModelAndView mv, 
											HttpServletRequest request,
														MultipartFile reloadFile) {
		
		int result = faqService.updateFaQBoard(faqBoard);
		System.out.println(faqBoard);
		if(result > 0) {
			mv.setViewName("redirect:FaQBoardList.do");
		}else {
			mv.addObject("msg","게시글 수정 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
}

