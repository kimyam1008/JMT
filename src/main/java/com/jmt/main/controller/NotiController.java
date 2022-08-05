package com.jmt.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.jmt.main.service.NotiService;

@Controller
public class NotiController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired NotiService service;

}
