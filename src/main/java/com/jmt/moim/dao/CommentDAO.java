package com.jmt.moim.dao;

import java.util.ArrayList;

import com.jmt.moim.dto.CommentDTO;

public interface CommentDAO {

	int cmtWrite(CommentDTO dto);

	ArrayList<CommentDTO> cmtList(String class_no, String idx);

	int cmtDel(String comment_no);

	int cmtUpd(String comment_no, String comment_content);

}
