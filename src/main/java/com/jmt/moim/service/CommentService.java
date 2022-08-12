package com.jmt.moim.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jmt.moim.dao.CommentDAO;
import com.jmt.moim.dto.CommentDTO;

@Service
public class CommentService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CommentDAO dao;

	public boolean cmtWrite(CommentDTO dto) {
		logger.info("댓글 작성 서비스");
		boolean success = false;
		int row = dao.cmtWrite(dto);
		if(row>0) {
			success = true;
		}
		return success;
	}

	public ArrayList<CommentDTO> cmtList(String class_no, String idx) {
		logger.info("번개 모임 댓글 리스트");
		return dao.cmtList(class_no,idx);
	}

	public boolean cmtDel(String comment_no) {
		logger.info("댓글 삭제 서비스");
		boolean success = false;
		int row = dao.cmtDel(comment_no);
		if(row>0) {
			success = true;
		}
		return success;
	}
}
