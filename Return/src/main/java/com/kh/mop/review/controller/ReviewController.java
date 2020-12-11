package com.kh.mop.review.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mop.common.Pagination;
import com.kh.mop.review.domain.PageInfo;
import com.kh.mop.review.domain.Review;
import com.kh.mop.review.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService vService;
	
	// 파일 저장
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\reviewUploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		String filePath = folder + "\\" + file.getOriginalFilename();
		try {
			file.transferTo(new File(filePath));
		}catch(Exception e){
			e.printStackTrace();
		}
		return filePath;
	}

	// 파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\reviewUploadFiles";
		File file = new File(savePath + "\\" + fileName);
		if(file.exists()) {
			file.delete();
		}
	}
	
	// 게시글 등록
	@RequestMapping(value="reviewInsert.do", method = RequestMethod.POST)
	public String reviewInsert(Review review, Model model, HttpServletRequest request, MultipartFile uploadFile) {
		if(!uploadFile.getOriginalFilename().equals("")) {
			String filePath = saveFile(uploadFile, request);
			if(filePath != null) {
				review.setFilePath(uploadFile.getOriginalFilename());
			}
		}
		int result = 0;
		String path = null;
		result = vService.insertReview(review);
		if(result > 0) {
			path = "redirect:reviewList.do";
		}else {
			model.addAttribute("msg", "리뷰게시판 등록 실패");
			path = "common/errorPage";
		}
		return path;
	}
	
	// 리뷰게시판 리스트
	@RequestMapping(value="reviewList.do", method = RequestMethod.GET)
	public ModelAndView reviewList(ModelAndView mv, @RequestParam(value="page", required = false) Integer page) {
		/* int currentPage = (page != null) ? page : 1; */
		int listCount = vService.getListCount();
		/* PageInfo pi = Pagination.getPageInfo(currentPage, listCount); */
		ArrayList<Review> vList = vService.selectList();
		if(!vList.isEmpty()) {
			mv.addObject("vList", vList);
			/* mv.addObject("pi", pi); */
			mv.setViewName("review/reviewList");
		}else {
			mv.addObject("msg", "리뷰게시판 리스트 에러다 돌아가라");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

}
