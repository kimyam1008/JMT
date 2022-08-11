package com.jmt.groupreview.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jmt.groupreview.dto.grCommentDTO;
import com.jmt.groupreview.service.grCommentService;
import com.jmt.moim.dto.CommentDTO;

@RestController
@RequestMapping(value="/grComment") //grComment로 시작하는 요청은 무조건 여기로 옴
public class grCommentController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired grCommentService service;
	
	//댓글 작성
	@RequestMapping(value="/lightWrite")
	public HashMap<String, Object> write(@RequestBody grCommentDTO dto) {
		logger.info("댓글 작성 : " + dto.getComment_content());
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		boolean grSuccess = service.grWrite(dto);
		map.put("grSuccess", grSuccess);
		return map; 
	}
	
	//댓글 리스트
	//@PathVariable : 경로 변수  
	@RequestMapping(value = "/groupReviewList/{idx}")
	public HashMap<String, Object> groupReviewList(@PathVariable String idx) {
		logger.info("모임 후기 댓글 리스트: " + idx);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<CommentDTO> groupReviewList = service.groupReviewList(idx);
		logger.info("모임 후기 댓글 수 : " + groupReviewList.size());
		map.put("groupReviewList", groupReviewList);
		return map;
	}
}
