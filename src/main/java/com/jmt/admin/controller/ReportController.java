package com.jmt.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.reflection.SystemMetaObject;
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
import com.jmt.admin.dto.ReportPostDto;
import com.jmt.admin.service.ReportService;


@Controller
@RequestMapping("/report")
public class ReportController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired ReportService service;
	
	@GetMapping("/")
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
	
	@GetMapping("/detail.go")
	public String reportList(@RequestParam("report_no") int report_no ,Model model,Integer class_no , Integer idx) {
		logger.info("신고 번호 {}",report_no);

		Map<String, Object> data  = new HashMap<String, Object>();

		
		ReportDTO dto = service.reportDetail(report_no);
		model.addAttribute("detailDto",dto);
		
		data.put("class_no", class_no);
		data.put("idx", idx);
		
		ReportPostDto reportPost= service.reportPost(data);
		model.addAttribute("reportPost",reportPost);
		
		
		return "Report/reportDetail";
	}
	
	
	

	@PostMapping("/reportUpdate.do")
	public String reportUpdate(int report_no, String report_status , String reason, RedirectAttributes ra, Integer class_no , Integer idx,String reported) {
		Map<String, Object> data  = new HashMap<String, Object>();

		data.put("report_no",report_no);
		data.put("report_status",report_status);
		data.put("reason",reason);
		data.put("class_no", class_no);
		int result= service.reportUpdate(data);
		ra.addAttribute("report_no",report_no);
		ra.addAttribute("class_no",class_no);
		ra.addAttribute("idx",idx);
		
		
		
		String msg = null;
		if(result>0) {
			//변경된 status 가 블라인드인 경우 블라인드 리스트 생성해야 함. 
			String updateCheck= service.updateCheck(report_no); 
			if(updateCheck.equals("블라인드")) { 
				data.put("reported", reported);
				service.insertBlind(data);
			}
	
			msg = "상태변경을 완료했습니다.";
			ra.addFlashAttribute("msg",msg); 
		}	
		return "redirect:/report/detail.go";
	}

	@RequestMapping("/blind.ajax")
	@ResponseBody
	public Map<String, Object> blind(@RequestParam(value ="blindPost[]") ArrayList<String> blindPost) {
		Map<String, Object> map  = new HashMap<String, Object>();
		logger.info("파라미터 모음,{}",blindPost);
		
		 int resut = service.blind(blindPost);
		 
	
		return map; 
	}
	
	@RequestMapping("/blind.go")
	public String blindPage() { 
		
		return "Report/blindPage";
	}
	
	@RequestMapping("/blindList.ajax")
	@ResponseBody
	public Map<String, Object> blindList(@RequestParam HashMap<String, String> params){ 
		logger.info("params: {}",params); 
		
		
		return service.blindList(params);
	}
	
	@RequestMapping("/blindDetail.go")
	public String blindDetail(@RequestParam("report_no") Integer report_no ,Model model,Integer class_no , Integer idx) {
		Map<String, Object> data  = new HashMap<String, Object>();
	
		data.put("class_no", class_no);
		data.put("idx", idx);
		
		ReportDTO dto= service.reportDetail(report_no);
		model.addAttribute("detailDto",dto);
		
		ReportPostDto reportPost= service.reportPost(data);
		model.addAttribute("reportPost",reportPost);
		
		ArrayList<ReportDTO> blindHistory= service.blindHistory(report_no);
		 model.addAttribute("blindHistory",blindHistory);
		 
		return "Report/blindDetail";
	}
	
	
}
