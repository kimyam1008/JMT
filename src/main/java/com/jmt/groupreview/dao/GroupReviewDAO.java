package com.jmt.groupreview.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.jmt.groupreview.dto.GroupReviewDTO;

public interface GroupReviewDAO {

	//ArrayList<GroupReviewDTO> groupReviewList();

	//ArrayList<GroupReviewDTO> reviewSearch(String keyword);

	ArrayList<GroupReviewDTO> groupReviewList(HashMap<String, Object> searchResult);

	int allCount(HashMap<String, Object> searchResult);

}
