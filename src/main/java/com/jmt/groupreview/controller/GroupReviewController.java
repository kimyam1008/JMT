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
	@RequestMapping(value = "/groupReviewRegister.go")
	public String groupReviewRegisterGo(){
		return "./GroupReview/groupReviewRegister";
	}
	
	//모임 후기 작성 > 모임 검색 팝업
	@RequestMapping(value = "/groupSearchPop.go")
	public String groupSearchPop(){
		return "./GroupReview/groupSearchPop";
	}
	
	//모임 후기 상세보기
	@RequestMapping(value = "/groupReviewDetail.do")
	public String groupReviewDet(String groupReview_no, Model model){
		GroupReviewDTO dto = service.groupReviewDetail(groupReview_no);
		logger.info("모임 후기 상세 페이지 이동 요청");
		model.addAttribute("dto", dto);
		return "./GroupReview/groupReviewDetail";
	}
	
	@RequestMapping(value = "/groupReviewDetail.go")
	public String groupReviewDetail(@RequestParam String groupReview_no, Model model,HttpSession session){
		logger.info("모임 후기 상세 페이지 이동 : "+groupReview_no);
		session.setAttribute("groupReview_no", groupReview_no);
		return "./GroupReview/groupReviewDetail";
	}
}
