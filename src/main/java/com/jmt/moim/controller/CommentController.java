package com.jmt.moim.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jmt.moim.dto.CommentDTO;
import com.jmt.moim.service.CommentService;

@RestController
@RequestMapping(value="/comment") //comment로 시작하는 요청은 무조건 이 컨트롤러를 타게 된다. 
public class CommentController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CommentService service;
	
	
	//댓글 작성 
	@RequestMapping(value="/lightWrite")
	public HashMap<String, Object> write(@RequestBody CommentDTO dto) {
		logger.info("댓글 작성 : " + dto.getComment_content());
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		boolean lightSuccess = service.lightWrite(dto);
		map.put("lightSuccess", lightSuccess);
		return map; 
	}
	
	//댓글 리스트 
	//@PathVariable : 경로 변수  
	@RequestMapping(value = "/lightList/{idx}")
	public HashMap<String, Object> lightList(@PathVariable String idx) {
			logger.info("번개모임 댓글 리스트: " + idx);
			HashMap<String, Object> map = new HashMap<String, Object>();
			ArrayList<CommentDTO> lightList = service.lightList(idx);
			logger.info("번개 모임 댓글 수 : " + lightList.size());
			map.put("lightList", lightList);
			return map;
		}
	
}
