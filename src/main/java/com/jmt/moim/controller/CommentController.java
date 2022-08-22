package com.jmt.moim.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jmt.moim.dto.CommentDTO;
import com.jmt.moim.service.CommentService;

@RestController
@RequestMapping(value="/comment") //comment로 시작하는 요청은 무조건 이 컨트롤러를 타게 된다. 
public class CommentController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CommentService service;
	
	
	//댓글 작성 
	//필요한 파라미터 : member_id, comment_content, class_no, (댓글이 작성되는 글의)글번호
	@RequestMapping(value="/cmtWrite")
	public HashMap<String, Object> write(@RequestBody CommentDTO dto, HttpSession session) {
		logger.info("댓글 작성 : " + dto.getComment_content());
		HashMap<String, Object> map = new HashMap<String, Object>();
		String loginId = (String) session.getAttribute("loginId");
		
		if(loginId != null) {
			boolean writeSuccess = service.cmtWrite(dto);
			map.put("writeSuccess", writeSuccess);
		}
		return map; 
	}
	
	//댓글 리스트 불러오기
	//@PathVariable : 경로 변수  
	//필요한 파라미터 : class_no, (댓글이 작성되는 글의)글번호
	@RequestMapping(value = "/cmtList/{class_no}/{idx}")
	public HashMap<String, Object> list(@PathVariable String class_no,@PathVariable String idx) {
		logger.info(" 댓글 리스트: " + idx);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<CommentDTO> cmtList = service.cmtList(class_no,idx);
		logger.info(" 댓글 수 : " + cmtList.size());
		map.put("cmtList", cmtList);
		return map;
	}
	
	
	//댓글 삭제 
	//필요한 파라미터 : "삭제"로 update 되어야 하는 댓글 코드 
	@RequestMapping(value="/cmtDel")
	public HashMap<String, Object> delete(@RequestParam String comment_no) {
		logger.info("댓글 삭제 : " +comment_no);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		boolean delSuccess = service.cmtDel(comment_no);
		logger.info("삭제 여부 : " + delSuccess);
		map.put("delSuccess", delSuccess);
		return map; 
	}
	
	
	//댓글 수정  
	//필요한 파라미터 : 내용 ,댓글 코드 
	@RequestMapping(value="/cmtUpd")
	public HashMap<String, Object> update(@RequestParam String comment_no,@RequestParam String comment_content) {
		logger.info("댓글 수정 : " +comment_no + comment_content);
		HashMap<String, Object> map = new HashMap<String, Object>();
			
		boolean updSuccess = service.cmtUpd(comment_no,comment_content);
		logger.info("수정 여부 : " + updSuccess);
		map.put("updSuccess", updSuccess);
		return map; 
	}
	
	
	
}
