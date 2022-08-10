package com.jmt.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.jmt.admin.dto.ReportDTO;
import com.jmt.admin.dto.ReportPostDto;

public interface ReportDAO {

	ArrayList<ReportDTO>  reportList(int cnt, int offset);

	int allCount(Map<String, Object> data);

	ReportDTO reportDetail(int report_no);

	ArrayList<ReportDTO> reportList(Map<String, Object> data);

	int reportUpdate(Map<String, Object> data);

	
//	각각 정보 찾기 
	
	ReportPostDto select_no3(int idx);

	ReportPostDto select_no1(int idx);

	ReportPostDto select_no2(int idx);

	ReportPostDto select_no4(int idx);

	ReportPostDto select_no6(int idx);

	int blind(String idx);



}
