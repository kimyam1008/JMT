package com.jmt.groupreview.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class GroupReviewDTO {
	private int groupReview_no;
	private String member_id;
	private int class_no;
	private String review_title;
	private String review_content;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date review_date;
	private String groupReview_status;
	private int idx;
	private String dojang_title;
	private String lightning_title;
	
	public String getDojang_title() {
		return dojang_title;
	}
	public void setDojang_title(String dojang_title) {
		this.dojang_title = dojang_title;
	}
	public String getLightning_title() {
		return lightning_title;
	}
	public void setLightning_title(String lightning_title) {
		this.lightning_title = lightning_title;
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
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public String getGroupReview_status() {
		return groupReview_status;
	}
	public void setGroupReview_status(String groupReview_status) {
		this.groupReview_status = groupReview_status;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
}
