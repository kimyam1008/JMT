package com.jmt.admin.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jmt.admin.service.GradeService;



@Controller
public class GradeController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired GradeService service;
	
	
	// 등급 관리 페이지 
	@RequestMapping(value = "/grade.go")
	public ModelAndView grade() {
		logger.info("등급 페이지 이동");
		ModelAndView mav = new ModelAndView("Grade/grade");
		return mav;
	}
	
	@RequestMapping(value = "/gradeList.ajax")
	@ResponseBody
	public HashMap<String, Object> gradeList(Model model,@RequestParam HashMap<String, String> params) {
		
		logger.info("등급 리스트 요청");
		
		return service.gradeList(params);
	}
	
	@RequestMapping(value = "update/{col}/{val}/{team}")
	public HashMap<String, Object> update(
			@PathVariable String col, @PathVariable String val, @PathVariable String team
			) {
		
		val = val.equals("_value_")?"":val;
		
		logger.info("리스트 요청");
		return service.update(col,val,team);
	}
	
	
	@RequestMapping(value = "/grade")
	public String grade(@RequestParam String colorCode ,@RequestParam HashMap<String, String> params) {
		String page = "Grade/grade";
		
		logger.info(" : " +colorCode);
		
		logger.info(" : " +params);
		
		return "redirect:/grade.go";
		
		
	}

	
	
	
	
	
}
