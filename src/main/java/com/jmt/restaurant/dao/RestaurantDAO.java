package com.jmt.restaurant.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.ui.Model;

import com.jmt.moim.dto.DojangDTO;
import com.jmt.restaurant.dto.RestaurantDTO;

public interface RestaurantDAO {


	RestaurantDTO resDetail(String restaurant_no);
	
	ArrayList<RestaurantDTO> foodname();

	int allCount(HashMap<String, Object> searchResult);

	ArrayList<RestaurantDTO> resList(HashMap<String, Object> searchResult);

	void restaurantWrite(RestaurantDTO dto);

	int reviewWrite(RestaurantDTO dto);

	void reviewFileWrite(String oriFileName, String newFileName, int idx, int class_no);

	ArrayList<RestaurantDTO> photoList(String restaurant_no);

	ArrayList<RestaurantDTO> resCommet(String restaurant_no);

	ArrayList<RestaurantDTO> lightninglist(String restaurant_no);

	HashMap<String, String> commentDel(HashMap<String, String> params);

	ArrayList<RestaurantDTO> photoDel(HashMap<String, String> params);

	RestaurantDTO reviewUpdate(String comment_no);

	ArrayList<RestaurantDTO> reviewPhoto(String comment_no);

	HashMap<String, String> reviewDel(HashMap<String, String> params);

	

}
