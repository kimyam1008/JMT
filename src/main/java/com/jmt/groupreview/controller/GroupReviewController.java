package com.jmt.groupreview.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jmt.groupreview.dto.GroupReviewDTO;
import com.jmt.groupreview.service.GroupReviewService;

@Controller
public class GroupReviewController {
   
   Logger logger = LoggerFactory.getLogger(this.getClass());

   @Autowired GroupReviewService service;
   
   //리스트 호출
   @RequestMapping(value = "/groupReviewList")
   public String groupReviewMain(HttpSession session,Model model){
	  String loginId = (String) session.getAttribute("loginId");
	  model.addAttribute("loginId", loginId);
      String page ="./GroupReview/groupReviewList";
      return page;
   }
   
   @RequestMapping("/groupReviewList.ajax")
   @ResponseBody
   public HashMap<String, Object> groupReviewList(@RequestParam HashMap<String, String> params){
      logger.info("모임 후기 리스트 요청 : "+params);
      return service.groupReviewList(params);
   }
   
   //모임 후기 검색 ajax
   @RequestMapping("/reviewSearch.ajax")
   @ResponseBody
   public HashMap<String, Object> reviewSearch(@RequestParam HashMap<String, String> params){
      logger.info("검색결과 리스트 요청"+params);
      return service.groupReviewList(params);
   }

   //모임 후기 작성 페이지 이동
   @RequestMapping(value = "/grRegisterForm.go")
   public String grRegisterForm(HttpSession session,Model model){
      String loginId = (String) session.getAttribute("loginId");
      model.addAttribute("loginId", loginId);
      
      //도장리스트
      ArrayList<GroupReviewDTO> groupList = service.groupList(loginId);
      logger.info("도장리스트 size : "+groupList.size());
      //번개리스트
      ArrayList<GroupReviewDTO> lightGroupList = service.lightGroupList(loginId);
      logger.info("번개리스트 size : "+lightGroupList.size());
      
      model.addAttribute("groupList",groupList);
      model.addAttribute("lightGroupList",lightGroupList);
      return "./GroupReview/grRegisterForm";
   }
   
   //파일 업로드 팝업
   @RequestMapping(value = "/grFileUploadForm.go")
   public String grFileUploadForm() {
      logger.info("파일 업로드 팝업 열기");
      return "./GroupReview/grFileUploadForm";
   }
   
   //파일 업로드
   @RequestMapping(value = "/grFileUpload")
   public ModelAndView grFileUpload(MultipartFile file, HttpSession session) {
      logger.info("upload 요청");
      return service.fileUpload(file,session);
   }
   
   //파일 삭제
   @RequestMapping(value = "/grFileDelete.ajax")
   @ResponseBody
   public HashMap<String, Object> grFileDelete(@RequestParam String fileName, HttpSession session) {
      logger.info(fileName+"삭제 요청");
      return service.grFileDelete(fileName,session);
   }
   
   //모임 후기글 작성(저장)
   @RequestMapping(value = "/groupReviewRegister")
   public ModelAndView groupReviewRegister(@RequestParam HashMap<String, String> params, HttpSession session,Model model) {
      String loginId = (String) session.getAttribute("loginId");
	  model.addAttribute("loginId", loginId);
      logger.info("글쓰기 요청"+params,loginId);
      return service.groupReviewRegister(params,session,loginId);
   }
   
   //모임 후기 상세보기
   @RequestMapping(value = "/groupReviewDetail.do")
   public String groupReviewDet(@RequestParam String groupReview_no,
         HttpSession session, Model model){
      /*,@RequestParam String idx*/
      logger.info("모임 후기 상세 페이지 요청");
      String loginId = (String) session.getAttribute("loginId");
      model.addAttribute("loginId", loginId);
      //GroupReviewDTO dto = service.groupReviewDetail(groupReview_no,idx);
      GroupReviewDTO dto = service.groupReviewDetail(groupReview_no,loginId);
      if (dto != null) {
         model.addAttribute("dto", dto);
      }
      return "./GroupReview/groupReviewDetail";
   }
   
