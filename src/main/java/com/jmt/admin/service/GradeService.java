package com.jmt.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmt.admin.dao.GradeDAO;
import com.jmt.restaurant.dto.RestaurantDTO;

@Service
public class GradeService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired GradeDAO dao;

	public HashMap<String, Object> gradeList(HashMap<String, String> params) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<RestaurantDTO> list = dao.gradeList(params);
		map.put("list", list);
		
		return map;
	}

	public HashMap<String, Object> update(String col, String val, String team) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int success = dao.update(col,val,team);
		map.put("success", success);
		
		return map;
	}
}

	


