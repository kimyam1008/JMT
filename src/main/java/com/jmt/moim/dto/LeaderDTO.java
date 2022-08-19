package com.jmt.moim.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

@Alias("leader")
public class LeaderDTO {
	//member
	private String member_id;
	private String member_name;
	private String member_status;
	
	//apply
	private int apply_no;
	private String status;
	private String reason;
	private String idx;
	
	//food
	private int food_no;
	private String food_name;
	
	//codeTable
	private int class_no;
	private String class_name;
	
	//lightningList
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
	private String lightning_content;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date lightning_create;
	
	//dojangList
	private int dojang_no;
	private int people_num;
	private String dojang_title;
	private String dojang_status;
	private String dojang_content;
	private Date dojang_create;
	
	//dojangPost
	private int dojangPost_no;
	private String dojangPost_subject;
	private String dojangPost_content;
	private String dojangPost_date;
	
	//groupReview
	private int groupReview_no;
	private String review_title;
	private Date review_date;
	
	//comment
	private String comment_content;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date comment_date;
	private int comment_no;
	
	//etc
	private String leaderName;
	private int member_count;
	private int post_count;
	private int comment_count;
	private String photo_newFileName;
	
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
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
	public int getPost_count() {
		return post_count;
	}
	public void setPost_count(int post_count) {
		this.post_count = post_count;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	public String getPhoto_newFileName() {
		return photo_newFileName;
	}
	public void setPhoto_newFileName(String photo_newFileName) {
		this.photo_newFileName = photo_newFileName;
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
	public String getDojangPost_date() {
		return dojangPost_date;
	}
	public void setDojangPost_date(String dojangPost_date) {
		this.dojangPost_date = dojangPost_date;
	}
	public String getLeaderName() {
		return leaderName;
	}
	public void setLeaderName(String leaderName) {
		this.leaderName = leaderName;
	}
	public int getMember_count() {
		return member_count;
	}
	public void setMember_count(int member_count) {
		this.member_count = member_count;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_status() {
		return member_status;
	}
	public void setMember_status(String member_status) {
		this.member_status = member_status;
	}
	public int getApply_no() {
		return apply_no;
	}
	public void setApply_no(int apply_no) {
		this.apply_no = apply_no;
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
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
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
	public int getClass_no() {
		return class_no;
	}
	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
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
	public String getLightning_content() {
		return lightning_content;
	}
	public void setLightning_content(String lightning_content) {
		this.lightning_content = lightning_content;
	}
	public Date getLightning_create() {
		return lightning_create;
	}
	public void setLightning_create(Date lightning_create) {
		this.lightning_create = lightning_create;
	}
	public int getDojang_no() {
		return dojang_no;
	}
	public void setDojang_no(int dojang_no) {
		this.dojang_no = dojang_no;
	}
	public int getPeople_num() {
		return people_num;
	}
	public void setPeople_num(int people_num) {
		this.people_num = people_num;
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
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	
	
}
