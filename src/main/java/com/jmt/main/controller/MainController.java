package com.jmt.main.controller;


import java.util.ArrayList;
import java.util.HashMap;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.condition.ParamsRequestCondition;

import com.fasterxml.jackson.databind.deser.impl.CreatorCandidate.Param;
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
	    
	    String member_status = (String) session.getAttribute("member_status");
	    model.addAttribute("member_status",member_status);
	    
		if (loginId != null) {
			//번개 모임 추천
	    	ArrayList<MainDTO> lightReco = service.lightReco(loginId);
		    model.addAttribute("lightReco", lightReco);
		    logger.info("메인페이지 번개 추천 리스트 : "+lightReco.size());
		    
		    //도장 모임 추천
		    ArrayList<MainDTO> dojangReco = service.dojangReco(loginId);
		    model.addAttribute("dojangReco", dojangReco);
		    logger.info("메인페이지 도장깨기 추천 리스트 : "+dojangReco.size());
			}
	    
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
	
	//맛집 검색
	@RequestMapping(value = "/searchRes.ajax")
	@ResponseBody
	public String searchRes(Model model,@RequestParam String keyword) throws InterruptedException {
		logger.info("keyword : "+keyword);
		String url = "http://localhost:8080/restaurant";
		service.goRest(url,keyword);
		return "./Main/main";
	}
	
	//번개 검색
	@RequestMapping(value = "/searchLight.ajax")
	@ResponseBody
	public String searchLight(Model model,@RequestParam String keyword) throws InterruptedException {
		logger.info("keyword : "+keyword);
		String url = "http://localhost:8080/lightList.go";
		service.goLight(url,keyword);
		return "./Main/main";
	}
	
	//도장깨기 검색
	@RequestMapping(value = "/searchDojang.ajax")
	@ResponseBody
	public String searchDojang(Model model,@RequestParam String keyword) throws InterruptedException {
		logger.info("keyword : "+keyword);
		String url = "http://localhost:8080/dojang.go";
		service.goDojang(url,keyword);
		return "./Main/main";
	}

}
