package com.jmt.moim.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jmt.moim.dto.LightningDTO;
import com.jmt.moim.service.LightningService;

@Controller
public class LightningController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  LightningService service;

	//번개모임리스트 lightning.jsp 페이지 이동 
	@RequestMapping("/lightList.go") 
	public String listPage(Model model) {
		logger.info("리스트 페이지 이동");
		
		//음식카테고리 가져오기 
		ArrayList<LightningDTO> foodList = service.foodList();
			if(foodList.size()>0) {
				model.addAttribute("foodList", foodList);
			}
		/*
			ArrayList<LightningDTO> list = service.list();
			if(list.size()>0) {
				model.addAttribute("list", list);
			}
			*/
			
		return "./Lightning/lightning";
	}
	
	
	
	@RequestMapping(value = "/lightList.ajax")
	@ResponseBody
	public HashMap<String, Object> list(Model model,
			@RequestParam HashMap<String, String>params) {
		
		logger.info("리스트 불러오기");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//params 확인
		logger.info("모임 : "+params.get("lightning_title"));
		logger.info("음식 카테고리 : "+params.get("food_no"));
		logger.info("속도 : "+params.get("eat_speed"));
		logger.info("직업 : "+params.get("job"));
		logger.info("성별 : "+params.get("gender"));
		
		HashMap<String, Object> selectedparams = new HashMap<String, Object>();
		selectedparams.put("lightning_title", params.get("lightning_title"));
		selectedparams.put("food_no", params.get("food_no"));
		selectedparams.put("eat_speed", params.get("eat_speed"));
		selectedparams.put("job", params.get("job"));
		selectedparams.put("gender", params.get("gender"));
		
		
		/*
		//받아오는 파라미터가 없을 경우 // is empty도 안돼 size도 안돼 
		if(params.size()>0) {			
			//전체 리스트 가져오기
			ArrayList<LightningDTO> list = service.list();
			if(list.size()>0) {
				map.put("list", list);
			}
		}
		*/
		 
	
		//페이징- 현재페이지
		int page = Integer.parseInt(params.get("page"));
		//int page = params.get("page");
		logger.info("보여줄 페이지 :" + page);
		
		//offset 구하기 
		//params가 String,String이니까 숫자를 문자열로 변환
		//String offset = Integer.toString( 10 * (page-1));
		int offset = 10 * (page-1);
		//int offset = Integer.parseInt(String.valueOf(10 * (page-1)));
		//String offset = String.valueOf(10 * (page-1));
		logger.info("offset : " + offset);
		//params.put("offset",offset);
		selectedparams.put("offset", offset);
		
		//총개수 
		int allCnt = service.allCount(selectedparams);
		logger.info("allCnt : " + allCnt);
		
		//생성가능한 페이지(pages)
		int pages = allCnt%10>0? (allCnt/10+1) : (allCnt/10);
		logger.info("pages : " + pages);
		if(pages<page) {
			page = pages;
		}
		map.put("currPage", page);
		map.put("pages", pages);
		
		
		//리스트 불러오기
		ArrayList<LightningDTO> selectedList = service.selectedList(selectedparams);
		map.put("list", selectedList);
		
		
	

		
		
		
		
		return map;
	}
}
