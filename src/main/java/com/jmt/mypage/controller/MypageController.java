package com.jmt.mypage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jmt.member.dto.MemberDTO;
import com.jmt.member.dto.photoDTO;
import com.jmt.mypage.service.MypageService;

@Controller
public class MypageController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  MypageService service;
	
		// 마이페이지 이동
		@RequestMapping(value = "/mypage.go")
		public String mypage(Model model, HttpSession session) {
			String loginId = (String) session.getAttribute("loginId");
			MemberDTO my = service.mypage(loginId); //마이페이지에 보여줄 프로필 정보 가져오기
			int profile_no = service.profile_no(loginId); //프로필 사진 가져올 때 맵퍼에 조건으로 필요
			photoDTO photoList = service.photoList(profile_no); //프로필 사진 가져오기
			int blindCount = service.blindCount(loginId); //블라인드 갯수 가져오기
			int follower = service.follower(loginId); //팔로워 수 가져오기
			int following = service.following(loginId); //팔로잉 수 가져오기
			model.addAttribute("list", my);
			model.addAttribute("blind", blindCount);
			model.addAttribute("follower", follower);
			model.addAttribute("following", following);
			model.addAttribute("photo",photoList);
			
			return "/Mypage/mypage";
		}
		
		// 프로필 수정페이지 이동
		@RequestMapping(value = "/profileUpdate.go")
		public String profileUpdate(Model model, HttpSession session) {
			String loginId = (String) session.getAttribute("loginId");
			MemberDTO my = service.mypage(loginId); //프로필 정보
			int profile_no = service.profile_no(loginId);
			photoDTO photoList = service.photoList(profile_no); // 프로필 사진
			ArrayList<MemberDTO> foodList = service.foodList(); //음식카테고리 가져오기
			model.addAttribute("foodList", foodList);
			model.addAttribute("list", my);
			model.addAttribute("photo",photoList);
			
			
			return "/Mypage/profileUpdate";
		}
		
		// 나의활동 첫 페이지 이동
		@RequestMapping(value = "/myBoardList.go")
		public String myBoardList() {
			
			return "/Mypage/myBoardList";
		}
		
		

}
