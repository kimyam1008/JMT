package com.jmt.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jmt.mypage.service.MypageService;

@Controller
public class MypageController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  MypageService service;

}
