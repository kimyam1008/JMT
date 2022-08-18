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
public class NotiController extends HandlerInterceptorAdapter {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired NotiService service;
	
	
	
	


	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mav) throws Exception {
		
		logger.info("컨트롤러 진입 후 ... " );
		String loginId = (String) request.getSession().getAttribute("loginId");
		boolean notiChk = service.notiChk(loginId);
		logger.info("안읽은 알림이 있는가 ? : " +notiChk );
		mav.addObject("notiChk",notiChk); //true or false
	}

	
	
	//알림 테스트
	@RequestMapping("/noti") 
	public String noti(Model model,HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		//알림 여부 확인
		boolean notiChk = service.notiChk(loginId);
		logger.info("안읽은 알림이 있는가 ? : " +notiChk );
		model.addAttribute("notiChk", notiChk); //true or false
		return  "./commons/header";
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
	
	
	// 생성자로 할지 메서드로 할지 
	//메서드 - 모임 삭제
	//private final NotiService servicey; //여기서만 써야함 빨간줄 생기는 이유 : 아무것도 안들어갔는데 괜찮아?
	 
	 // 스프링 ioc 알아서 넣어줌 
	//public NotiController(NotiService servicey) {//컨트롤러 생성 되는 시점에 서비스를 끌고 와서 시점의 문제가 생기지 않음 컨트롤러에 요청이 들어가면 서비스도 이미 동작할 준비가 되어있음 
		 //this.servicey = servicey;
	//}
	
	//insert 생성자.. 사실뭐가먼지모르게씀 ㅎㅎ 
	//private int class_no;
	//private String idx;
	//public int class_no;
	//public String idx;
	
	
	
	
	//생성자 - insert 
	
	
		//this.service= service;
		//this.service = new NotiService();
		//this.class_no = class_no;
		//this.idx= idx;
		//HashMap<String, String> moimDel =  service.moimDel(class_no,idx);
		//System.out.println(" 변수:  "+ class_no +"/"+ idx);
		//System.out.println("moimDel" + moimDel.size());
	
	/*
	@RequestMapping("/noti.go") 
	public String nnoti(Model model,@RequestParam String idx) {
		logger.info("노티 테스트");
		
			
			//방장아이디와 로그인아이디 비교하기 위해서 
			//String loginId = (String) session.getAttribute("loginId");
			
			ArrayList<String> notitest = service.moimDel(idx);
			logger.info("사이즈 : " + notitest.size());
			model.addAttribute("notitest", notitest);
			
		return "./Lightning/lightning";
	}

*/ 
	
}
