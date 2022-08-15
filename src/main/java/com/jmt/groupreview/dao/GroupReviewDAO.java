package com.jmt.groupreview.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.jmt.groupreview.dto.GroupReviewDTO;

public interface GroupReviewDAO {


	ArrayList<GroupReviewDTO> groupReviewList(HashMap<String, Object> searchResult);

	int allCount(HashMap<String, Object> searchResult);

	ArrayList<GroupReviewDTO> sortNumChange(String sortNum, int cnt, int offset);

	GroupReviewDTO groupReviewDetail(String groupReview_no, String loginId);

	void grFileWrite(String newFileName, String string, int class_no, int idx);

	void groupReviewRegister(GroupReviewDTO dto);

	ArrayList<GroupReviewDTO> grPhotoList(String idx);

	ArrayList<GroupReviewDTO> groupList(String loginId);

	ArrayList<GroupReviewDTO> lightGroupList(String loginId);

	int grReviewReport(HashMap<String, String> params);

	int groupReviewDelete(HashMap<String, String> params);

	void groupReviewUpdate(GroupReviewDTO dto);

	int groupReviewUpdate(HashMap<String, String> params);

	int grCmtReport(HashMap<String, String> params);


}
