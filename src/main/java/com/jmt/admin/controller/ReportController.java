package com.jmt.admin.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jmt.admin.service.ReportService;


@Controller
@RequestMapping("/report")
public class ReportController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired ReportService service;
	
	@GetMapping
	public String listGo() {
		return "Report/reportList";
	}
	
	
	@GetMapping("/list.ajax")
	@ResponseBody
	public HashMap<String, Object> list(Model model,@RequestParam HashMap<String, String> params) {
		logger.info("아작스 파라미터{}",params);
		HashMap<String, Object> reportList= service.reportList(params); 
		System.out.println(reportList);
		return reportList;
	}


}
