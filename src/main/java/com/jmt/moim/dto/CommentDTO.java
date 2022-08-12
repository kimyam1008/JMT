package com.jmt.moim.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("comment")
public class CommentDTO {

	private int comment_no;
	private int class_no;
	private String member_id;
	private String comment_content;
	private Date comment_date;
	private String comment_status;
	private int idx;

	
	
	
	
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public int getClass_no() {
		return class_no;
	}
	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
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
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	
	
}
