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
	public String groupReviewMain(){
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
		//GroupReviewDTO joinGroup = service.joinGroup(loginId);
		model.addAttribute("loginId", loginId);
		//model.addAttribute("joinGroup", joinGroup);
		return "./GroupReview/grRegisterForm";
	}
	
	//모임 후기 작성 > 모임 검색 팝업
	@RequestMapping(value = "/groupSearchPop.go")
	public String groupSearchPop(){
		return "./GroupReview/groupSearchPop";
	}
	
	//모임 검색 팝업 ajax
	/*
	@RequestMapping("/groupSearch.ajax")
	@ResponseBody
	public HashMap<String, Object> groupSearch(@RequestParam String groupSortChange,HttpSession session){
		String loginId = (String) session.getAttribute("loginId");
		logger.info(loginId+" 가 가입한 모임 리스트 요청 : "+groupSortChange);
		return service.groupSearch(groupSortChange,loginId);
	}
	*/
	/*
	@RequestMapping("/groupSearchEnd.ajax")
	@ResponseBody
	public int groupSearchEnd(String lightning_title, String dojang_title, 
			int lightning_no, int dojang_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("lightning_title", lightning_title);
		map.put("dojang_title", dojang_title);
		map.put("lightning_no", lightning_no);
		map.put("dojang_no", dojang_no);
		return service.groupSearchEnd(map);
	}
	*/
	//가입한 번개 목록 가져오기
	@RequestMapping(value = "/lightningCall")
	public ModelAndView lightningCall(HttpSession session){
		String loginId = (String) session.getAttribute("loginId");
		//GroupReviewDTO dto = service.groupReviewDetail(groupReview_no,idx);
		logger.info(loginId+" 가 가입한 번개 목록 요청");
		return service.lightningCall(loginId);
	}
	
	//가입한 도장깨기 목록 가져오기
	@RequestMapping(value = "/dojangCall")
	public ModelAndView dojangCall(HttpSession session){
		String loginId = (String) session.getAttribute("loginId");
		//GroupReviewDTO dto = service.groupReviewDetail(groupReview_no,idx);
		logger.info(loginId+" 가 가입한 도장깨기 목록 요청");
		return service.dojangCall(loginId);
	}
	
	//파일 업로드 팝업
	@RequestMapping(value = "/grFileUploadForm.go")
	public String grFileUploadForm() {
		logger.info("열려라 파일 업로드 팝업~");
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
	
	//모임 후기글 작성
	@RequestMapping(value = "/groupReviewRegister")
	public ModelAndView groupReviewRegister(@RequestParam HashMap<String, String> params, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		logger.info("글쓰기 요청"+params,loginId);
		return service.groupReviewRegister(params,session,loginId);
	}
	
	//모임 후기 상세보기
	@RequestMapping(value = "/groupReviewDetail.do")
	public ModelAndView groupReviewDet(@RequestParam String groupReview_no,
			HttpSession session){
		/*,@RequestParam String idx*/
		String loginId = (String) session.getAttribute("loginId");
		//GroupReviewDTO dto = service.groupReviewDetail(groupReview_no,idx);
		logger.info("모임 후기 상세 페이지 이동 요청");
		return service.groupReviewDetail(groupReview_no);
	}
	
	@RequestMapping(value = "/groupReviewDetail.go")
	public String groupReviewDetail(@RequestParam String groupReview_no, Model model,HttpSession session){
		logger.info("모임 후기 상세 페이지 이동 : "+groupReview_no);
		session.setAttribute("groupReview_no", groupReview_no);
		return "./GroupReview/groupReviewDetail";
	}
	

}
