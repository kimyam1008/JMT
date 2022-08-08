package com.jmt.member.controller;

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

import com.jmt.member.service.MemberService;

@Controller
public class MemberController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired MemberService service;
	
		// 로그인 페이지
		@RequestMapping(value = "/login.go")
		public String login( Model model) {
			logger.info("로그인 페이지 이동");
			
			return "/Member/login";
		}
			
		// 회원가입 페이지
		@RequestMapping(value = "/Member/joinForm.go")
		public String joinForm( Model model) {
			logger.info("회원가입 페이지 이동");
						
			return "/Member/joinForm";
		}
		
		// 회원가입
		@RequestMapping("/Member/join.ajax")
		@ResponseBody
		public HashMap<String, Object> join(@RequestParam HashMap<String, String> params) {
			logger.info("회원가입 요청 : "+params);
			
			return service.join(params);
		}
		
		// 아이디 중복 체크
		@RequestMapping("/Member/idoverlay.ajax")
		@ResponseBody
		public HashMap<String, Object> idoverlay(@RequestParam String chkId) {
			
			logger.info("아이디 중복 체크 : "+chkId);
			return service.idoverlay(chkId);
		}
			
		// 이메일 중복 체크
		@RequestMapping("/Member/emailoverlay.ajax")
		@ResponseBody
		public HashMap<String, Object> emailoverlay(@RequestParam String chkEmail) {
			
			logger.info("이메일 중복 체크 : "+chkEmail);
			return service.emailoverlay(chkEmail);
		}
		
		//로그인
		@RequestMapping(value = "/login.do")
		public String login(Model model, HttpSession session ,@RequestParam String id, @RequestParam String pw) {
			logger.info("로그인 요청 :{},{}",id,pw);
			String page="/Member/login";
			
			String loginId = service.login(id, pw);
			String member_status = service.getMember_status(id, pw);
			logger.info("로그인 요청아이디 : "+loginId+" 회원 상태 : "+member_status);
			
			if(loginId != null && member_status != null) {
				session.setAttribute("loginId", loginId);
				page="/Member/test"; // 테스트용 페이지 만들어서 로그아웃 기능 확인
				
				//블랙리스트 회원일 경우
				if(member_status.equals("블랙리스트")) { 
					session.removeAttribute("loginId");
					model.addAttribute("msg", "블랙리스트 회원입니다. 관리자에게 문의하세요.");
					page="/Main/main";
				} else if(member_status.equals("탈퇴회원")) { //탈퇴 회원일 경우
					session.removeAttribute("loginId");
					model.addAttribute("msg", "탈퇴한 회원입니다.");
					page="/Main/main";
				}
			} else if (loginId == null && member_status == null) {
				model.addAttribute("msg", "아이디 또는 비밀번호를 확인하세요");
			}
			
			return page; 
		}
		
		//id 찾기 페이지
		@RequestMapping(value = "/Member/idFind.go")
		public String idFind( Model model) {
			logger.info("id 찾기 페이지 이동");
			
			return "/Member/idFind";
		}
		
		//id 찾기
		@RequestMapping(value = "/Member/idFind.do")
		public ModelAndView idFind(@RequestParam String email, @RequestParam String birth) {
			
			logger.info("아이디 찾기 {} : "+email,birth);
			
			return service.idFind(email, birth);
		}
		
		//pw 찾기 페이지
		@RequestMapping(value = "/Member/pwFind.go")
		public String pwFind( Model model) {
			logger.info("pw 찾기 페이지 이동");
			
			return "/Member/pwFind";
		}
		
		//pw 찾기
		@RequestMapping(value = "/Member/pwFind.do")
		public String pwFind(Model model,HttpSession session, @RequestParam String id,@RequestParam String email) {
			
			String pwFind = service.pwFind(id,email);
			logger.info("조회한 pw : "+pwFind);
			String page = "/Member/pwFind";
			if(pwFind != null) {
				session.setAttribute("id", id);
				page = "/Member/pwFind2";
			}else {
				model.addAttribute("msg","아이디 또는 이메일을 확인해주세요.");
			}
			return page;
		}
		
		//pw 변경
		@RequestMapping(value = "/Member/pwUpdate.ajax")
		@ResponseBody
		public  HashMap<String, Object> pwUpdate(HttpSession session,@RequestParam String pw) {
			
			logger.info("비밀번호 변경 : "+pw);
			String id = (String) session.getAttribute("id");

			return service.pwUpdate(id,pw);
		}
		
		// 로그아웃
		@RequestMapping(value = "logout.do")
		public String logout(Model model,HttpSession session) {
				session.removeAttribute("loginId");
				session.removeAttribute("mb_class");
				model.addAttribute("msg", "로그아웃 되었습니다");
				
			return "/Member/login"; 
		}

}
