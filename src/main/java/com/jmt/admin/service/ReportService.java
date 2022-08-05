package com.jmt.admin.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmt.admin.dao.ReportDAO;

@Service
public class ReportService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired ReportDAO dao;

}
