package com.jmt.admin.dto;

import org.springframework.format.annotation.DateTimeFormat;

public class ReportDetailDto {
	private Integer report_no;
	@DateTimeFormat
	private String report_date; 
	private String report_reason; 
	private String report_proc_status; 
	@DateTimeFormat
	private String report_proc_date; 
	private Integer class_no; 
	private Integer idx; 
	private String reported; 
	private String reporter;
	private String report_title; 
	

}