   @RequestMapping(value = "/groupReviewDetail.go")
   public String groupReviewDetail(@RequestParam String groupReview_no, Model model,HttpSession session){
      logger.info("모임 후기 상세 페이지 이동 : "+groupReview_no);
      session.setAttribute("groupReview_no", groupReview_no);
      return "./GroupReview/groupReviewDetail";
   }
   
   //모임 상세보기 신고 팝업
   @RequestMapping("/grReviewReport.go")
   public String grReviewReportPopup(Model model,@RequestParam String groupReview_no) {
      logger.info("번개 모임 신고 팝업 이동  : "+groupReview_no);
      model.addAttribute("groupReview_no", groupReview_no);
      return"./GroupReview/grReviewReport";   
   }
   
   @RequestMapping("/grReviewReport.ajax")
   @ResponseBody
   public HashMap<String, Object> grReviewReport(@RequestParam HashMap<String, String> params, HttpSession session) {
      String loginId = (String) session.getAttribute("loginId");
      params.put("loginId", loginId);
      
      logger.info("모임후기글 신고  : "+ params);
      HashMap<String, Object> map = new HashMap<String, Object>();
      boolean report = service.grReviewReport(params);
      map.put("grReviewReport", report);
      return map;   
   }
   
   //모임후기 댓글 신고 팝업 페이지 이동
   @RequestMapping("/grCmtReport.go")
	public String grCmtReport(Model model,@RequestParam String comment_no) {
		logger.info("모임 후기 댓글 신고 팝업 이동  : "+comment_no);
		model.addAttribute("comment_no", comment_no);
		return"./GroupReview/grCmtReport";	
	}
   
   //모임후기 댓글 신고 팝업
   @RequestMapping("/grCmtReport.ajax")
	@ResponseBody
	public HashMap<String, Object> grCmtReport(@RequestParam HashMap<String, String> params, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		params.put("loginId", loginId);
			
		logger.info("번개 모임 댓글 신고  : "+ params);
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean report = service.grCmtReport(params);
		map.put("grCmtReport", report);
		return map;	
	}
   
   
   //삭제(숨김)
   @RequestMapping(value = "/groupReviewDelete.do")
   public String groupReviewDelete(@RequestParam HashMap<String, String> params, Model model,HttpSession session){
      //String page ="redirect:/groupReviewList.go";
      logger.info("삭제(숨김)요청 : "+params.get("groupReview_no"));
      service.groupReviewDelete(params);
      return "./GroupReview/groupReviewList";
   }
   
   //모임후기 수정
   @RequestMapping(value = "/groupReviewUpdate.go")
   public String groupReviewUpdateGo(@RequestParam String groupReview_no, Model model,HttpSession session){
      String loginId = (String) session.getAttribute("loginId");
      String page = "redirect:/groupReviewList.do";
      logger.info("모임 후기 수정 페이지 요청 : "+groupReview_no);
      model.addAttribute("loginId", loginId);
      
      //도장리스트
      ArrayList<GroupReviewDTO> groupList = service.groupList(loginId);
      logger.info("도장리스트 size : "+groupList.size());
      model.addAttribute("groupList",groupList);
      
      //번개리스트
      ArrayList<GroupReviewDTO> lightGroupList = service.lightGroupList(loginId);
      logger.info("번개리스트 size : "+lightGroupList.size());
      model.addAttribute("lightGroupList",lightGroupList);
      
      //작성 내용
      GroupReviewDTO dto = service.groupReviewDetail(groupReview_no,loginId);
      if (dto != null) {
         model.addAttribute("dto", dto);
         page="./GroupReview/groupReviewUpdate";
      }
      
      return page;
   }
   
   @RequestMapping(value="/groupReviewUpdate")
   public ModelAndView groupReviewUpdate(@RequestParam HashMap<String, String> params, HttpSession session) {
      String loginId = (String) session.getAttribute("loginId");
      logger.info("수정 요청"+params,loginId);
      System.out.println("수정 서비스 요청");
      return service.groupReviewUpdate(params,session,loginId);
   }
   
}