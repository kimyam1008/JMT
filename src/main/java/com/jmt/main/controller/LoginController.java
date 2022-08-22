package com.jmt.main.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jmt.main.dto.NotiDTO;
import com.jmt.main.service.NotiService;

@Controller
public class LoginController extends HandlerInterceptorAdapter {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired NotiService service;
	

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mav) throws Exception {
		
		String loginId = (String) request.getSession().getAttribute("loginId");
		String member_status = (String) request.getSession().getAttribute("member_status");
		//boolean pass = null;
		if(loginId != null && member_status.equals("일반회원")) {
			logger.info("컨트롤러 진입 후 ... " );
			//pass = true;
		}else {
			
		}
	}
	
}
