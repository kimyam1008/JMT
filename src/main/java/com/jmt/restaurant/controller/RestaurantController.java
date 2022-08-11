package com.jmt.restaurant.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jmt.moim.dto.DojangDTO;
import com.jmt.restaurant.dto.RestaurantDTO;
import com.jmt.restaurant.service.RestaurantService;

@Controller
public class RestaurantController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  RestaurantService service;
	
	
	@RequestMapping(value = "/restaurant")
	public ModelAndView restaurant() {
		logger.info("맛집 페이지 이동");
		ModelAndView mav = new ModelAndView("Restaurant/restaurant");
		return mav;
	}
	
	
	@RequestMapping("/foodname.do")
	@ResponseBody
	public HashMap<String, Object> foodname(){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<RestaurantDTO> foodname = service.foodname();
		map.put("foodname", foodname);
		return map;
	}
	
	@RequestMapping(value = "/resList.ajax")
	@ResponseBody
	public HashMap<String, Object> resList(Model model,@RequestParam HashMap<String, String> params) {
		logger.info("맛집 리스트 요청");
		//service.detail(model,params);
		return service.resList(params);
	}
	
	
	@RequestMapping("/resSearch.ajax")
	@ResponseBody
	public HashMap<String, Object> courSearch(
			@RequestParam HashMap<String, String> params){
		//HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("검색결과 리스트 요청"+params);
		return service.resList(params);
	}
	
	
	
	@RequestMapping(value = "/resDetail.do")
	public String resDetail(Model model, HttpSession session,
			@RequestParam String restaurant_no) {
		
		logger.info("맛집 상세보기 : "+ restaurant_no); 
		service.resDetail(model, restaurant_no);
		ArrayList<RestaurantDTO> lightninglist = service.lightninglist(model, restaurant_no);
		model.addAttribute("lightninglist", lightninglist);
		ArrayList<RestaurantDTO> photoList = service.photoList(model, restaurant_no);
		model.addAttribute("photoList", photoList);
		ArrayList<RestaurantDTO> resCommet = service.resCommet(model, restaurant_no);
		model.addAttribute("resCommet", resCommet);
				
		return "Restaurant/restaurantDetail";
				
	}
	
	// 맛집 수정 요청
	@RequestMapping(value = "/restaurantUpdate.go")
	public String restaurantUpdate(Model model, @RequestParam String restaurant_no) {
		model.addAttribute("restaurant_no",restaurant_no);
		service.resDetail(model, restaurant_no);
		return "Restaurant/restaurantUpdate";
	}
	
	
	@RequestMapping(value = "/restaurantWrite")
	public ModelAndView restaurantWrite(
			@RequestParam HashMap<String, String> params, HttpSession session) {		
		logger.info("맛집 정보 수정 요청 : "+params);
		return service.restaurantWrite(params,session);
	}
	
	
	@RequestMapping(value = "/reviewWrite")
	public ModelAndView reviewWrite(Model model, @RequestParam String restaurant_no) {
		logger.info("리뷰 작성 페이지 이동");
		model.addAttribute("restaurant_no",restaurant_no);
		service.resDetail(model, restaurant_no);
		ModelAndView mav = new ModelAndView("Restaurant/reviewWrite");
		return mav;
	}
	
	
	@RequestMapping(value = "/reviewWrite.do")
	   public String reviewWrite(MultipartFile[] photos, @RequestParam HashMap<String, String> params, HttpSession session) {
	      logger.info("글쓰기 요청 : " + params);
	      
	      params.put("loginId", (String) session.getAttribute("loginId"));
	      
	      return service.reviewWrite(photos, params);
	   }
	
	
	
	@RequestMapping(value = "/commentDel.ajax")
	@ResponseBody
	public HashMap<String, String> commentDel(HttpSession session, Model model, 
			@RequestParam HashMap<String, String> params) {
		
		logger.info(":"+params);
		return service.commentDel(params);
	}
	
	@RequestMapping(value = "/reviewUpdate")
	public ModelAndView reviewUpdate(Model model, @RequestParam String comment_no) {
		logger.info(comment_no);
		logger.info("리뷰 수정 페이지 이동");
		ArrayList<RestaurantDTO> reviewPhoto = service.reviewPhoto(model, comment_no);
		model.addAttribute("reviewPhoto", reviewPhoto);
		model.addAttribute("comment_no",comment_no);
		RestaurantDTO dto = service.reviewUpdate(model, comment_no);
		model.addAttribute("comment", dto);
		ModelAndView mav = new ModelAndView("Restaurant/reviewUpdate");
		return mav;
	}
	
	
	@RequestMapping(value = "/commentUpdate.ajax")
	@ResponseBody
	public HashMap<String, String> commentUpdate(HttpSession session, Model model, 
			@RequestParam HashMap<String, String> params) {
		
		logger.info(":"+params);
		ArrayList<RestaurantDTO> photoDel = service.photoDel(params);
		model.addAttribute("photoDel", photoDel);
		return null;
	}
	
	@RequestMapping(value = "/reviewDel.ajax")
	@ResponseBody
	public HashMap<String, String> reviewDel(HttpSession session, Model model, 
			@RequestParam HashMap<String, String> params) {
		
		logger.info(":"+params);
		return service.reviewDel(params);
	}
	
	
	
	
	
	
	
	

}
