package com.jmt.restaurant.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.ui.Model;

import com.jmt.moim.dto.DojangDTO;
import com.jmt.restaurant.dto.RestaurantDTO;

public interface RestaurantDAO {


	RestaurantDTO resDetail(int restaurant_no);
	
	ArrayList<RestaurantDTO> foodname();

	int allCount(HashMap<String, Object> searchResult);

	ArrayList<RestaurantDTO> resList(HashMap<String, Object> searchResult);

	void restaurantWrite(RestaurantDTO dto);

	int reviewWrite(RestaurantDTO dto);

	void reviewFileWrite(String oriFileName, String newFileName, int idx, int class_no);

	ArrayList<RestaurantDTO> photoList(int restaurant_no);

	ArrayList<RestaurantDTO> resCommet(String loginId, int restaurant_no);

	ArrayList<RestaurantDTO> lightninglist(int restaurant_no);

	int commentDel(HashMap<String, String> params);

	ArrayList<RestaurantDTO> photoDel(HashMap<String, String> params);

	RestaurantDTO reviewUpdate(String comment_no);

	ArrayList<RestaurantDTO> reviewPhoto(String comment_no);

	int reviewReLoad(RestaurantDTO dto);

	int like(HashMap<String, String> params);

	HashMap<String, String> findLike(HashMap<String, String> params);

	int likeDel(HashMap<String, String> params);

	ArrayList<RestaurantDTO> resUpdateList(HashMap<String, Object> searchResult);

	RestaurantDTO requestNO(int restaurant_no);

	RestaurantDTO restuarantUpdateNo(int restuarantUpdate_no);

	int resAdminUpdate(RestaurantDTO dto);

	int reviewDel(HashMap<String, String> params);

	ArrayList<RestaurantDTO> photoDelList(HashMap<String, String> params);

	int Reporthandling(RestaurantDTO dto);

	int allCount2(HashMap<String, Object> searchResult);

	ArrayList<HashMap<String, String>> CommentPhoto(int comment_no);

	HashMap<String, String> commentPhotoDel(HashMap<String, String> params);

	ArrayList<HashMap<String, String>> CommentLike(int comment_no);

	RestaurantDTO commentList(int comment_no);

	ArrayList<HashMap<String, String>> memberPhoto(String member_id);

	int resCmtReport(HashMap<String, String> params);




	

	

}
