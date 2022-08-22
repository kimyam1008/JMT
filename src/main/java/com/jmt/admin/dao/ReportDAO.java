package com.jmt.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.jmt.admin.dto.ReportDTO;
import com.jmt.admin.dto.ReportPostDto;
import com.jmt.admin.dto.TestDto;

public interface ReportDAO {

	ArrayList<ReportDTO>  reportList(int cnt, int offset);

	int allCount(Map<String, Object> data);

	ReportDTO reportDetail(int report_no);

	ArrayList<ReportDTO> reportList(Map<String, Object> data);

	//int reportUpdate(Map<String, Object> data);

	
//	각각 정보 찾기 
	
	ReportPostDto select_no3(int idx);

	ReportPostDto select_no1(int idx);

	ReportPostDto select_no2(int idx);

	ReportPostDto select_no4(int idx);

	ReportPostDto select_no6(int idx);

	int blind(String idx);

	ArrayList<ReportDTO> blindList(Map<String, Object> data);

	String updateCheck(int report_no);

	int insertBlind(Map<String, Object> data);

	int blindCount(Map<String, Object> data);

	ReportDTO reportDetail1(Integer report_no);

	ArrayList<ReportDTO> blindHistory(Integer report_no);

	int reportUpdate1(Map<String, Object> data);

	int reportUpdate2(Map<String, Object> data);

	int reportUpdate3(Map<String, Object> data);

	int reportUpdate4(Map<String, Object> data);

	int reportUpdate6(Map<String, Object> data);

	void changeStatus(Map<String, Object> data);

	/* ArrayList<ReportDTO> blindHistory(Map<String, Object> data); */

	ArrayList<ReportDTO> blindHistory1(int idx);

	ArrayList<ReportDTO> blindHistory2(int idx);

	ArrayList<ReportDTO> blindHistory3(int idx);

	ArrayList<ReportDTO> blindHistory4(int idx);

	ArrayList<ReportDTO> blindHistory6(int idx);

	int allMemberListCount(Map<String, Object> data);

	ArrayList<ReportDTO> MemberList(Map<String, Object> data);

	ReportDTO memberDetail(String member_id);


	int blindMemberCount(Map<String, Object> data);

	ArrayList<ReportDTO> blindMemberList(Map<String, Object> data);

	
	
	int testPost(String loginId);

	ArrayList<TestDto> spoonList();

	void levelUp(Map<String, Object> data);
	void gradeNoti(Map<String, Object> data);

	int chkGrade(String loginId);

	int blackReg(HashMap<String, String> params);

	ReportDTO blackList(String member_id);

	int blackMemberCount(Map<String, Object> data);

	ArrayList<ReportDTO> blackMemberList(Map<String, Object> data);

	void blindNoti(Integer class_no, Integer idx, String reported);

	void blackUPdate(HashMap<String, String> params);






}
