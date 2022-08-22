package com.jmt.admin.controller;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

public class LoginCheck extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("어드민 로그인 인터셉터");
		HttpSession session = request.getSession();
		String msg= URLEncoder.encode("?msg=관리자만 입장이 가능합니다.","UTF-8");
		String loginId= (String) session.getAttribute("loginId");
		String member_status = (String) session.getAttribute("member_status");
		System.out.println("멤버 상태"+member_status);
		boolean pass = true ; 
		if(loginId ==  null || !member_status.equals("관리자")) {
			System.out.println("로그인 안함. ");
			response.setContentType("text/html; charset=UTF-8");
			
			FlashMap flashMap = new FlashMap();
			flashMap.put("msg","관리자만 접근 가능합니다.");
			FlashMapManager flashMapManager = RequestContextUtils.getFlashMapManager(request);
			flashMapManager.saveOutputFlashMap(flashMap, request, response);
			 response.sendRedirect("/");
		
				 pass = false; 
		}
		
		
		return pass;
	}
	

}
