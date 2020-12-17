package com.kh.mop.scheduler.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.mop.scheduler.domain.Scheduler;
import com.kh.mop.scheduler.service.SchedulerService;

@Controller
public class SchedulerController {

	@Autowired
	private SchedulerService sService;

	 // 스케쥴러 리스트 뿌려주는 메소드 
	 @RequestMapping(value="scheduler.do", method = RequestMethod.GET)
	 public String Scheduler(Model model, HttpServletRequest request) {
		  model.addAttribute("Scheduler");
		  return "scheduler/Scheduler"; 
	 }
	 
	@ResponseBody
	@RequestMapping(value = "insertScheduler.do", method = RequestMethod.POST)
	public Map<Object, Object> SchedulerInsert(Scheduler scheduler, HttpServletRequest request, Model model) {

		Map<Object, Object> map = new HashMap<Object, Object>();
//		if(scheduler.getAllDay().equals("true")) {
//			scheduler.setAllDay("1");
//		}else {
//			scheduler.setAllDay("0");
//		}
		sService.insertScheduler(scheduler);
		System.out.println(scheduler.toString());
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "schedulerList.do", method = RequestMethod.GET)
	public void selectList(HttpServletResponse reponse) throws Exception {
		ArrayList<Scheduler> sList = sService.selectList();
		for (Scheduler s : sList) {
			s.setDescription(URLEncoder.encode(s.getDescription(), "utf-8"));
			s.setEnd(s.getStart());
			s.setAllDay(true);
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-mm-dd HH:mm:ss").create();
		gson.toJson(sList, reponse.getWriter());
//		System.out.println(sList.toString());
	}

	@ResponseBody
	@RequestMapping(value = "updateScheduler.do", method = RequestMethod.GET)
	public String schedulerUpdate(Scheduler scheduler, HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		System.out.println(scheduler.toString());
		int result = sService.updateSchdeduler(scheduler);

		if (result > 0) {
			return "redirect:home.do";

		} else {
			model.addAttribute("msg", "정보수정 실패");
			return "common/errorPage";
		}

	}

	@ResponseBody
	@RequestMapping(value = "deleteScheduler.do", method = RequestMethod.GET)
	public String Schedulerdelete(String sId, HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		int scheduleId = Integer.parseInt(sId);
		int result = sService.deleteScheduler(scheduleId);

		if (result > 0) {
			return "redirect:home.do";
		} else {
			model.addAttribute("msg", "스케줄러 삭제 실패");
			return "common/errorPage";
		}
	}
}

/*
 * @ResponseBody
 * 
 * @RequestMapping(value="schedulerList.do", method = RequestMethod.GET) public
 * ModelAndView selectList(ModelAndView mv, Http){ ArrayList<Scheduler> sList =
 * sService.selectList(); System.out.println(sList.toString());
 * if(!sList.isEmpty()) { mv.addObject("sList", sList);
 * mv.setViewName("Scheduler/Scheduler");
 * 
 * Gson gson = new GsonBuilder().setDateFormat("yyyy-mm-dd").create();
 * gson.toJson(sList, reponse.getWriter());
 * 
 * }else { mv.addObject("msg", "스케줄러 조회 실패");
 * mv.setViewName("common/errorPage"); }
 */
