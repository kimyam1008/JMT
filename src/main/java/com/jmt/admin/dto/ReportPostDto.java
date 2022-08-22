package com.jmt.admin.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;


public class ReportPostDto {
	// lightninglist 
	private int lightning_no; 
	private String leader_id; 
	private int restaurant_no;
	private int member_num;
	private String gender;
	private String eat_speed;
	private String lightning_title;
	private String lightning_status;
	private String job;
	private Date lightning_date;
	private int food_no;
	private String lightning_content;
	private int  member_count;
	private int class_no;
	private int idx; 
	
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	//lightning comment 
	private String comment_content;
	private Date comment_date ;
	
	// dojang list 
	private int dojang_no;
	private String dojang_title;
	private String dojang_content;
	private Date dojang_create;
	
	
	//dojang post 
	private String dojangPost_subject;
	private String dojangPost_content;
	
	
	private String review_title;
	private String review_content;
	
	// status 

	private String comment_status;
	private String dojang_status;
	private String dojangPost_status;
	private String groupReview_status;
	
	
	
	
	
	
	
	
	public String getComment_status() {
		return comment_status;
	}
	public void setComment_status(String comment_status) {
		this.comment_status = comment_status;
	}
	public String getDojang_status() {
		return dojang_status;
	}
	public void setDojang_status(String dojang_status) {
		this.dojang_status = dojang_status;
	}
	public String getDojangPost_status() {
		return dojangPost_status;
	}
	public void setDojangPost_status(String dojangPost_status) {
		this.dojangPost_status = dojangPost_status;
	}
	public String getGroupReview_status() {
		return groupReview_status;
	}
	public void setGroupReview_status(String groupReview_status) {
		this.groupReview_status = groupReview_status;
	}
	public int getLightning_no() {
		return lightning_no;
	}
	public void setLightning_no(int lightning_no) {
		this.lightning_no = lightning_no;
	}
	public String getLeader_id() {
		return leader_id;
	}
	public void setLeader_id(String leader_id) {
		this.leader_id = leader_id;
	}
	public int getRestaurant_no() {
		return restaurant_no;
	}
	public void setRestaurant_no(int restaurant_no) {
		this.restaurant_no = restaurant_no;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEat_speed() {
		return eat_speed;
	}
	public void setEat_speed(String eat_speed) {
		this.eat_speed = eat_speed;
	}
	public String getLightning_title() {
		return lightning_title;
	}
	public void setLightning_title(String lightning_title) {
		this.lightning_title = lightning_title;
	}
	public String getLightning_status() {
		return lightning_status;
	}
	public void setLightning_status(String lightning_status) {
		this.lightning_status = lightning_status;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public Date getLightning_date() {
		return lightning_date;
	}
	public void setLightning_date(Date lightning_date) {
		this.lightning_date = lightning_date;
	}
	public int getFood_no() {
		return food_no;
	}
	public void setFood_no(int food_no) {
		this.food_no = food_no;
	}

	public String getLightning_content() {
		return lightning_content;
	}
	public void setLightning_content(String lightning_content) {
		this.lightning_content = lightning_content;
	}
	public int getMember_count() {
		return member_count;
	}
	public void setMember_count(int member_count) {
		this.member_count = member_count;
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
	public String getDojang_content() {
		return dojang_content;
	}
	public void setDojang_content(String dojang_content) {
		this.dojang_content = dojang_content;
	}
	public Date getDojang_create() {
		return dojang_create;
	}
	public void setDojang_create(Date dojang_create) {
		this.dojang_create = dojang_create;
	}
	public String getDojangPost_subject() {
		return dojangPost_subject;
	}
	public void setDojangPost_subject(String dojangPost_subject) {
		this.dojangPost_subject = dojangPost_subject;
	}
	public String getDojangPost_content() {
		return dojangPost_content;
	}
	public void setDojangPost_content(String dojangPost_content) {
		this.dojangPost_content = dojangPost_content;
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
	

	
	
	
	
	
	
	
	
}
