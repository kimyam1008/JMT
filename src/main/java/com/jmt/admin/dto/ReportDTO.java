package com.jmt.admin.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;


public class ReportDTO {
	//신고 DTO 
	private Integer report_no;
	
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH시mm분", timezone = "Asia/Seoul")
	private Date report_date; 
	private String report_reason; 
	private String report_proc_status; 
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH시mm분")
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH시mm분", timezone = "Asia/Seoul")
	private Date report_proc_date; 
	private Integer class_no; 
	private Integer idx; 
	private String reported; 
	private String reporter;
	private String result_reason;
	
	// 마이바티스 서브쿼리 test
	private String mb_ligntning_title;
	private String 	mb_comment;
	private String mb_dojang_title;
	private String mb_dojang_post;
	private String mb_group_review;
	
	private int blind_no;
	
	private String admin_id;
	private String blind_reason;
	private String blind_status;
	@DateTimeFormat(pattern="yyyy-MM-dd HH시mm분")
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH시mm분", timezone = "Asia/Seoul")
	private Date blind_proc_date;
	
	
	private String member_id;
	private String  member_name;
	private String member_birth;
	private String  member_status;
	private String  profile_job;
	private String  grade_name;
	private String profile_gender; 
	private String member_email;
	
	private String blacklist_status;
	private String blacklist_proc_reason;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH시mm분", timezone = "Asia/Seoul")
	private Date blacklist_proc_date;
	
	
	
	
	
	public String getBlacklist_status() {
		return blacklist_status;
	}


	public void setBlacklist_status(String blacklist_status) {
		this.blacklist_status = blacklist_status;
	}


	public String getBlacklist_proc_reason() {
		return blacklist_proc_reason;
	}


	public void setBlacklist_proc_reason(String blacklist_proc_reason) {
		this.blacklist_proc_reason = blacklist_proc_reason;
	}


	public Date getBlacklist_proc_date() {
		return blacklist_proc_date;
	}


	public void setBlacklist_proc_date(Date blacklist_proc_date) {
		this.blacklist_proc_date = blacklist_proc_date;
	}


	public String getMember_email() {
		return member_email;
	}


	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}


	public String getProfile_gender() {
		return profile_gender;
	}


	public void setProfile_gender(String profile_gender) {
		this.profile_gender = profile_gender;
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


	public String getAdmin_id() {
		return admin_id;
	}


	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}


	public String getBlind_reason() {
		return blind_reason;
	}


	public void setBlind_reason(String blind_reason) {
		this.blind_reason = blind_reason;
	}


	public String getBlind_status() {
		return blind_status;
	}


	public void setBlind_status(String blind_status) {
		this.blind_status = blind_status;
	}


	public Date getBlind_proc_date() {
		return blind_proc_date;
	}


	public void setBlind_proc_date(Date blind_proc_date) {
		this.blind_proc_date = blind_proc_date;
	}


	public String getMb_group_review() {
		return mb_group_review;
	}


	public void setMb_group_review(String mb_group_review) {
		this.mb_group_review = mb_group_review;
	}


	public int getBlind_no() {
		return blind_no;
	}


	public void setBlind_no(int blind_no) {
		this.blind_no = blind_no;
	}


	public String getMb_ligntning_title() {
		return mb_ligntning_title;
	}


	public void setMb_ligntning_title(String mb_ligntning_title) {
		this.mb_ligntning_title = mb_ligntning_title;
	}


	public String getMb_comment() {
		return mb_comment;
	}


	public void setMb_comment(String mb_comment) {
		this.mb_comment = mb_comment;
	}


	public String getMb_dojang_title() {
		return mb_dojang_title;
	}


	public void setMb_dojang_title(String mb_dojang_title) {
		this.mb_dojang_title = mb_dojang_title;
	}


	public String getMb_dojang_post() {
		return mb_dojang_post;
	}


	public void setMb_dojang_post(String mb_dojang_post) {
		this.mb_dojang_post = mb_dojang_post;
	}


	public String getResult_reason() {
		return result_reason;
	}


	public void setResult_reason(String result_reason) {
		this.result_reason = result_reason;
	}


	// class code 
	private String class_name;


	public Integer getReport_no() {
		return report_no;
	}


	public void setReport_no(Integer report_no) {
		this.report_no = report_no;
	}


	public Date getReport_date() {
		return report_date;
	}


	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}


	public String getReport_reason() {
		return report_reason;
	}


	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}


	public String getReport_proc_status() {
		return report_proc_status;
	}


	public void setReport_proc_status(String report_proc_status) {
		this.report_proc_status = report_proc_status;
	}


	public Date getReport_proc_date() {
		return report_proc_date;
	}


	public void setReport_proc_date(Date report_proc_date) {
		this.report_proc_date = report_proc_date;
	}


	public Integer getClass_no() {
		return class_no;
	}


	public void setClass_no(Integer class_no) {
		this.class_no = class_no;
	}


	public Integer getIdx() {
		return idx;
	}


	public void setIdx(Integer idx) {
		this.idx = idx;
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



	public String getClass_name() {
		return class_name;
	}


	public void setClass_name(String class_name) {
		this.class_name = class_name;
	} 
	
	
	
	
	
	
	
	

	
}
