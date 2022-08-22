package com.jmt.restaurant.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

@Alias("res")
public class RestaurantDTO {

	// 맛집
	private int restaurant_no;
	private String restaurant_name;
	private String restaurant_address;
	private String restaurant_call;
	private double restaurant_X;
	private double restaurant_Y;
	private String restaurant_info;
	
	
	// 음식 카테고리
	private int food_no;
	private String food_name;
	
	// 맛집 수정요청
	private int restuarantUpdate_no;
	private String member_id;
	private String restaurantUpdate_reason;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",timezone = "Asia/Seoul")
	private Date restaurantUpdate_date;
	private String restaurantUpdate_proc_status;
	
	
	// 사진
	private int photo_no;
	
	private String photo_oriFileName;
	private String photo_newFileName;
	
	// 번개모임
	private String lightning_title;
	private String lightning_status;
	private int lightning_no;
	// 댓글 종합 
	private int comment_no;
	private int class_no;
	private String comment_content;
	private Date comment_date;
	private String comment_status;
	private int idx;
	
	
	//좋아요
	private int like_no;
	private int like_count;
	
	private int profile_no;
	
	
	public int getProfile_no() {
		return profile_no;
	}
	public void setProfile_no(int profile_no) {
		this.profile_no = profile_no;
	}
	public int getLike_no() {
		return like_no;
	}
	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	
	
		
	public int getPhoto_no() {
		return photo_no;
	}
	public void setPhoto_no(int photo_no) {
		this.photo_no = photo_no;
	}
	public String getLightning_title() {
		return lightning_title;
	}
	public void setLightning_title(String lightning_title) {
		this.lightning_title = lightning_title;
	}
	public String getPhoto_oriFileName() {
		return photo_oriFileName;
	}
	public void setPhoto_oriFileName(String photo_oriFileName) {
		this.photo_oriFileName = photo_oriFileName;
	}
	public String getPhoto_newFileName() {
		return photo_newFileName;
	}
	public void setPhoto_newFileName(String photo_newFileName) {
		this.photo_newFileName = photo_newFileName;
	}
	
	
	
	
	
	public int getLightning_no() {
		return lightning_no;
	}
	public void setLightning_no(int lightning_no) {
		this.lightning_no = lightning_no;
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public int getClass_no() {
		return class_no;
	}
	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	public String getComment_status() {
		return comment_status;
	}
	public void setComment_status(String comment_status) {
		this.comment_status = comment_status;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getRestaurant_name() {
		return restaurant_name;
	}
	public int getRestuarantUpdate_no() {
		return restuarantUpdate_no;
	}
	public void setRestuarantUpdate_no(int restuarantUpdate_no) {
		this.restuarantUpdate_no = restuarantUpdate_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getRestaurantUpdate_reason() {
		return restaurantUpdate_reason;
	}
	public void setRestaurantUpdate_reason(String restaurantUpdate_reason) {
		this.restaurantUpdate_reason = restaurantUpdate_reason;
	}
	public Date getRestaurantUpdate_date() {
		return restaurantUpdate_date;
	}
	public void setRestaurantUpdate_date(Date restaurantUpdate_date) {
		this.restaurantUpdate_date = restaurantUpdate_date;
	}
	public String getRestaurantUpdate_proc_status() {
		return restaurantUpdate_proc_status;
	}
	public void setRestaurantUpdate_proc_status(String restaurantUpdate_proc_status) {
		this.restaurantUpdate_proc_status = restaurantUpdate_proc_status;
	}
	public int getRestaurant_no() {
		return restaurant_no;
	}
	public void setRestaurant_no(int restaurant_no) {
		this.restaurant_no = restaurant_no;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public void setRestaurant_name(String restaurant_name) {
		this.restaurant_name = restaurant_name;
	}
	public String getRestaurant_address() {
		return restaurant_address;
	}
	public void setRestaurant_address(String restaurant_address) {
		this.restaurant_address = restaurant_address;
	}
	public String getRestaurant_call() {
		return restaurant_call;
	}
	public void setRestaurant_call(String restaurant_call) {
		this.restaurant_call = restaurant_call;
	}
	public double getRestaurant_X() {
		return restaurant_X;
	}
	public void setRestaurant_X(double restaurant_X) {
		this.restaurant_X = restaurant_X;
	}
	public double getRestaurant_Y() {
		return restaurant_Y;
	}
	public void setRestaurant_Y(double restaurant_Y) {
		this.restaurant_Y = restaurant_Y;
	}
	public String getRestaurant_info() {
		return restaurant_info;
	}
	public void setRestaurant_info(String restaurant_info) {
		this.restaurant_info = restaurant_info;
	}
	public int getFood_no() {
		return food_no;
	}
	public void setFood_no(int food_no) {
		this.food_no = food_no;
	}
	
	private String likeNo;

	private String likeMember;
	
	

	public String getLikeMember() {
		return likeMember;
	}
	public void setLikeMember(String likeMember) {
		this.likeMember = likeMember;
	}
	public String getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(String likeNo) {
		this.likeNo = likeNo;
	}
	public String getLightning_status() {
		return lightning_status;
	}
	
	public void setLightning_status(String lightning_status) {
		this.lightning_status = lightning_status;
	}


	
	
	
	
	
}
