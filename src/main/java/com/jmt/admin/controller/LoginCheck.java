package com.jmt.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheck extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("어드민 로그인 인터셉터");
		
		HttpSession session = request.getSession();
		
		String loginId= (String) session.getAttribute("loginId");
		String member_status = (String) session.getAttribute("member_status");
		System.out.println("멤버 상태"+member_status);
		boolean pass = true ; 
		if(loginId ==  null || !member_status.equals("관리자")) {
			System.out.println("로그인 안함. ");
			response.sendRedirect("/");
			
			 pass = false; 
		}
		
		
		return pass;
	}
}
