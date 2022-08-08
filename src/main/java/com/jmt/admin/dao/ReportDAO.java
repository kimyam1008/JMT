package com.jmt.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.jmt.admin.dto.ReportDTO;

public interface ReportDAO {

	ArrayList<ReportDTO>  reportList(int cnt, int offset);

	int allCount(Map<String, Object> data);

	ReportDTO reportDetail(int report_no);

	ArrayList<ReportDTO> reportList(Map<String, Object> data);

	int reportUpdate(Map<String, Object> data);



}
