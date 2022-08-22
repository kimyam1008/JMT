package com.jmt.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public class LoginCheck extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("로그인 인터셉터");
		
		HttpSession session = request.getSession();
		
		String loginId= (String) session.getAttribute("loginId");
		boolean pass = true ; 
		if(loginId ==  null) {
			System.out.println("로그인 안함. ");
			response.sendRedirect("/");
			
			 pass = false; 
		}
		
		
		return pass;
	}
}
