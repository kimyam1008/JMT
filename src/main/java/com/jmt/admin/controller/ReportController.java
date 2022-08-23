package com.jmt.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
		data.put("idx", idx); // comment_no로 변경하기 . 
		
		
		ReportPostDto reportPost= service.reportPost(data);
		model.addAttribute("reportPost",reportPost);
		
		
		return "Report/reportDetail";
	}
	
	
	

	@PostMapping("/reportUpdate.do")
	public String reportUpdate(int report_no, String report_status , String reason, RedirectAttributes ra, Integer class_no , Integer idx,String reported,HttpSession session) {
		Map<String, Object> data  = new HashMap<String, Object>();
		data.put("idx", idx);
		data.put("report_no",report_no);
		data.put("report_status",report_status);
		data.put("reason",reason);
		data.put("class_no", class_no);
		int result= service.reportUpdate(data);
		ra.addAttribute("report_no",report_no);
		ra.addAttribute("class_no",class_no);
		ra.addAttribute("idx",idx);
		

		//알림
		if(report_status.equals("블라인드")) {
			service.blindNoti(class_no,idx,reported);
		}

		
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("세션 아이디:"+loginId);

		
		String page = "redirect:/login.go";
		
		if(loginId==null) {
			
			
		}
		
		else if (loginId!=null) { 
			
		data.put("loginId",loginId);
			
			String msg = null;
			if(result>0) {
				//수정에 성공하는 경우 동일한 게시글을 신고한 글의 status를 수정해 준다. 
				// idx, class_no를 활용하여 report_status 변경 . 
				service.changeStatus(data);
				//변경된 status 가 블라인드인 경우 블라인드(테이블 insert) 생성해야 함. 
				logger.info("admin 로그인 아이디 : "+loginId);
				String updateCheck= service.updateCheck(report_no); 
				if(updateCheck.equals("블라인드")) { 
					data.put("reported", reported);
				
					service.insertBlind(data);
				}
		
		
				msg = "상태변경을 완료했습니다.";
				ra.addFlashAttribute("msg",msg); 
			}	
			page = "redirect:/report/detail.go";
			
			/* return "redirect:/report/detail.go"; */
		}
	return page; 
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
		model.addAttribute("report_no",report_no);
		model.addAttribute("idx",idx);
		model.addAttribute("class_no",class_no);
		
		ReportDTO dto= service.reportDetail(report_no);
		model.addAttribute("detailDto",dto);
		
		ReportPostDto reportPost= service.reportPost(data);
		model.addAttribute("reportPost",reportPost);
		
		ArrayList<ReportDTO> blindHistory= service.blindHistory(data);
		 model.addAttribute("blindHistory",blindHistory);
		 
		return "Report/blindDetail";
	}
	
	@RequestMapping("/blindUpdate.do")
	public String blindUpdate(@RequestParam HashMap<String, String> params , @RequestParam(defaultValue = "공개") String blichk 
			, RedirectAttributes ra, HttpSession session) { 
		Map<String, Object> data  = new HashMap<String, Object>();
		
		
		
		logger.info("파라미터 체크:{}",params);
		logger.info("체크박스 여부 {}",blichk );
		String class_no = params.get("class_no");
		String idx =params.get("idx");
		String reason =params.get("reason");
		String reported =params.get("reported");
		int report_no = Integer.parseInt(params.get("report_no")) ;
		String loginId = (String) session.getAttribute("loginId");
		
		data.put("reported", reported);
		data.put("class_no", class_no);
		data.put("idx", idx);
		data.put("reason", reason);
		data.put("report_status", blichk);
		data.put("report_no", report_no);
		data.put("loginId", loginId);
		
		
		// 블라인드 생성하면서 해당 게시글의 상태도 변경시켜줘야 함... 
		int result= service.changeBlind(data);
		// -> 실제 데이터 status 변경  
		String msg = null;
		if(result>0) {
			msg = "수정이 완료되었습니다.";
		}
		
		ra.addFlashAttribute("msg",msg);
		ra.addAttribute("report_no",report_no);
		ra.addAttribute("class_no",class_no);
		ra.addAttribute("idx",idx);
		
		
		return "redirect:/report/blindDetail.go";
	}
	
	@RequestMapping("/memberList.go")
	public String MemberList() { 
		return "Report/memberList"; 
	}
	
	@RequestMapping("/memberList.ajax")
	@ResponseBody
	public Map<String, Object> memberListDo(@RequestParam HashMap<String, String> params){ 
		
		
		return service.memberList(params); 
	}
	
	@RequestMapping("/memberDetail.go")
	public String memberDetail(Model model ,String member_id ,HttpSession session) {
		String page = "redirect:/login.go";
		String loginId= (String) session.getAttribute("loginId");
		if(loginId != null) {
		ReportDTO detail= service.memberDetail(member_id);
		model.addAttribute("detail",detail);
		ReportDTO black= service.blackList(member_id);
		model.addAttribute("black",black);
		model.addAttribute("loginId",loginId);
		page="Report/memberDetail";	
		}
		
	
		return page; 
	}
	
	@RequestMapping("/blindMemberList.ajax")
	@ResponseBody
	public Map<String, Object> blindMemberList(@RequestParam HashMap<String, String> params){ 
	
		return service.blindMemberList(params);
	}
	
	@RequestMapping("/blackReg.ajax")
	@ResponseBody
	public Map<String, Object> blackReg(@RequestParam HashMap<String, String> params,HttpSession session){ 
		
		String loginId=(String) session.getAttribute("loginId");
		params.put("loginId", loginId);
		return service.blackReg(params); 
		
	}
	
	@RequestMapping("/blackMemberList.ajax")
	@ResponseBody
	public Map<String, Object> blackMemberList(@RequestParam HashMap<String, String> params){ 
		
		return service.blackMemberList(params); 
		
	}
	
	@RequestMapping("/boot")
	public String boot() {
		
		return "Report/boot";
	}
	
	
}
