package com.jmt.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface ReportDAO {

	ArrayList<HashMap<String, Object>>  reportList(int cnt, int offset);

	int allCount();



}
