package com.jmt.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jmt.admin.dto.ReportDTO;
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
		//HashMap<String, Object> reportList= service.reportList(params); 
		logger.info("파라미터: {}",params);
		return service.reportList(params); 
	}
	
	@GetMapping("/detail")
	public String reportList(@RequestParam("report_no") int report_no , Model model) {
		logger.info("신고 번호 {}",report_no);
			ReportDTO dto = service.reportDetail(report_no);
			model.addAttribute("detailDto",dto);
			logger.info("확인  DTO {}", dto.getReport_title()); 
		return "Report/reportDetail";
	}
	
	@PostMapping("/reportUpdate")
	public String reportUpdate(int report_no, String report_status , String reason, RedirectAttributes ra) {
		Map<String, Object> data  = new HashMap<String, Object>();

		data.put("report_no",report_no);
		data.put("report_status",report_status);
		data.put("reason",reason);
		int result= service.reportUpdate(data);
		ra.addAttribute("report_no",report_no);
		return "redirect:/report/detail";
	}

}
