package com.jmt.main.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jmt.main.dto.MainDTO;
import com.jmt.main.service.MainService;

@Controller
public class MainController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired MainService service;

	@RequestMapping(value = "/")
	public String main(Model model,HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
	    model.addAttribute("loginId", loginId);
	    
	    //번개 가져오기
	    ArrayList<MainDTO> lightDto = service.lightDto();
	    model.addAttribute("lightDto", lightDto);
	    logger.info("메인 페이지 번개 리스트 호출 : "+lightDto.size());
	    
	    //도장 가져오기
	    ArrayList<MainDTO> dojangDto = service.dojangDto();
	    model.addAttribute("dojangDto", dojangDto);
	    logger.info("메인 페이지 도장깨기 리스트 호출 : "+dojangDto.size());
	    
	    //맛집 가져오기
	    ArrayList<MainDTO> resDto = service.resDto();
	    model.addAttribute("resDto", resDto);
	    logger.info("메인 페이지 맛집 리스트 호출 : "+resDto.size());
	    
	    //모임 후기 가져오기
	    ArrayList<MainDTO> grDto = service.grDto();
	    model.addAttribute("grDto", grDto);
	    logger.info("메인 페이지 모임 후기 리스트 호출 : "+grDto.size());
	    
	    
	    
		return "./Main/main";
	}

	//메인페이지에서 검색
	@RequestMapping(value = "/goSearch")
	public String goSearch(Model model, @RequestParam String keyword, @RequestParam String select) {
		logger.info("검색창에서 넘어온 값 : "+select+"/"+keyword);
		
		if (select == "맛집") {
			
		} else if(select == "번개") {
			
		} else {
			
		}
		
		return "./Main/main";
	}
}
