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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jmt.main.dto.NotiDTO;
import com.jmt.main.service.NotiService;

@Controller
public class NotiController extends HandlerInterceptorAdapter {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired NotiService service;
	


	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mav) throws Exception {
		
		String loginId = (String) request.getSession().getAttribute("loginId");
		if(loginId != null) {
			logger.info("컨트롤러 진입 후 ... " );
			boolean notiChk = service.notiChk(loginId);
			logger.info("안읽은 알림이 있는가 ? : " +notiChk );
			if(notiChk) {
				mav.addObject("notiChk","true");
			}else {
				mav.addObject("notiChk","false"); //true or false
			}
		}
	}

	
	//알림 리스트 불러오기
	@RequestMapping("/notiList.ajax") 
	@ResponseBody
	public HashMap<String, Object> notiList(HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String loginId = (String) session.getAttribute("loginId");
		
		//알림 여부 확인
		ArrayList<NotiDTO> notiList = service.notiList(loginId);
		//model.addAttribute("notiList", notiList);
		map.put("notiList", notiList);
		return map;
	}
	
	//알림 리스트 삭제 
	@RequestMapping("/notiDel.ajax") 
	@ResponseBody
	public HashMap<String, Object> notiDel(@RequestParam String noti_no ) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		boolean notiDelSuccess = service.notiDel(noti_no);
		map.put("notiDelSuccess", notiDelSuccess);
		return map;
	}
	
}
