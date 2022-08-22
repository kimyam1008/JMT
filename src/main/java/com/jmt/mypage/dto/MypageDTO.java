package com.jmt.mypage.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("mypage")
public class MypageDTO {
	
	//내가 쓴 게시글을 한번에 가져오기 위해 DTO 따로 만듦
	private int dojangPost_no;
	private int dojang_no;
	private String member_id;
	private int restaurant_no;
	private String dojangPost_subject;
	private String dojangPost_content;
	private Date dojangPost_date;
	private String dojangPost_type;
	private Date dojang_date;
	private String dojangPost_status;
	
	private int groupReview_no;
	private int class_no;
	private String review_title;
	private String review_content;
	private Date review_date;
	private String groupReview_status;
	private int idx;
	
	//댓글 단 글 가져오기 위해 DTO 따로 만듦
	private int comment_no;
	private String comment_content;
	private Date comment_date;
	private String comment_status;
	private String lightning_title;
	
	private String dojang_title;
	
	private String grade_name;
	
	private int boardCount;
	private int commentCount;
	
	private String photo_newFileName;
	
	private String category;
	private String myCommentArry;
	private String lightning_no;
	
	
	public String getMyCommentArry() {
		return myCommentArry;
	}
	public void setMyCommentArry(String myCommentArry) {
		this.myCommentArry = myCommentArry;
	}
	public int getDojangPost_no() {
		return dojangPost_no;
	}
	public void setDojangPost_no(int dojangPost_no) {
		this.dojangPost_no = dojangPost_no;
	}
	public int getDojang_no() {
		return dojang_no;
	}
	public void setDojang_no(int dojang_no) {
		this.dojang_no = dojang_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getRestaurant_no() {
		return restaurant_no;
	}
	public void setRestaurant_no(int restaurant_no) {
		this.restaurant_no = restaurant_no;
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
	public Date getDojangPost_date() {
		return dojangPost_date;
	}
	public void setDojangPost_date(Date dojangPost_date) {
		this.dojangPost_date = dojangPost_date;
	}
	public String getDojangPost_type() {
		return dojangPost_type;
	}
	public void setDojangPost_type(String dojangPost_type) {
		this.dojangPost_type = dojangPost_type;
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
	public int getGroupReview_no() {
		return groupReview_no;
	}
	public void setGroupReview_no(int groupReview_no) {
		this.groupReview_no = groupReview_no;
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
	public String getComment_status() {
		return comment_status;
	}
	public void setComment_status(String comment_status) {
		this.comment_status = comment_status;
	}
	public String getLightning_title() {
		return lightning_title;
	}
	public void setLightning_title(String lightning_title) {
		this.lightning_title = lightning_title;
	}
	public String getDojang_title() {
		return dojang_title;
	}
	public void setDojang_title(String dojang_title) {
		this.dojang_title = dojang_title;
	}
	public String getGrade_name() {
		return grade_name;
	}
	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}
	public int getBoardCount() {
		return boardCount;
	}
	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public String getPhoto_newFileName() {
		return photo_newFileName;
	}
	public void setPhoto_newFileName(String photo_newFileName) {
		this.photo_newFileName = photo_newFileName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getLightning_no() {
		return lightning_no;
	}
	public void setLightning_no(String lightning_no) {
		this.lightning_no = lightning_no;
	}
	
	
	
	

}
