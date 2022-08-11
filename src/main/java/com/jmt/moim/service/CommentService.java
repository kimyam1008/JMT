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

	public boolean lightWrite(CommentDTO dto) {
		boolean success = false;
		int row = dao.lightWrite(dto);
		if(row>0) {
			success = true;
		}
		return success;
	}

	public ArrayList<CommentDTO> lightList(String idx) {
		logger.info("번개 모임 댓글 리스트");
		return dao.lightList(idx);
	}
}
