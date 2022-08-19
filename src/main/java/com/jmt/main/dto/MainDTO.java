package com.jmt.main.dto;

import org.apache.ibatis.type.Alias;

@Alias("main")
public class MainDTO {
	//groupReview
	private int groupReview_no;
	private String member_id;
	private int class_no;
	private String review_title;
	private String review_content;
	private int idx;
	
	//restaurant
	private int restaurant_no;
	private String restaurant_name;
	private String restaurant_address;
	
	//dojangList
	private int dojang_no;
	private String dojang_title;
	
	//lightningList
	private int lightning_no;
	private String lightning_title;
	
	//codeTable
	private String class_name;
	
	//photo
	private int photo_no;
	private String photo_oriFileName;
	private String photo_newFileName;
	
	//food
	private int food_no;
	private String food_name;
	
	//member
	private String member_name;
	
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getFood_no() {
		return food_no;
	}
	public void setFood_no(int food_no) {
		this.food_no = food_no;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public int getGroupReview_no() {
		return groupReview_no;
	}
	public void setGroupReview_no(int groupReview_no) {
		this.groupReview_no = groupReview_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getClass_no() {
		return class_no;
	}
	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getRestaurant_no() {
		return restaurant_no;
	}
	public void setRestaurant_no(int restaurant_no) {
		this.restaurant_no = restaurant_no;
	}
	public String getRestaurant_name() {
		return restaurant_name;
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
	public int getDojang_no() {
		return dojang_no;
	}
	public void setDojang_no(int dojang_no) {
		this.dojang_no = dojang_no;
	}
	public String getDojang_title() {
		return dojang_title;
	}
	public void setDojang_title(String dojang_title) {
		this.dojang_title = dojang_title;
	}
	public int getLightning_no() {
		return lightning_no;
	}
	public void setLightning_no(int lightning_no) {
		this.lightning_no = lightning_no;
	}
	public String getLightning_title() {
		return lightning_title;
	}
	public void setLightning_title(String lightning_title) {
		this.lightning_title = lightning_title;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public int getPhoto_no() {
		return photo_no;
	}
	public void setPhoto_no(int photo_no) {
		this.photo_no = photo_no;
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
	
}
