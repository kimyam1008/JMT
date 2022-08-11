package com.jmt.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jmt.mypage.service.MypageService;

@Controller
public class MypageController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  MypageService service;
	
		// 로그인 페이지
		@RequestMapping(value = "/mypage.go")
		public String login( Model model) {
			logger.info("로그인 페이지 이동");
			
			return "/Mypage/mypage";
		}

}
