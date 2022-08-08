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
import org.springframework.web.bind.annotation.ResponseBody;

import com.jmt.moim.dto.DojangDTO;
import com.jmt.moim.service.DojangService;

@Controller
public class DojangController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  DojangService service;
	
	@RequestMapping(value = "/dojang.go")
	public String main(Model model) {
		
		return "./Dojang/dojang";
	}
	
	
	@RequestMapping(value = "/dojang.ajax")
	@ResponseBody
	public HashMap<String, Object> dojangList(@RequestParam HashMap<String, String> params) {
		logger.info("도장 리스트 요청");
		return service.dojangList(params);
	}
	
	@RequestMapping("/foodname.ajax")
	@ResponseBody
	public HashMap<String, Object> foodname(){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<DojangDTO> foodname = service.foodname();
		map.put("foodname", foodname);
		return map;
	}
	
	
	//도장모임 검색
	@RequestMapping("/dojangSearch.ajax")
	@ResponseBody
	public HashMap<String, Object> courSearch(
			@RequestParam HashMap<String, String> params){
		//HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("검색결과 리스트 요청"+params);
		return service.dojangList(params);
	}
	
	
	
	
	
	
	
	

}
