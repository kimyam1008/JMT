package com.jmt.moim.dao;

import java.util.ArrayList;

import com.jmt.moim.dto.CommentDTO;

public interface CommentDAO {

	int lightWrite(CommentDTO dto);

	ArrayList<CommentDTO> lightList(String idx);

}
