package com.jmt.groupreview.dao;

import java.util.ArrayList;

import com.jmt.groupreview.dto.grCommentDTO;
import com.jmt.moim.dto.CommentDTO;

public interface grCommentDAO {

	int grWrite(grCommentDTO dto);

	ArrayList<CommentDTO> groupReviewList(String idx);

}
