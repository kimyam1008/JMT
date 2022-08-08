package com.jmt.groupreview.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

}
