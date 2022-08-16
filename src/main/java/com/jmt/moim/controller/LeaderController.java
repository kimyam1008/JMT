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
		 
		 //최근 게시글
		 ArrayList<LeaderDTO> recentPost = service.recentPost();
		 model.addAttribute("recentPost", recentPost);
		  
		 //가입 대기 회원
		 ArrayList<LeaderDTO> joinWait = service.joinWait();
		 model.addAttribute("joinWait", joinWait);
		  
	     return "./Leader/lightningLeaderPage";
   }
	
	//도장깨기 방장 페이지
	@RequestMapping(value = "/dojangLeaderPage.go")
	public String dojangLeaderPage(Model model,HttpSession session,
		   @RequestParam String dojang_no){
		logger.info("도장깨기 방장 페이지 진입");
		String loginId = (String) session.getAttribute("loginId");
		model.addAttribute("loginId", loginId);

		//도장깨기 고유 데이터 가져오기
		LeaderDTO dojangDto = service.dojangDetail(dojang_no,loginId);
		if (dojangDto != null) {
			 model.addAttribute("dojangDto", dojangDto);
		 }
		
		 //최근 게시글
		 ArrayList<LeaderDTO> recentPost = service.recentPost();
		 model.addAttribute("recentPost", recentPost);
		  
		 //가입 대기 회원
		 ArrayList<LeaderDTO> joinWait = service.joinWait();
		 model.addAttribute("joinWait", joinWait);
		  
	     return "./Leader/lightningLeaderPage";
   }
   
	//모임 수정 팝업
    @RequestMapping(value = "/leaderGroupEdit.go")
	public String leaderGroupEditGo(HttpSession session, Model model,
			@RequestParam String idx,@RequestParam String class_no){
    	String page = "./Leader/leaderPage";
    	String loginId = (String) session.getAttribute("loginId");
    	model.addAttribute("loginId", loginId);
    	
    	if (class_no == "1") {
			  //번개모임 고유 데이터 가져오기
			  LeaderDTO lightDto = service.lightDetail(idx,loginId);
			  if (lightDto != null) {
				  model.addAttribute("lightDto", lightDto);
				  page="./Leader/leaderLightningEdit";
			  }
		} else {
			//도장깨기 고유 데이터 가져오기
			LeaderDTO dojangDto = service.dojangDetail(idx,loginId);
			if (dojangDto != null) {
				  model.addAttribute("dojangDto", dojangDto);
				  page="./Leader/dojangEdit";
			  }
		} 
    	return page;
   }
   
   @RequestMapping(value = "/leaderGroupEdit.do")
	public ModelAndView leaderGroupEdit(HttpSession session, Model model,
		   @RequestParam HashMap<String, String> params){
	  logger.info("params : {}",params);
	   return service.leaderGroupEdit(params);
   }
   
   //가입 대기 회원 팝업
	@RequestMapping(value = "/joinWait.go")
	public String joinWaitGo(){
		return "./Leader/joinWait";
   }
   
	@RequestMapping(value = "/joinWait.do")
	public String joinWait(HttpSession session, Model model,
		   @RequestParam String idx){
		//가입 대기 회원
		ArrayList<LeaderDTO> joinWait = service.joinWait();
		model.addAttribute("joinWait", joinWait);
		return "./Leader/joinWait";
   }
	
	@RequestMapping(value = "/joinWaitUpdate")
	public ModelAndView joinWaitUpdate(@RequestParam HashMap<String, String> params){
		logger.info("params : {}",params);
		//가입 대기 회원
		//ArrayList<LeaderDTO> joinWait = service.joinWait(idx);
		//model.addAttribute("joinWait", joinWait);
		return service.joinWaitUpdate(params);
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
