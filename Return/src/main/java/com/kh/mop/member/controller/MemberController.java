package com.kh.mop.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mop.member.domain.Member;
import com.kh.mop.member.service.MemberService;


@Controller
public class MemberController {

	@Autowired
	private MemberService service;

	/*
	 * // <!-- 회원가입 -->
	 */	
	@RequestMapping(value="enrollView.do" , method=RequestMethod.GET)
	public String enrollView() {
		return "member/insert";
	}
	//아이디 중복 검사
	@ResponseBody
	@RequestMapping(value="dupId.do",method=RequestMethod.GET)
	public String idDuplicateCheck(String memberId) {
		boolean isUsable = service.checkIdDup(memberId) == 0 ? true:false;
		return isUsable+"";
	}


	@RequestMapping(value="insert.do", method=RequestMethod.POST)
	public String MemberRegister(Model model,Member member, String zipCode,String addr) {
		member.setAddr(zipCode+","+addr);
		int result = service.insertMember(member);
		if(result > 0 ) {
			return "redirect:home.do";
		}else {
			model.addAttribute("msg","회원가입 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String loginView() {
		return "member/login";
	}
	

	@RequestMapping(value="login1.do" , method=RequestMethod.POST)
	public ModelAndView loginMember(String memberId,String memberPwd,ModelAndView mv,HttpServletRequest request ) {

		HttpSession session = request.getSession();
		Member member = new Member(memberId,memberPwd);
		Member loginMember = service.loginMember(member);

		if(loginMember != null) {
			session.setAttribute("loginMember", loginMember);
			mv.setViewName("common/main");
		}else {
			mv.addObject("msg","로그인 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	/*
	 * 로그아웃
	 */
	@RequestMapping(value="logout.do" , method=RequestMethod.GET)
	public String memberLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:home.do";
	}
		// 마이페이지 뷰
		@RequestMapping(value="myInfo.do" , method=RequestMethod.GET)
		public String myInfoView() {
			return "member/myPage";
		}
		// 회원 정보 수정
		@RequestMapping(value="memberModify.do" , method=RequestMethod.POST)
		public String modifyMember(@ModelAttribute Member member,@RequestParam("zipCode") String zipCode,@RequestParam("addr") String addr,Model model,HttpServletRequest request) {
			HttpSession session = request.getSession();
			member.setAddr(zipCode+","+addr);
			int result = service.modifyMember(member);
			if(result > 0) {
				session.setAttribute("loginMember",member);
				return "redirect:home.do";
			}else {
				model.addAttribute("msg", "정보수정 실패");
				return "common/errorPage";
			}
		}
		//회원 탈퇴
		@RequestMapping(value="memberDelete.do",method=RequestMethod.GET)
		public String deleteMember(String memberId,HttpServletRequest request,Model model) {
			HttpSession session = request.getSession();
			int result = service.deleteMember(memberId);
			if(result > 0) {
				session.invalidate();
				return "redirect:home.do";
			}else {
				model.addAttribute("msg", "회원탈퇴실패");
				return "common/errorPage";
			}
		}
}
