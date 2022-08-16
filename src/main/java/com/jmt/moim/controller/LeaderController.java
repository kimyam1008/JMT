package com.jmt.moim.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jmt.groupreview.dto.GroupReviewDTO;
import com.jmt.moim.dto.LeaderDTO;
import com.jmt.moim.service.LeaderService;

@Controller
public class LeaderController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  LeaderService service;

	//방장페이지 메인
   @RequestMapping(value = "/leaderPage.go")
   public String leaderPage(Model model,HttpSession session,
		   @RequestParam String idx,@RequestParam String class_no){
	  logger.info("방장 페이지 진입");
	  String loginId = (String) session.getAttribute("loginId");
	  model.addAttribute("loginId", loginId);
	  
	  if (class_no == "1") {
		  //번개모임 고유 데이터 가져오기
		  LeaderDTO lightDto = service.lightDetail(idx,loginId);
		  if (lightDto != null) {
			  model.addAttribute("lightDto", lightDto);
		  }
	} else {
		LeaderDTO dojangDto = service.dojangDetail(idx,loginId);
		if (dojangDto != null) {
			  model.addAttribute("dojangDto", dojangDto);
		  }
	}
	  //최근 게시글
	  ArrayList<LeaderDTO> recentPost = service.recentPost(idx);
	  model.addAttribute("recentPost", recentPost);
	  
	  //가입 대기 회원
	  ArrayList<LeaderDTO> joinWait = service.joinWait(idx);
	  model.addAttribute("joinWait", joinWait);
	  
      return "./Leader/leaderPage";
   }
   
   //모임 수정 팝업
   @RequestMapping(value = "/leaderGroupEdit.go")
   public String leaderGroupEdit(){
      return "./Leader/leaderGroupEdit";
   }
   
   //가입 대기 회원 팝업
   @RequestMapping(value = "/joinWait.go")
   public String joinWait(){
      return "./Leader/joinWait";
   }
}
