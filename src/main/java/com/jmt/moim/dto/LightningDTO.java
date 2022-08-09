package com.jmt.moim.dto;

import java.sql.Date;

public class LightningDTO {

	private int food_no;
	private String food_name;
	
	
	private String restaurant_name;
	
	
	private int lightning_no;
	private String leader_id;
	private String lightning_title;
	private Date lightning_date;
	private int member_num;
	private int member_count;
	private String lightning_status;
	
	
	
	
	public int getLightning_no() {
		return lightning_no;
	}
	public void setLightning_no(int lightning_no) {
		this.lightning_no = lightning_no;
	}
	public String getRestaurant_name() {
		return restaurant_name;
	}
	public void setRestaurant_name(String restaurant_name) {
		this.restaurant_name = restaurant_name;
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
	
	
}
