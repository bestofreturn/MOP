package com.kh.mop.member.controller;

import java.io.IOException;

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

/*import com.github.scribejava.core.model.OAuth2AccessToken;*/
import com.kh.mop.member.domain.Member;
/*import com.kh.mop.member.naver.NaverLogin;*/
import com.kh.mop.member.service.MemberService;

@Controller
public class MemberController {

	/*
	 * private NaverLogin nl; private String apiResult = null;
	 * 
	 * @Autowired private void setNaverLogin(NaverLogin nl) { this.nl = nl;
	 */
	//}

	@Autowired
	private MemberService service;

	
	  // <!-- 회원가입 -->
	 
	@RequestMapping(value = "insert.do", method = RequestMethod.GET)
	public String enrollView() {
		return "member/MemberInsert";
	}

	// 아이디 중복 검사
	@ResponseBody
	@RequestMapping(value = "dupId.do", method = RequestMethod.GET)
	public String idDuplicateCheck(String memberId) {
		boolean isUsable = service.checkIdDup(memberId) == 0 ? true : false;
		return isUsable + "";
	}

	@RequestMapping(value = "insert.do", method = RequestMethod.POST)
	public String insertMember(Model model, Member member, String zipCode, String addr) {
		member.setAddr(zipCode + "," + addr);
		int result = service.insertMember(member);
		if (result > 0) {
			return "redirect:home.do";
		} else {
			model.addAttribute("msg", "회원가입 실패");
			return "common/errorPage";
		}
	}
	
	 // @RequestMapping(value="login1.do", method=RequestMethod.GET) public String
	  //loginView() { return "common/main"; }
	 //

	@RequestMapping(value = "login1.do", method = RequestMethod.POST)
	public ModelAndView loginMember(String memberId, String memberPwd, ModelAndView mv, HttpServletRequest request) {

		HttpSession session = request.getSession();
		Member member = new Member(memberId, memberPwd);
		Member loginMember = service.loginMember(member);

		if (loginMember != null) {
			session.setAttribute("loginMember", loginMember);
			mv.setViewName("common/main");
		} else {
			mv.addObject("msg", "로그인 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	//
	  //로그아웃
	 //
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String memberLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/home.do";
	}

	// 마이페이지 뷰
	@RequestMapping(value = "myInfo.do", method = RequestMethod.GET)
	public String myInfoView() {
		return "member/updateMember";
	}

	// 회원 정보 수정
	@RequestMapping(value = "memberUpdate.do", method = RequestMethod.POST)
	public String updateMember(@ModelAttribute Member member, @RequestParam("zipCode") String zipCode,
			@RequestParam("addr") String addr, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		member.setAddr(zipCode + "," + addr);
		int result = service.updateMember(member);
		if (result > 0) {
			session.setAttribute("loginMember", member);
			return "redirect:home.do";
		} else {
			model.addAttribute("msg", "정보수정 실패");
			return "common/errorPage";
		}
	}

	// 회원 탈퇴
	@RequestMapping(value = "memberDelete.do", method = RequestMethod.GET)
	public String deleteMember(String memberId, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		int result = service.deleteMember(memberId);
		if (result > 0) {
			session.invalidate();
			return "redirect:home.do";
		} else {
			model.addAttribute("msg", "회원탈퇴실패");
			return "common/errorPage";
		}
	}

	
	/*
	 * @RequestMapping(value="NLogin.do" , method=
	 * {RequestMethod.GET,RequestMethod.POST}) public String NLogin(Model
	 * model,HttpSession session) {
	 * 
	 * String naverUrl = nl.getAuthorizationUrl(session);
	 * System.out.println("네이버주소 : " + naverUrl);
	 * 
	 * model.addAttribute("Nurl",naverUrl);
	 * 
	 * return "redirect:" +naverUrl;
	 * 
	 * }
	 * 
	 * // 콜백 처리
	 * 
	 * @RequestMapping(value="Member.do" , method=
	 * {RequestMethod.GET,RequestMethod.POST}) public String
	 * NLoginCallback(@RequestParam("code") String code , @RequestParam("state")
	 * String state,@RequestParam("phone") String phone, Model model,HttpSession
	 * session) throws IOException{
	 * 
	 * System.out.println("돌아와제발"); System.out.println("코드" + code);
	 * System.out.println("스테이트" + state); OAuth2AccessToken ot =
	 * nl.getAccessToken(session, code, state);
	 * 
	 * apiResult = nl.getUserProfile(ot); model.addAttribute("result",apiResult);
	 * return "redirect:/home.do";
	 * 
	 * }
	 */
	 
}
