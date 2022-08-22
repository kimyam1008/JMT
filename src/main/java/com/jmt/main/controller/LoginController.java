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
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.jmt.main.dto.NotiDTO;
import com.jmt.main.service.NotiService;

@Controller
public class LoginController extends HandlerInterceptorAdapter {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired NotiService service;
	
			//로그인 인터셉터
			@Override
			public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
					throws Exception {
				System.out.println("Controller 진입 전");
				HttpSession session = request.getSession();
				String loginId = (String) session.getAttribute("loginId");
				boolean pass = true;
				
				if(loginId == null) {
					logger.info("로그인 안함");
					//리다이렉트 할 때에는 컨택스트 경로 주의 만약 밑에 경로처럼 하고싶다면 // 슬래쉬 두개 붙여줘야 함.
					//하지만 일반적으로 대부분 컨택스트 경로는 제외하는 경우가 더 많다.
					//http://localhost:8080/member/
					//response.sendRedirect("//");
					FlashMap flashMap = new FlashMap();
					flashMap.put("msg", "로그인이 필요한 서비스 입니다.");
					FlashMapManager flashMapManager = RequestContextUtils.getFlashMapManager(request);
					flashMapManager.saveOutputFlashMap(flashMap, request, response);

					response.sendRedirect("/"); // http://localhost:8080/
					
					//대신 이건 메세지를 보낼 수 없음. 메세지를 주는 페이지를 우회해서 가게 하거나 해야함. 알아서 생각해보기
					pass = false;
				}
				
				return pass;
			}
			
}
