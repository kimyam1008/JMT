package com.jmt.member.dto;

import org.apache.ibatis.type.Alias;

@Alias("photo")
public class photoDTO {
	
	private int photo_no;
	private int class_no;
	private int idx;
	private String photo_oriFileName;
	private String photo_newFileName;
	
	public int getPhoto_no() {
		return photo_no;
	}
	public void setPhoto_no(int photo_no) {
		this.photo_no = photo_no;
	}
	public int getClass_no() {
		return class_no;
	}
	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPhoto_oriFileName() {
		return photo_oriFileName;
	}
	public void setPhoto_oriFileName(String photo_oriFileName) {
		this.photo_oriFileName = photo_oriFileName;
	}
	public String getPhoto_newFileName() {
		return photo_newFileName;
	}
	public void setPhoto_newFileName(String photo_newFileName) {
		this.photo_newFileName = photo_newFileName;
	}
	
	
}
