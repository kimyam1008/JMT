package com.jmt.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
			//뷰에 보내주기
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
		
		// 비밀번호 변경 팝업창
		@RequestMapping(value = "/passUpdate.go")
		public String passUpdate() {
			
			return "/Mypage/passUpdate";
		}
		
		// 비밀번호 변경
		@RequestMapping("/passUpdate.ajax")
		@ResponseBody
		public HashMap<String, Object> passUpdate(HttpSession session, @RequestParam HashMap<String, String> params) {
			logger.info("비밀번호 변경: "+params);
			HashMap<String, Object> map = new HashMap<String, Object>();
			String loginId = (String) session.getAttribute("loginId"); //비밀번호 조회를 위한 로그인 아이디 가져오기
			params.put("loginId", loginId); //인자값을 하나로 보내주기 위해 params 에 같이 넣어주기
			String hashText = service.oriPass(params); //DB에 저장되어 있는 현재 비밀번호 가져오기
			String oriPass = params.get("oriPass"); //입력받은 현재 비밀번호 가져오기
			String changePass = params.get("changePass"); //변경 할 비밀번호 가져오기
			String changePassCon = params.get("changePassCon"); //변경 비밀번호 확인 가져오기
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			boolean match = encoder.matches(oriPass, hashText); //디비에 저정된 비밀번호와 입력받은 비밀번호가 맞는지 확인하기
			boolean success = false;
			if(match) { //조회한 비밀번호와 입력받은 비밀번호가 서로 일치한다면
				if(changePass.equals(changePassCon)) { //변경할 비밀번호와 비밀번호 확인을 한번 더 비교하기
					hashText = encoder.encode(changePass); //비교해서 일치하는 것이 확인된다면 다시 암호화 하기
					params.put("changePass", hashText); //암호화 한 비밀번호 params 값에 넣어주기
					int row = service.passUpdate(params); //params 값을 디비에 업데이트
					if(row>0) { // 업데이트가 성공하면
						success = true; //suceess 를 true 로 바꿔주고
						map.put("passUpdate", success); //map 에 넣어서 뷰에 보내기
					}
				}
			}
			
			return map;
		}
		
		// 프로필 수정
		@RequestMapping(value = "/profileUpdate.do")
		public String profileUpdate(Model model, HttpSession session, MultipartFile[] photos,
				@RequestParam HashMap<String, Object> params) {
			String loginId = (String) session.getAttribute("loginId");
			params.put("loginId", loginId);
			logger.info("params :{}",params);
			service.profileUpdate(model, photos, params);
			
			return "redirect:/mypage.go";
		}
		
		// 나의활동 첫 페이지 이동
		@RequestMapping(value = "/myBoardList.go")
		public String myBoardList() {
			
			return "/Mypage/myBoardList";
		}
		
		

}
