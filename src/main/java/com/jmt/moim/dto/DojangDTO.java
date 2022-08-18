package com.jmt.moim.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;


@Alias("dojang")
public class DojangDTO {
	
	private int dojang_no;
	private String leader_id;
	private String gender;
	private String eat_speed;
	private String dojang_title;
	private String dojang_status;
	private String job;
	private String dojang_content;
	private int people_num;
	private int food_no;
	private int member_count;
	private String test;
	private Date dojang_create;
	
	
	private int apply_no;
	private String member_id;
	private int class_no;
	private String status;
	private String reason;
	private int idx;
	
	private String class_name;
	
	private int dojangPost_no;
	private String dojangPost_subject;
	private String dojangPost_content;
	private String dojangPost_type;
	private Date dojangPost_date;
	private Date dojang_date;
	private String dojangPost_status;
	
	private String restaurant_no;
	private String restaurant_name;
	private String restaurant_address;
	private String food_name;
	private String searchContent;
	
	
	

	private int groupReview_no;
	private String review_title;
	private String review_date;
	private String groupReview_status;
	
	
	private String profile_gender;
	private String profile_job;
	
	
	private String report_reason;
	private String reported;
	private String reporter;
	
	
	private String photo_oriFileName;
	private String photo_newFileName;
	
	
	
	
	
	
	
	
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
	public String getReport_reason() {
		return report_reason;
	}
	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}
	public String getReported() {
		return reported;
	}
	public void setReported(String reported) {
		this.reported = reported;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public String getProfile_gender() {
		return profile_gender;
	}
	public void setProfile_gender(String profile_gender) {
		this.profile_gender = profile_gender;
	}
	public String getProfile_job() {
		return profile_job;
	}
	public void setProfile_job(String profile_job) {
		this.profile_job = profile_job;
	}
	public String getTest() {
		return test;
	}
	public void setTest(String test) {
		this.test = test;
	}
	public int getGroupReview_no() {
		return groupReview_no;
	}
	public void setGroupReview_no(int groupReview_no) {
		this.groupReview_no = groupReview_no;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public String getGroupReview_status() {
		return groupReview_status;
	}
	public void setGroupReview_status(String groupReview_status) {
		this.groupReview_status = groupReview_status;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public Date getDojang_create() {
		return dojang_create;
	}
	public void setDojang_create(Date dojang_create) {
		this.dojang_create = dojang_create;
	}
	public int getDojang_no() {
		return dojang_no;
	}
	public void setDojang_no(int dojang_no) {
		this.dojang_no = dojang_no;
	}
	public String getLeader_id() {
		return leader_id;
	}
	public void setLeader_id(String leader_id) {
		this.leader_id = leader_id;
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
	public String getDojang_title() {
		return dojang_title;
	}
	public void setDojang_title(String dojang_title) {
		this.dojang_title = dojang_title;
	}
	public String getDojang_status() {
		return dojang_status;
	}
	public void setDojang_status(String dojang_status) {
		this.dojang_status = dojang_status;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getDojang_content() {
		return dojang_content;
	}
	public void setDojang_content(String dojang_content) {
		this.dojang_content = dojang_content;
	}
	public int getPeople_num() {
		return people_num;
	}
	public void setPeople_num(int people_num) {
		this.people_num = people_num;
	}
	public int getFood_no() {
		return food_no;
	}
	public void setFood_no(int food_no) {
		this.food_no = food_no;
	}
	public int getMember_count() {
		return member_count;
	}
	public void setMember_count(int member_count) {
		this.member_count = member_count;
	}
	public int getApply_no() {
		return apply_no;
	}
	public void setApply_no(int apply_no) {
		this.apply_no = apply_no;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public int getDojangPost_no() {
		return dojangPost_no;
	}
	public void setDojangPost_no(int dojangPost_no) {
		this.dojangPost_no = dojangPost_no;
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
	public String getDojangPost_type() {
		return dojangPost_type;
	}
	public void setDojangPost_type(String dojangPost_type) {
		this.dojangPost_type = dojangPost_type;
	}
	public Date getDojangPost_date() {
		return dojangPost_date;
	}
	public void setDojangPost_date(Date dojangPost_date) {
		this.dojangPost_date = dojangPost_date;
	}
	public Date getDojang_date() {
		return dojang_date;
	}
	public void setDojang_date(Date dojang_date) {
		this.dojang_date = dojang_date;
	}
	public String getDojangPost_status() {
		return dojangPost_status;
	}
	public void setDojangPost_status(String dojangPost_status) {
		this.dojangPost_status = dojangPost_status;
	}
	public String getRestaurant_no() {
		return restaurant_no;
	}
	public void setRestaurant_no(String restaurant_no) {
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
	
	
	
	
	

}
