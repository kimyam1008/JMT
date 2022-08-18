package com.jmt.moim.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	public String lightningLeaderPage(Model model,HttpSession session
		   ,@RequestParam String lightning_no){
		String loginId = (String) session.getAttribute("loginId");
		model.addAttribute("loginId", loginId);
		//String lightning_no = (String) session.getAttribute("lightning_no");
		//model.addAttribute("lightning_no", lightning_no);
		session.setAttribute("lightning_no", lightning_no);
		logger.info("번개모임 "+lightning_no+"번 방장 페이지 진입");
	  
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
   @RequestMapping(value = "/leaderDojangEdit.ajax")
   @ResponseBody
	public HashMap<String, Object> leaderDojangEdit(@RequestParam HashMap<String, String> params){
	  logger.info("도장깨기 수정 : {}",params);
	  HashMap<String, Object> map = new HashMap<String, Object>();
	  boolean dojangEdit = service.leaderDojangEdit(params);
	  map.put("leaderDojangEdit", dojangEdit);
	  return map;
   }
   
   //번개모임 수정 팝업
   @RequestMapping(value = "/lightEdit.go")
  	public String leaderLightningEditGo(HttpSession session, Model model,
  			@RequestParam String lightning_no){
      	String page = "./Leader/leaderLightningEdit";
      	String loginId = (String) session.getAttribute("loginId");
      	model.addAttribute("loginId", loginId);
      	session.setAttribute("lightning_no", lightning_no);

      //번개모임 고유 데이터 가져오기
		 LeaderDTO lightDto = service.lightDetail(lightning_no,loginId);
		 if (lightDto != null) {
			 model.addAttribute("lightDto", lightDto);
		 }
  		
      	return page;
   }
   
   //번개 수정
   @RequestMapping(value = "/leaderLightEdit.ajax")
   @ResponseBody
	public HashMap<String, Object> leaderLightEdit(@RequestParam HashMap<String, String> params){
	  logger.info("번개모임 수정 : {}",params);
	  HashMap<String, Object> map = new HashMap<String, Object>();
	  boolean lightEdit = service.leaderLightEdit(params);
	  map.put("leaderLightEdit", lightEdit);
	  return map;
   }
   
   //번개 가입 대기 회원 팝업
	@RequestMapping(value = "/lightJoinWait.go")
	public String lightJoinWait(HttpSession session, Model model){
		String loginId = (String) session.getAttribute("loginId");
      	model.addAttribute("loginId", loginId);
      	String lightning_no = (String) session.getAttribute("lightning_no");
		model.addAttribute("lightning_no", lightning_no);
      	
      	//가입 대기 회원
		ArrayList<LeaderDTO> lightJoinWait = service.lightJoinWait(lightning_no);
		model.addAttribute("lightJoinWait", lightJoinWait);
		return "./Leader/lightJoinWait";
   }
	
	@RequestMapping(value = "/lightJoinWaitUp.ajax")
	@ResponseBody
	public HashMap<String, Object> lightJoinWaitUp(@RequestParam HashMap<String, String> params){
		logger.info("번개 가입 승인 : {}",params);
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean lightEditUp = service.lightJoinWaitUp(params);
		map.put("lightJoinWaitUp", lightEditUp);
		return map;
   }
	
	//도장깨기 가입 대기 회원 팝업
	@RequestMapping(value = "/dojangJoinWait.go")
	public String dojangJoinWait(HttpSession session, Model model){
		String loginId = (String) session.getAttribute("loginId");
      	model.addAttribute("loginId", loginId);
      	String dojang_no = (String) session.getAttribute("dojang_no");
		model.addAttribute("dojang_no", dojang_no);
      	//session.setAttribute("dojang_no", dojang_no);
      	
      	//가입 대기 회원
		ArrayList<LeaderDTO> dojangJoinWait = service.dojangJoinWait(dojang_no);
		model.addAttribute("dojangJoinWait", dojangJoinWait);
		return "./Leader/dojangJoinWait";
   }
	
	@RequestMapping(value = "/dojangJoinWaitUp.ajax")
	@ResponseBody
	public HashMap<String, Object> dojangJoinWaitUp(@RequestParam HashMap<String, String> params){
		logger.info("도장깨기 가입 승인 : {}",params);
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean dojangEditUp = service.dojangJoinWaitUp(params);
		map.put("dojangJoinWaitUp", dojangEditUp);
		return map;
   }
	
	//나의 모임 관리 - 게시글 (도장)
	@RequestMapping(value = "/myGroupPostSettingD.go")
	public String myGroupPostSettingGo(HttpSession session, Model model
			/*@RequestParam String dojang_no*/){
		String loginId = (String) session.getAttribute("loginId");
		model.addAttribute("loginId", loginId);
		String dojang_no = (String) session.getAttribute("dojang_no");
		model.addAttribute("dojang_no", dojang_no);
		//상단 프로필사진, 모임이름, 작성글, 작성댓글 불러오기
		LeaderDTO dto = service.myGroupEtcD(loginId,dojang_no);
		model.addAttribute("dto", dto);
		
		return "./Leader/myGroupPostSettingD";
   }

	@RequestMapping("/myGroupPostSettingD.ajax")
	@ResponseBody
	public HashMap<String, Object> myGroupPostSetting(@RequestParam HashMap<String, String> params,
			HttpSession session){
		logger.info("나의 모임 관리 게시글 리스트 요청 : "+params);
		//session.setAttribute("dojang_no", dojang_no);
		return service.myGroupPostSettingD(params);
	}
	
	//나의 모임 관리 - 회원 (도장)
	@RequestMapping(value = "/myGroupMemberSettingD")
	public String myGroupMemberSettingGo(HttpSession session, Model model
			/*@RequestParam String dojang_no*/){
		String loginId = (String) session.getAttribute("loginId");
		model.addAttribute("loginId", loginId);
		String dojang_no = (String) session.getAttribute("dojang_no");
		model.addAttribute("dojang_no", dojang_no);
		
		//상단 프로필사진, 모임이름, 작성글, 작성댓글 불러오기
		LeaderDTO dto = service.myGroupEtcD(loginId,dojang_no);
		model.addAttribute("dto", dto);
		
		//도장 가입 회원 리스트
		ArrayList<LeaderDTO> dojangMember = service.dojangMember(dojang_no);
		logger.info("dojang_no : "+dojang_no);
		model.addAttribute("dojangMember", dojangMember);
		
		return "./Leader/myGroupMemberSettingD";
	}
	
	/*
	@RequestMapping("/myGroupMemberSettingD.ajax")
	@ResponseBody
	public HashMap<String, Object> myGroupMemberSetting(@RequestParam HashMap<String, String> params){
		logger.info("나의 모임 관리 게시글 리스트 요청 : "+params);
		return service.myGroupMemberSetting(params);
	}
	*/
	
	//나의 모임 관리 - 게시글 (번개)
	@RequestMapping(value = "/myGroupPostSettingL.go")
	public String myGroupPostSettingLgo(HttpSession session, Model model
			/*@RequestParam String dojang_no*/){
		String loginId = (String) session.getAttribute("loginId");
		model.addAttribute("loginId", loginId);
		String lightning_no = (String) session.getAttribute("lightning_no");
		model.addAttribute("lightning_no", lightning_no);
		//상단 프로필사진, 모임이름, 작성글, 작성댓글 불러오기
		LeaderDTO dto = service.myGroupEtcL(loginId,lightning_no);
		model.addAttribute("dto", dto);
		
		return "./Leader/myGroupPostSettingL";
   }
	
	@RequestMapping("/myGroupPostSettingL.ajax")
	@ResponseBody
	public HashMap<String, Object> myGroupPostSettingL(@RequestParam HashMap<String, String> params,
			HttpSession session){
		logger.info("(번개)나의 모임 관리 게시글 리스트 요청 : "+params);
		//session.setAttribute("dojang_no", dojang_no);
		return service.myGroupPostSettingL(params);
	}
	
	
	//나의 모임 관리 - 회원 (번개)
	@RequestMapping(value = "/myGroupMemberSettingL")
	public String myGroupMemberSettingLgo(HttpSession session, Model model
			/*@RequestParam String dojang_no*/){
		String loginId = (String) session.getAttribute("loginId");
		model.addAttribute("loginId", loginId);
		String lightning_no = (String) session.getAttribute("lightning_no");
		model.addAttribute("lightning_no", lightning_no);
		
		//상단 프로필사진, 모임이름, 작성글, 작성댓글 불러오기
		LeaderDTO dto = service.myGroupEtcL(loginId,lightning_no);
		model.addAttribute("dto", dto);
		
		//도장 가입 회원 리스트
		ArrayList<LeaderDTO> lightMember = service.lightMember(lightning_no);
		logger.info("lightning_no : "+lightning_no);
		model.addAttribute("lightMember", lightMember);
		
		return "./Leader/myGroupMemberSettingL";
	}
	
	
	//도장 회원 추방 팝업
	@RequestMapping("/memberGetOutD.go")
	public String memberGetOut(Model model,@RequestParam String member_id,HttpSession session) {
		String dojang_no = (String) session.getAttribute("dojang_no");
		model.addAttribute("dojang_no", dojang_no);
		logger.info("모임 회원 추방 팝업 이동  : "+member_id);
		model.addAttribute("member_id", member_id);
		return"./Leader/memberGetOutD";
	}
	
	//도장 회원 추방
	@RequestMapping("/memberGetOutD.ajax")
	@ResponseBody
	public HashMap<String, Object> memberGetOut(@RequestParam HashMap<String, String> params,HttpSession session){
		String loginId = (String) session.getAttribute("loginId");
	    params.put("loginId", loginId);
		logger.info("회원 추방 서비스 요청 : "+params);
		//session.setAttribute("dojang_no", dojang_no);
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean memberGetOutD = service.memberGetOutD(params);
		map.put("memberGetOutD", memberGetOutD);
		return map;
	}
	
	//번개 회원 추방 팝업
	@RequestMapping("/memberGetOutL.go")
	public String memberGetOutLgo(Model model,@RequestParam String member_id,HttpSession session) {
		String lightning_no = (String) session.getAttribute("lightning_no");
		model.addAttribute("lightning_no", lightning_no);
		logger.info("모임 회원 추방 팝업 이동  : "+member_id);
		model.addAttribute("member_id", member_id);
		return"./Leader/memberGetOutL";
	}
	
	//번개 회원 추방
	@RequestMapping("/memberGetOutL.ajax")
	@ResponseBody
	public HashMap<String, Object> memberGetOutL(@RequestParam HashMap<String, String> params,HttpSession session){
		String loginId = (String) session.getAttribute("loginId");
	    params.put("loginId", loginId);
		logger.info("회원 추방 서비스 요청 : "+params);
		//session.setAttribute("dojang_no", dojang_no);
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean memberGetOutL = service.memberGetOutL(params);
		map.put("memberGetOutL", memberGetOutL);
		return map;
	}
	
	//번개모임 삭제
	@RequestMapping("/leaderLightDelete.do")
	public String leaderLightDelete(Model model, @RequestParam String lightning_no) {
		model.addAttribute("lightning_no", lightning_no);
		logger.info("번개 삭제 요청 : "+lightning_no);
		service.leaderLightDelete(lightning_no);
		//알림
		service.lightDelNoti(lightning_no);
		return "./Main/main";
	}
	
	//번개모임 삭제
	@RequestMapping("/leaderDojangDelete.do")
	public String leaderDojangDelete(Model model, @RequestParam String dojang_no) {
		model.addAttribute("dojang_no", dojang_no);
		logger.info("도장깨기 삭제 요청 : "+dojang_no);
		service.leaderDojangDelete(dojang_no);
		//알림
		service.DojangDelNoti(dojang_no);
		return "./Main/main";
	}
	
	
	/*//번개모임 삭제
	@RequestMapping("/leaderLightDelete.do")
	public String leaderLightDelete(Model model,HttpSession session) {
		String lightning_no = (String) session.getAttribute("lightning_no");
		model.addAttribute("lightning_no", lightning_no);
		logger.info("번개 삭제 요청 : "+lightning_no);
		service.leaderLightDelete(lightning_no);
		service.lightDelNoti(lightning_no);
		return "./Main/main";
	}
	
	//번개모임 삭제
	@RequestMapping("/leaderDojangDelete.do")
	public String leaderDojangDelete(Model model,HttpSession session) {
		String dojang_no = (String) session.getAttribute("dojang_no");
		model.addAttribute("dojang_no", dojang_no);
		logger.info("도장깨기 삭제 요청 : "+dojang_no);
		service.leaderDojangDelete(dojang_no);
		return "./Main/main";
	}
	 */
}
