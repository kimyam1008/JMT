package com.jmt.groupreview.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmt.groupreview.dao.grCommentDAO;
import com.jmt.groupreview.dto.grCommentDTO;
import com.jmt.moim.dto.CommentDTO;

@Service
public class grCommentService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired grCommentDAO dao;
	
	public boolean grWrite(grCommentDTO dto) {
		boolean success = false;
		int row = dao.grWrite(dto);
		if(row>0) {
			success = true;
		}
		return success;
	}

	public ArrayList<CommentDTO> groupReviewList(String idx) {
		logger.info("모임 후기 댓글 리스트");
		return dao.groupReviewList(idx);
	}
}
