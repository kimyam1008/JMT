package com.jmt.admin.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;


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
	private String report_title; 
	private String result_reason;
	
	
	
	
	
	
	
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


	public String getReport_title() {
		return report_title;
	}


	public void setReport_title(String report_title) {
		this.report_title = report_title;
	}


	public String getClass_name() {
		return class_name;
	}


	public void setClass_name(String class_name) {
		this.class_name = class_name;
	} 
	
	
	
	
	
	
	
	

	
}
