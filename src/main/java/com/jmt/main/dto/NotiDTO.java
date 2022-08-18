package com.jmt.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("noti")
public class NotiDTO {

	
	private String member_id;
	private String title;
	private int apply_no;
	
	private int noti_no;
	private int class_no;
	private String noti_content;
	private Date noti_date;
	private String noti_read;
	private int idx;
	private String info;
	
	
	
	
	
	
	public int getNoti_no() {
		return noti_no;
	}
	public void setNoti_no(int noti_no) {
		this.noti_no = noti_no;
	}
	public int getClass_no() {
		return class_no;
	}
	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}
	public String getNoti_content() {
		return noti_content;
	}
	public void setNoti_content(String noti_content) {
		this.noti_content = noti_content;
	}
	public Date getNoti_date() {
		return noti_date;
	}
	public void setNoti_date(Date noti_date) {
		this.noti_date = noti_date;
	}
	public String getNoti_read() {
		return noti_read;
	}
	public void setNoti_read(String noti_read) {
		this.noti_read = noti_read;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
}
