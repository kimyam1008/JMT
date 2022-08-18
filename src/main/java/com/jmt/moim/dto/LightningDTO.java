package com.jmt.moim.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;


@Alias("light")
public class LightningDTO {

	private int food_no;
	private String food_name;
	
	//restaurant
	private int restaurant_no;
	private String restaurant_address;
	private String restaurant_name;
	
	
	private int lightning_no;
	private String leader_id;
	private String lightning_title;
	private Date lightning_date;
	private int member_num;
	private int member_count;
	private String lightning_status;
	private String participate;
	private String lightning_content;
	private Date lightning_create;
	
	private String eat_speed;
	private String gender;
	private String job;
	
	//apply
	private String status;
	
	//profile
	private String profile_gender;
	private String profile_job;
	
	
	//comment
	private int comment_no;
	
	

	
	
	
	
	
	public int getRestaurant_no() {
		return restaurant_no;
	}
	public void setRestaurant_no(int restaurant_no) {
		this.restaurant_no = restaurant_no;
	}
	
	public String getRestaurant_address() {
		return restaurant_address;
	}
	public void setRestaurant_address(String restaurant_address) {
		this.restaurant_address = restaurant_address;
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getLightning_create() {
		return lightning_create;
	}
	public void setLightning_create(Date lightning_create) {
		this.lightning_create = lightning_create;
	}
	public String getEat_speed() {
		return eat_speed;
	}
	public void setEat_speed(String eat_speed) {
		this.eat_speed = eat_speed;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getLightning_content() {
		return lightning_content;
	}
	public void setLightning_content(String lightning_content) {
		this.lightning_content = lightning_content;
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
	public String getRestaurant_name() {
		return restaurant_name;
	}
	public void setRestaurant_name(String restaurant_name) {
		this.restaurant_name = restaurant_name;
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
	public String getLightning_title() {
		return lightning_title;
	}
	public void setLightning_title(String lightning_title) {
		this.lightning_title = lightning_title;
	}
	public Date getLightning_date() {
		return lightning_date;
	}
	public void setLightning_date(Date lightning_date) {
		this.lightning_date = lightning_date;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public int getMember_count() {
		return member_count;
	}
	public void setMember_count(int member_count) {
		this.member_count = member_count;
	}
	public String getLightning_status() {
		return lightning_status;
	}
	public void setLightning_status(String lightning_status) {
		this.lightning_status = lightning_status;
	}
	public String getParticipate() {
		return participate;
	}
	public void setParticipate(String participate) {
		this.participate = participate;
	}
	
	
	
	
}