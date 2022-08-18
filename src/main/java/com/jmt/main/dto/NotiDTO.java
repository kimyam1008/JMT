package com.jmt.main.dto;

import org.apache.ibatis.type.Alias;

@Alias("noti")
public class NotiDTO {

	
	private String member_id;
	private String title;
	private int apply_no;
	
	
	
	
	
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
}
