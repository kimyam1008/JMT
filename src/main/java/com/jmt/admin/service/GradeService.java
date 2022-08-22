package com.jmt.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmt.admin.dao.GradeDAO;
import com.jmt.admin.dto.Grade_DTO;
import com.jmt.restaurant.dto.RestaurantDTO;

import sun.print.resources.serviceui;

@Service
public class GradeService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired GradeDAO dao;
	
	

//	public HashMap<String, Object> gradeList(HashMap<String, String> params) {
//		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		ArrayList<RestaurantDTO> list = dao.gradeList(params);
//		map.put("list", list);
//		
//		return map;
//	}
//
//	public HashMap<String, Object> update(String col, String val, String team) {
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		
//		int success = dao.update(col,val,team);
//		map.put("success", success);
//		
//		return map;
//	}
	
//	public String colorCode(String string) {
//	
//	logger.info(" : "+string);
//	
//	return null;
//	//return dao.colorCode(string);
//	
//}

	public int dojang_no(String loginId) {
		int dojang_no = dao.dojang_no(loginId);
		return dojang_no; 
	
	}

	public int dojang_no2(String loginId) {
		int dojang_no2 = dao.dojang_no2(loginId);
		return dojang_no2; 
	}

	public int il_no(String loginId) {
		int il_no = dao.il_no(loginId);
		return il_no; 
	}

	
	public ArrayList<HashMap<String, Object>> list() {
		return dao.list();
	}

	public int gradeUpdate(HashMap<String, String> params) {
		
		Grade_DTO dto = new Grade_DTO();
		
		dto.setGrade_name(params.get("grade_name"));
		dto.setGrade_color(params.get("grade_color"));
		dto.setGrade_post(Integer.parseInt(params.get("grade_post")));
		dto.setGrade_no(Integer.parseInt(params.get("grade_no")));
		dto.setGrade_comment(Integer.parseInt(params.get("grade_comment")));
		
		
		return dao.gradeUpdate(dto);
	
		
		
		
	}

	
}

	


