package com.jmt.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.jmt.restaurant.dto.RestaurantDTO;

public interface GradeDAO {

	ArrayList<RestaurantDTO> gradeList(HashMap<String, String> params);

	int update(String col, String val, String team);

}
