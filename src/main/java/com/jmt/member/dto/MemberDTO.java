package com.jmt.member.dto;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class MemberDTO {
	
	private String member_id;
	private String member_pw;
	private String member_email;
	private String member_name;
	private String member_birth;
	private String member_status;
	
	private int profile_no;
	private int food_no;
	private String food_name;
	private int grade_no;
	private String grade_name;
	private String eat_speed;
	private String profile_gender;
	private String profile_job;
	
	private int follow_no;
	private String follower_id;
	private String following_id;
	
	private String review_title;
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_status() {
		return member_status;
	}
	public void setMember_status(String member_status) {
		this.member_status = member_status;
	}
	public int getProfile_no() {
		return profile_no;
	}
	public void setProfile_no(int profile_no) {
		this.profile_no = profile_no;
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
	public int getGrade_no() {
		return grade_no;
	}
	public void setGrade_no(int grade_no) {
		this.grade_no = grade_no;
	}
	public String getEat_speed() {
		return eat_speed;
	}
	public void setEat_speed(String eat_speed) {
		this.eat_speed = eat_speed;
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
	public String getGrade_name() {
		return grade_name;
	}
	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}
	public int getFollow_no() {
		return follow_no;
	}
	public void setFollow_no(int follow_no) {
		this.follow_no = follow_no;
	}
	public String getFollower_id() {
		return follower_id;
	}
	public void setFollower_id(String follower_id) {
		this.follower_id = follower_id;
	}
	public String getFollowing_id() {
		return following_id;
	}
	public void setFollowing_id(String following_id) {
		this.following_id = following_id;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	
	
	
	
	

}
