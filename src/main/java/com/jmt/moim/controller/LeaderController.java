package com.jmt.moim.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.jmt.moim.dto.LeaderDTO;
import com.jmt.moim.service.LeaderService;

@Controller
public class LeaderController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  LeaderService service;

	//번개모임 방장페이지 메인
	@RequestMapping(value = "/lightningLeaderPage.go")
	public String lightningLeaderPage(Model model,HttpSession session,
		   @RequestParam String lightning_no){
		logger.info("번개모임 방장 페이지 진입");
		String loginId = (String) session.getAttribute("loginId");
		model.addAttribute("loginId", loginId);
	  
		 //번개모임 고유 데이터 가져오기
		 LeaderDTO lightDto = service.lightDetail(lightning_no,loginId);
		 if (lightDto != null) {
			 model.addAttribute("lightDto", lightDto);
		 }
		 
		 //번개 최근 게시글
		 ArrayList<LeaderDTO> lightRecentPost = service.lightRecentPost(lightning_no);
		 model.addAttribute("lightRecentPost", lightRecentPost);
		  
		 //가입 대기 회원
		 ArrayList<LeaderDTO> lightJoinWait = service.lightJoinWait(lightning_no);
		 model.addAttribute("lightJoinWait", lightJoinWait);
		  
	     return "./Leader/lightningLeaderPage";
   }
	
	//도장깨기 방장 페이지
	@RequestMapping(value = "/dojangLeaderPage.go")
	public String dojangLeaderPage(Model model,HttpSession session,
		   @RequestParam String dojang_no){
		logger.info("도장깨기 "+dojang_no+"번 방장 페이지 진입");
		String loginId = (String) session.getAttribute("loginId");
		model.addAttribute("loginId", loginId);
		session.setAttribute("dojang_no", dojang_no);

		//도장깨기 고유 데이터 가져오기
		LeaderDTO dojangDto = service.dojangDetail(dojang_no,loginId);
		if (dojangDto != null) {
			 model.addAttribute("dojangDto", dojangDto);
		 }
		
		 //최근 게시글
		 ArrayList<LeaderDTO> dojangRecentPost = service.dojangRecentPost(dojang_no);
		 model.addAttribute("dojangRecentPost", dojangRecentPost);
		  
		 //가입 대기 회원
		 ArrayList<LeaderDTO> dojangJoinWait = service.dojangJoinWait(dojang_no);
		 model.addAttribute("dojangJoinWait", dojangJoinWait);
		  
	     return "./Leader/dojangLeaderPage";
   }
   
	//도장깨기 수정 팝업
    @RequestMapping(value = "/leaderDojangEdit.go")
	public String leaderDojangEdit(HttpSession session, Model model,
			@RequestParam String dojang_no){
    	String page = "./Leader/leaderDojangEdit";
    	String loginId = (String) session.getAttribute("loginId");
    	session.setAttribute("dojang_no", dojang_no);
    	//session.getAttribute(dojang_no);
    	model.addAttribute("loginId", loginId);
    	logger.info("도장깨기 수정 팝업 진입 : "+dojang_no);
    	
		//도장깨기 고유 데이터 가져오기
		LeaderDTO dojangDto = service.dojangDetail(dojang_no,loginId);
		if (dojangDto != null) {
			  model.addAttribute("dojangDto", dojangDto);
			  page="./Leader/leaderDojangEdit";
		  }
		
    	return page;
   }
   
    //도장깨기 수정
   @RequestMapping(value = "/dojangEdit")
	public ModelAndView leaderDojangEdit(HttpSession session, Model model,
		   @RequestParam HashMap<String, String> params){
	  logger.info("params : {}",params);
	   return service.leaderDojangEdit(params);
   }
   
   //번개모임 수정 팝업
   @RequestMapping(value = "/lightEdit.go")
  	public String leaderLightningEditGo(HttpSession session, Model model,
  			@RequestParam String lightning_no){
      	String page = "./Leader/leaderLightningEdit";
      	String loginId = (String) session.getAttribute("loginId");
      	model.addAttribute("loginId", loginId);

      //번개모임 고유 데이터 가져오기
		 LeaderDTO lightDto = service.lightDetail(lightning_no,loginId);
		 if (lightDto != null) {
			 model.addAttribute("lightDto", lightDto);
		 }
  		
      	return page;
   }
   
   //번개 수정
   @RequestMapping(value = "/lightEdit")
	public ModelAndView lightningEdit(HttpSession session, Model model,
		   @RequestParam HashMap<String, String> params){
	  logger.info("params : {}",params);
	   return service.lightningEdit(params);
   }
   
   //번개 가입 대기 회원 팝업
	@RequestMapping(value = "/lightJoinWait.go")
	public String lightJoinWait(HttpSession session, Model model,
			@RequestParam String lightning_no){
		String loginId = (String) session.getAttribute("loginId");
      	model.addAttribute("loginId", loginId);
      	
      	//가입 대기 회원
		ArrayList<LeaderDTO> lightJoinWait = service.lightJoinWait(lightning_no);
		model.addAttribute("lightJoinWait", lightJoinWait);
		return "./Leader/lightJoinWait";
   }
	
	@RequestMapping(value = "/lightJoinWaitUpdate")
	public ModelAndView lightJoinWaitUpdate(@RequestParam HashMap<String, String> params){
		logger.info("params : {}",params);
		return service.lightJoinWaitUpdate(params);
   }
	
	//도장깨기 가입 대기 회원 팝업
	@RequestMapping(value = "/dojangJoinWait.go")
	public String dojangJoinWait(HttpSession session, Model model,
			@RequestParam String dojang_no){
		String loginId = (String) session.getAttribute("loginId");
      	model.addAttribute("loginId", loginId);
      	
      	//가입 대기 회원
		ArrayList<LeaderDTO> dojangJoinWait = service.dojangJoinWait(dojang_no);
		model.addAttribute("dojangJoinWait", dojangJoinWait);
		return "./Leader/dojangJoinWait";
   }
	
	@RequestMapping(value = "/dojangJoinWaitUpdate")
	public ModelAndView dojangJoinWaitUpdate(@RequestParam HashMap<String, String> params){
		logger.info("params : {}",params);
		return service.dojangJoinWaitUpdate(params);
   }
	
	//나의 모임 관리 - 게시글
	@RequestMapping(value = "/myGroupPostSetting")
	public String myGroupPostSettingGo(HttpSession session, Model model,
			@RequestParam String class_no, @RequestParam String idx){
		String loginId = (String) session.getAttribute("loginId");
		model.addAttribute("loginId", loginId);
		//상단 프로필사진, 모임이름, 작성글, 작성댓글 불러오기
		LeaderDTO dto = service.myGroupEtc(loginId,class_no,idx);
		model.addAttribute("dto", dto);
		
		return "./Leader/myGroupPostSetting";
   }

	@RequestMapping("/myGroupPostSetting.ajax")
	@ResponseBody
	public HashMap<String, Object> myGroupPostSetting(@RequestParam HashMap<String, String> params){
		logger.info("나의 모임 관리 게시글 리스트 요청 : "+params);
		return service.myGroupPostSetting(params);
	}
	
	//나의 모임 관리 - 회원
	@RequestMapping(value = "/myGroupMemberSetting")
	public String myGroupMemberSettingGo(HttpSession session, Model model,
			@RequestParam String class_no, @RequestParam String idx){
		String loginId = (String) session.getAttribute("loginId");
		model.addAttribute("loginId", loginId);
		//상단 프로필사진, 모임이름, 작성글, 작성댓글 불러오기
		LeaderDTO dto = service.myGroupEtc(loginId,class_no,idx);
		model.addAttribute("dto", dto);
		
		return "./Leader/myGroupMemberSetting";
	}
	
	@RequestMapping("/myGroupMemberSetting.ajax")
	@ResponseBody
	public HashMap<String, Object> myGroupMemberSetting(@RequestParam HashMap<String, String> params){
		logger.info("나의 모임 관리 게시글 리스트 요청 : "+params);
		return service.myGroupMemberSetting(params);
	}
	
	//회원 추방 팝업
	@RequestMapping("/memberGetOut.go")
	public String memberGetOut(Model model,@RequestParam String member_id) {
		logger.info("모임 회원 추방 팝업 이동  : "+member_id);
		model.addAttribute("member_id", member_id);
		return"./Leader/memberGetOut";
	}
}
