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
	
	/*
	 * @RequestMapping(value="home.do", method = RequestMethod.GET) public String
	 * Scheduler(Model model, HttpServletRequest request) {
	 * 
	 * 
	 * model.addAttribute("Scheduler");
	 * 
	 * return "Scheduler/Scheduler"; }
	 */

	@ResponseBody
	@RequestMapping(value="insertScheduler.do", method=RequestMethod.POST)
	public Map<Object,Object> SchedulerInsert(Scheduler scheduler, HttpServletRequest request, Model model) {

		Map<Object, Object> map = new HashMap<Object, Object>();

		sService.insertScheduler(scheduler);

		return map;
	}
	
	
	@ResponseBody
	@RequestMapping(value="schedulerList.do", method = RequestMethod.GET)
	public void selectList(HttpServletResponse reponse) throws Exception {
		ArrayList<Scheduler> sList = sService.selectList(); 
		for(Scheduler s : sList) {
			s.setsContent(URLEncoder.encode(s.getsContent(),"utf-8")); 
			
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-mm-dd").create();
		gson.toJson(sList, reponse.getWriter());

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
		
	

