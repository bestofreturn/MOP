package com.kh.mop.freeboard.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
import com.kh.mop.freeboard.domain.FreeBoard;
import com.kh.mop.freeboard.domain.FreeBoardPageInfo;
import com.kh.mop.freeboard.service.FreeBoardService;

@Controller
public class FreeBoardController {

	@Autowired
	private FreeBoardService fService;


	//자유게시판 등록화면 
	@RequestMapping(value="freeBoardWriteView.do", method=RequestMethod.GET)
	public String freeBoardWriteView() {
		return "/freeboard/FreeBoardWriteForm";
	}


	//자유게시판 글 등록
	@RequestMapping(value="insertFreeBoard.do",method=RequestMethod.POST)
	public String insertFreeBoard(FreeBoard freeBoard, Model model, MultipartFile uploadFile, HttpServletRequest request) {

		//파일을 서버에 저장
		if(!uploadFile.getOriginalFilename().equals("")) {
			String fRenameFileName = saveFile(uploadFile, request);
			if(fRenameFileName != null) {
				freeBoard.setfOriginalFileName(uploadFile.getOriginalFilename());
				freeBoard.setfRenameFileName(fRenameFileName);
			}
		}
		//파일을 DB에 저장
		int result = 0;
		String path = null;
		result = fService.insertFreeBoard(freeBoard);
		System.out.println(freeBoard);
		if(result > 0) {
			path = "redirect:freeBoardList.do";
		}else {
			model.addAttribute("msg","자유게시판 글 등록 실패");
			path = "common/errorPage";
		}
		return path;
	}



	public String saveFile(MultipartFile file, HttpServletRequest request) {
		//파일 저장 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\fuploadFiles";
		//저장 폴더 선택
		File folder = new File(savePath);
		//만약 폴더가 없을 경우 자동 생성
		if(!folder.exists()) {
			folder.mkdir();
		}
		//공지사항 첨부파일은 파일명 변환없이 바로 저장했으나
		//게시파은 회원들이 동시에올리거나 같은파일을 올릴 수도 있기 때문에
		//파일명을 rename하는 과정이 필요함
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fOriginalFileName = file.getOriginalFilename();
		String fRenameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
												+ fOriginalFileName.substring(fOriginalFileName.lastIndexOf(".") +1);
		
		String filePath = folder + "\\" + fRenameFileName;
		//파일 저장
		try {
			file.transferTo(new File(filePath));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fRenameFileName;
	}


	//자유게시판 글 전체 조회
	@RequestMapping(value="freeBoardList.do", method=RequestMethod.GET)
	public ModelAndView FreeBoardList(ModelAndView mv, @RequestParam(value="page",required=false)Integer page) {

		int currentPage = (page != null) ? page : 1;
		int listCount = fService.getListCount();
		FreeBoardPageInfo pi = Pagination.getFreeBoardPageInfo(currentPage, listCount);

		ArrayList<FreeBoard> fList = fService.selectList(pi);
		if(!fList.isEmpty()) {
			mv.addObject("fList",fList);
			mv.addObject("pi",pi);
			mv.setViewName("freeboard/FreeBoardListView");
		}else {
			mv.addObject("msg","자유게시판 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	
	
	//자유게시판 상세 페이지
	@RequestMapping(value="freeBoardDetail.do", method=RequestMethod.GET)
	public ModelAndView FreeBoardDetail(ModelAndView mv, int fId, Integer page) {
		int currentPage = page != null ? page : 1;
		//조회수 증가
		fService.addReadCount(fId);
		//게시글 상세 조회
		FreeBoard freeBoard = fService.selectFreeBoard(fId);
		if(freeBoard != null) {
			//메서드체이닝
			mv.addObject("freeBoard",freeBoard)
				.addObject("currentPage",currentPage)
					.setViewName("freeboard/FreeBoardDetailView");
		}else {
			mv.addObject("msg","게시글 상세 조회 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	public void deleteFile(String fileName,HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savepath = root + "\\fuploadFIles";
		File file = new File(savepath + "\\" + fileName);
		//파일이 존재할경우 삭제
		if(file.exists()) {
			file.delete();
		}
	}


	//자유게시판 삭제
	@RequestMapping(value="freeBoardDelete.do", method=RequestMethod.GET)
	public String FreeBoardDelete(int fId, HttpServletRequest request, Model model) {
		//파일삭제
		FreeBoard freeBoard = fService.selectFreeBoard(fId);
		if(freeBoard.getfOriginalFileName() != null) {
			deleteFile(freeBoard.getfRenameFileName(),request);
		}
		
		//DB에서 삭제
		int result = fService.deleteFreeBoard(fId);
		if(result > 0) {
			return "redirect:freeBoardList.do";
		}else {
			model.addAttribute("msg","게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	//자유게시판 수정화면
	@RequestMapping("freeBoardUpdateView.do")
	public ModelAndView FreeBoardUpdate(ModelAndView mv, @RequestParam("fId") int fId,
											@RequestParam("page") Integer page) {
		mv.addObject("freeBoard",fService.selectFreeBoard(fId)).addObject("currentPage",page).setViewName("freeboard/FreeBoardUpdateForm");
		return mv;
	}
	
	
	//자유게시판 수정하기
	@RequestMapping(value="freeBoardUpdate.do", method=RequestMethod.POST)
	public ModelAndView FreeBoardUpdate(@ModelAttribute FreeBoard freeBoard, ModelAndView mv, 
											HttpServletRequest request,
												@RequestParam("page") Integer page,
													@RequestParam(value="reloadFile", required=false)
														MultipartFile reloadFile) {
		//새로 업로드된 파일이 있는경우
		if(reloadFile != null && !reloadFile.isEmpty()) {
			//기존 업로드된 파일 삭제
			if(freeBoard.getfOriginalFileName() != null) {
				deleteFile(freeBoard.getfRenameFileName(), request);
			}
			//새로 업로드된 파일을 저장
			String renameFileName = saveFile(reloadFile, request);
			if(renameFileName != null) {
				freeBoard.setfOriginalFileName(reloadFile.getOriginalFilename());
				freeBoard.setfRenameFileName(renameFileName);
			}
		}
		//DB 저장
		int result = fService.updateFreeBoard(freeBoard);
		System.out.println(freeBoard);
		if(result > 0) {
			mv.addObject("page",page);
			mv.setViewName("redirect:freeBoardList.do");
		}else {
			mv.addObject("msg","게시글 수정 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
}

