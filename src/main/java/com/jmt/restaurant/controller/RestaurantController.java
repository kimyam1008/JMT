package com.jmt.restaurant.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jmt.moim.dto.DojangDTO;
import com.jmt.moim.dto.LightningDTO;
import com.jmt.moim.service.LightningService;
import com.jmt.restaurant.dto.RestaurantDTO;
import com.jmt.restaurant.service.RestaurantService;

@Controller
public class RestaurantController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  RestaurantService service;
	@Autowired LightningService servicelig;
	
	// 맛집 페이지 이동
	@RequestMapping(value = "/restaurant", method = RequestMethod.GET)
	public ModelAndView restaurant(Model model) {
		logger.info("맛집 페이지 이동");
		ModelAndView mav = new ModelAndView("Restaurant/restaurant");
		
		ArrayList<LightningDTO> foodList = servicelig.foodList();
		if(foodList.size()>0) {
			model.addAttribute("foodList", foodList);
		}
		
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
	
	@RequestMapping(value = "/resList.ajax", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> resList(Model model,@RequestParam HashMap<String, String> params) {
		logger.info("맛집 리스트 요청");
		//service.detail(model,params);
		return service.resList(params);
	}
	
	
	@RequestMapping(value = "/resSearch.ajax" , method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> courSearch(
			@RequestParam HashMap<String, String> params){
		//HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("검색결과 리스트 요청"+params);
		return service.resList(params);
	}
	
	
	
	@RequestMapping(value = "/resDetail.do", method = RequestMethod.GET)
	public String resDetail(Model model, HttpSession session,
			@RequestParam int restaurant_no, @RequestParam HashMap<String, String> params) {
		
		params.put("loginId", (String) session.getAttribute("loginId"));
		
		//좋아요 한사람 로그인 비교
		String loginId = (String) session.getAttribute("loginId");
		
		logger.info("맛집 상세보기 : "+ restaurant_no); 
		service.resDetail(model, restaurant_no);
		ArrayList<RestaurantDTO> lightninglist = service.lightninglist(model, restaurant_no);
		model.addAttribute("lightninglist", lightninglist);
		ArrayList<RestaurantDTO> photoList = service.photoList(model, restaurant_no);
		model.addAttribute("photoList", photoList);
		ArrayList<RestaurantDTO> resCommet = service.resCommet(loginId, restaurant_no);
		ArrayList<HashMap<String, String>> CommentPhoto = null;
		ArrayList<HashMap<String, String>> CommentPhoto2 = new ArrayList<HashMap<String,String>>() ;
		for (RestaurantDTO restaurantDTO : resCommet) {
			CommentPhoto = service.CommentPhoto(restaurantDTO.getComment_no());
			
			CommentPhoto2.addAll(CommentPhoto);
			
			for (HashMap<String, String> hashMap : CommentPhoto2) {
				
			}
		} 
		
		
//		ArrayList<HashMap<String, String>> CommentLike = null;
//		ArrayList<HashMap<String, String>> CommentLike2 = new ArrayList<HashMap<String,String>>() ;
//		for (RestaurantDTO restaurantDTO : resCommet) {
//			CommentLike = service.CommentLike(restaurantDTO.getComment_no());
//			
//			CommentLike2.addAll(CommentLike);
//		for (HashMap<String, String> hashMap : CommentLike2) {
//				
//			}
//		}
		
//		ArrayList<HashMap<String, String>> memberPhoto = null;
//		ArrayList<HashMap<String, String>> memberPhoto2 = new ArrayList<HashMap<String,String>>() ;
//		for (RestaurantDTO restaurantDTO : resCommet) {
//			CommentLike = service.memberPhoto(restaurantDTO.getMember_id());
//			
//			CommentLike2.addAll(memberPhoto);
//		for (HashMap<String, String> hashMap : memberPhoto2) {
//				
//			}
//		}
		
	
		//model.addAttribute("CommentLike", CommentLike2);
		model.addAttribute("CommentPhoto", CommentPhoto2);
		model.addAttribute("resCommet", resCommet);
		
		
		return "Restaurant/restaurantDetail";
				
	}
	
	// 맛집 수정 요청
	@RequestMapping(value = "/restaurantUpdate.go")
	public String restaurantUpdate(HttpSession session ,Model model, @RequestParam int restaurant_no,
			@RequestParam HashMap<String, String> params) {
		params.put("loginId", (String) session.getAttribute("loginId"));
		model.addAttribute("restaurant_no",restaurant_no);
		service.resDetail(model, restaurant_no);
		return "Restaurant/restaurantUpdate";
	}
	
	// 신고^^
	@RequestMapping(value = "/resReport.go")
	public String resReport(HttpSession session ,Model model, @RequestParam int comment_no,
			@RequestParam HashMap<String, String> params) {
		params.put("loginId", (String) session.getAttribute("loginId"));
		params.put("comment", Integer.toString(comment_no));
		model.addAttribute("comment_no",comment_no);
		System.out.println(" : "+comment_no);
		service.commentList(model, comment_no);
		return "Restaurant/resReport";
	}
	
	
	//번개모임 댓글 신고 팝업
		@RequestMapping("/resCmtReport.ajax")
		@ResponseBody
		public HashMap<String, Object> resCmtReport(@RequestParam HashMap<String, String> params, HttpSession session) {
			String loginId = (String) session.getAttribute("loginId");
			params.put("loginId", loginId);
				
			logger.info("번개 모임 댓글 신고  : "+ params);
			HashMap<String, Object> map = new HashMap<String, Object>();
			boolean report = service.resCmtReport(params);
			map.put("resCmtReport", report);
			return map;	
		}
	
	@RequestMapping(value = "/restaurantWrite")
	public ModelAndView restaurantWrite(
			@RequestParam HashMap<String, String> params, HttpSession session) {		
		logger.info("맛집 정보 수정 요청 : "+params);
		return service.restaurantWrite(params,session);
	}
	
	
	@RequestMapping(value = "/reviewWrite")
	public ModelAndView reviewWrite(Model model, @RequestParam int restaurant_no) {
		logger.info("리뷰 작성 페이지 이동");
		model.addAttribute("restaurant_no",restaurant_no);
		service.resDetail(model, restaurant_no);
		ModelAndView mav = new ModelAndView("Restaurant/reviewWrite");
		return mav;
	}
	
	// 리뷰 작성
	@RequestMapping(value = "/reviewWrite.do")
	   public String reviewWrite(MultipartFile[] photos, @RequestParam HashMap<String, String> params, HttpSession session) {
	      logger.info("리뷰 작성 : " + params);
	      
	      params.put("loginId", (String) session.getAttribute("loginId"));
	      return service.reviewWrite(photos, params);
	   }
	
	
	// 리뷰 수정
	@RequestMapping(value = "/reviewUpdate.do")
	   public String reviewUpdate(MultipartFile[] photos, @RequestParam HashMap<String, String> params, HttpSession session) {
	      logger.info("리뷰 수정 : " + params);
	      
	      params.put("loginId", (String) session.getAttribute("loginId"));
	      return service.reviewReLoad(photos, params);
	   }
	
	
	// 댓글 삭제(얘가 진짜)
	@RequestMapping(value = "/commentDel.ajax")
	@ResponseBody
	public HashMap<String, Object> commentDel(HttpSession session, Model model, 
			@RequestParam HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info(":"+params);
		boolean success =  service.commentDel(params);
		map.put("success", success);
			//service.commentPhotoDel(params);
		
		return map;
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
	
	//안쓰는거
	@RequestMapping(value = "/commentUpdate.ajax")
	@ResponseBody
	public HashMap<String, String> commentUpdate(HttpSession session, Model model, 
			@RequestParam HashMap<String, String> params) {
		
		logger.info(":"+params);
		ArrayList<RestaurantDTO> photoDel = service.photoDel(params);
		model.addAttribute("photoDel", photoDel);
		return null;
	}
	
	//리뷰수정할때 삭제
	@RequestMapping(value = "/reviewDel.ajax")
	@ResponseBody
	public HashMap<String, String> reviewDel(HttpSession session, Model model, 
			@RequestParam HashMap<String, String> params) {
		
		logger.info(":"+params);
		return service.reviewDel(params);
	}
	
	// 좋다 아니 안 좋다 아니 하기 싫다
	@RequestMapping(value = "/like.ajax")
	@ResponseBody
	public HashMap<String, Object> like(HttpSession session, Model model, 
			@RequestParam HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		params.put("loginId", (String) session.getAttribute("loginId"));
		logger.info(":"+params);
		boolean like = service.like(params);
		
		map.put("likes", like);
		
		return map;
	}
	
	
	// 좋아요 삭제
	@RequestMapping(value = "/likeDel.ajax")
	@ResponseBody
	public HashMap<String, Object> likeDel(HttpSession session, Model model, 
			@RequestParam HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		params.put("loginId", (String) session.getAttribute("loginId"));
		logger.info(":"+params);
		service.likeDel(params);
		map.put("likeDel", "좋아요 취소");
		
		return map;
	}
	
	
	// 맛집 수정 요청 리스트(관리자) 페이지 이동
	@RequestMapping(value = "/resUpdateList.go")
	public ModelAndView resUpdateList() {
		logger.info("맛집 수정 요청 리스트(관리자)");
		ModelAndView mav = new ModelAndView("Restaurant/restaurantUpdateList");
		return mav;
	}
	
	// 맛집 수정 요청 리스트(관리자) 리스트
	@RequestMapping(value = "/resUpdateList.ajax")
	@ResponseBody
	public HashMap<String, Object> resUpdateList(Model model,@RequestParam HashMap<String, String> params) {
		logger.info("맛집 리스트 요청");
		//service.detail(model,params);
		return service.resUpdateList(params);
	}

	
	// 맛집 수정 (관리자) 페이지 이동
	@RequestMapping(value = "/resAdminUpdate.go")
	public String resAdminUpdate(Model model,@RequestParam int restaurant_no, int restuarantUpdate_no) {
		logger.info("맛집 수정 요청 페이지(관리자)");
		
		RestaurantDTO requestNO = service.requestNO(restaurant_no);
		model.addAttribute("requestNO", requestNO);
		
		RestaurantDTO restuarantUpdateNo = service.restuarantUpdateNo(restuarantUpdate_no);
		model.addAttribute("resUpdateNo", restuarantUpdateNo);
	
		return "Restaurant/resAdminUpdate";
	}
	
	
	// 맛집 수정 (관리자) 정보 수정
	@RequestMapping(value = "/resAdminUpdate.do")
	   public String resAdminUpdate(RedirectAttributes ra, @RequestParam HashMap<String, String> params, HttpSession session) {
		
	      logger.info("맛집 정보 수정 : " + params);
	      
	      return service.resAdminUpdate(params, ra);
	   }
	
	// 맛집 수정 요청 (관리자) 요청 처리
	@RequestMapping(value = "/Reporthandling.do")
	   public String Reporthandling(@RequestParam HashMap<String, String> params, HttpSession session, RedirectAttributes ra) {
		
	      logger.info("맛집 요청 처리 : " + params);
	      
	      return service.Reporthandling(params, ra);
	   }
	

}
