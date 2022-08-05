package com.jmt.groupreview.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmt.groupreview.dao.GroupReviewDAO;

@Service
public class GroupReviewService {
	
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired GroupReviewDAO dao;

}
