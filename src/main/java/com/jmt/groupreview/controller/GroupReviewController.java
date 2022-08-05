package com.jmt.groupreview.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jmt.groupreview.service.GroupReviewService;

@Controller
public class GroupReviewController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired GroupReviewService service;

}
