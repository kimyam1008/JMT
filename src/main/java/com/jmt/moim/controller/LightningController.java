package com.jmt.moim.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jmt.moim.dto.LightningDTO;
import com.jmt.moim.service.LightningService;

@Controller
public class LightningController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  LightningService service;

	
	@RequestMapping(value = "/lightList.do")
	public String joinForm(Model model) {
		
		//음식카테고리 가져오기 
		ArrayList<LightningDTO> foodList = service.foodList();
		if(foodList.size()>0) {
			model.addAttribute("foodList", foodList);
		}
		return "./Lightning/lightning";
	}
}
