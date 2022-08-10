package com.jmt.restaurant.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.jmt.moim.dto.DojangDTO;
import com.jmt.restaurant.dto.RestaurantDTO;

public interface RestaurantDAO {


	//ArrayList<RestaurantDTO> allCount(HashMap<String, Object> map);

	//ArrayList<RestaurantDTO> searchFood_no(int cnt, int offset, String word);

	//ArrayList<RestaurantDTO> resList(int cnt, int offset);

	RestaurantDTO resDetail(String restaurant_no);

	RestaurantDTO lightninglist(String restaurant_no);

	ArrayList<RestaurantDTO> foodname();

	int allCount(HashMap<String, Object> searchResult);

	ArrayList<RestaurantDTO> resList(HashMap<String, Object> searchResult);

	void restaurantWrite(RestaurantDTO dto);

	int reviewWrite(RestaurantDTO dto);

	void reviewFileWrite(String oriFileName, String newFileName, int idx, int class_no);

	void photoList(String restaurant_no);

	//ArrayList<RestaurantDTO> photoList();



	


}
