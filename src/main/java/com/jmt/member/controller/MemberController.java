package com.jmt.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jmt.member.dto.MemberDTO;
import com.jmt.member.service.MemberService;

@Controller
public class MemberController extends HandlerInterceptorAdapter{
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired MemberService service;
	
		// 로그인 페이지
		@RequestMapping(value = "/login.go")
		public String login( Model model) {
			logger.info("로그인 페이지 이동");
			
			return "/Member/login";
		}
			
		// 회원가입 페이지
		//@RequestMapping(value = "/Member/joinForm.go")
		//public String joinForm( Model model) {
		//	logger.info("회원가입 페이지 이동");
						
		//	return "/Member/joinForm";
		//}
		
		// 회원가입
		@RequestMapping("/join.ajax")
		@ResponseBody
		public HashMap<String, Object> join(@RequestParam HashMap<String, String> params) {
			logger.info("회원가입 요청 : "+params);
			
			return service.join(params);
		}
		
		// 아이디 중복 체크
		@RequestMapping("/idoverlay.ajax")
		@ResponseBody
		public HashMap<String, Object> idoverlay(@RequestParam String chkId) {
			
			logger.info("아이디 중복 체크 : "+chkId);
			return service.idoverlay(chkId);
		}
			
		// 이메일 중복 체크
		@RequestMapping("/emailoverlay.ajax")
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
			
			String hashText = service.con(id); //암호화 된 비밀번호 가져오기
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			boolean match = encoder.matches(pw, hashText); //암호화 된 비밀번호와 입력된 비밀번호가 맞는지 확인
			
			if(match) { //암호화 된 비밀번호와 입려된 비밀번호가 일치한다면 로그인 진행
				String loginId = service.login(id, hashText); //로그인 아이디 가져오기
				session.setAttribute("loginId", loginId); //로그인 아이디 세션 저장
				String member_status = service.getMember_status(id, hashText); //관리자, 일반회원, 블랙리스트, 탈퇴회원인지 확인
				session.setAttribute("member_status", member_status);
				logger.info("로그인 요청아이디 : "+loginId+" 회원 상태 : "+member_status);
				if(loginId != null && member_status != null) {
					String profileExist = service.profileExist(loginId); //로그인이 진행되면 프로필 생성 여부 확인
					if(profileExist != null) { //프로필이 생성 되어있다면 메인페이지(테스트페이지)로 이동
						page="redirect:/"; // 테스트용 페이지 만들어서 로그아웃 기능 확인
					}else { //프로필을 생성하지 않았다면 프로필 생성 페이지로 이동
						ArrayList<MemberDTO> foodList = service.foodList(); //음식카테고리 가져오기
						model.addAttribute("foodList", foodList);
						page="/Member/profileRegister"; 
					}
					
					//블랙리스트 회원일 경우
					if(member_status.equals("블랙리스트")) { 
						session.removeAttribute("loginId");
						model.addAttribute("msg", "블랙리스트 회원입니다. 관리자에게 문의하세요.");
						page="/Member/login";
					} else if(member_status.equals("탈퇴회원")) { //탈퇴 회원일 경우
						session.removeAttribute("loginId");
						model.addAttribute("msg", "탈퇴한 회원입니다.");
						page="/Member/login";
					}
				}
			}else {
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
			
			String pwFind = service.pwFind(id,email); //회원 아이디와 이메일로 비밀번호가 존재하는지 확인
			logger.info("조회한 pw : "+pwFind);
			String page = "/Member/pwFind"; //회원 아이디와 이메일이 일치하지 않으면 기존 페이지 유지
			if(pwFind != null) { //비밀번호가 존재한다면 세션에 아이디 저장하고 비밀번호 변경 페이지로 이동
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
			String id = (String) session.getAttribute("id"); //세션에 저장한 아이디 꺼내오기

			return service.pwUpdate(id,pw);
		}
		
		// 로그아웃
		@RequestMapping(value = "/logout.do")
		public String logout(RedirectAttributes ra ,HttpSession session) {
			session.removeAttribute("loginId");
			session.removeAttribute("mb_class");
			ra.addFlashAttribute("msg", "로그아웃 되었습니다");
			return "redirect:/"; 
		}
		
		
		
		//프로필 등록
		@RequestMapping(value = "/profileRegister.do")
		public String profileRegister(Model model, MultipartFile[] photos, HttpSession session, 
				@RequestParam HashMap<String, Object> params) {
			logger.info("프로필 요청 값 {}: ",params);
			logger.info("사진 : ",photos);
			String loginId = (String) session.getAttribute("loginId"); //세션에 저장된 아이디 꺼내오기
			String member_status = (String) session.getAttribute("member_status");
			logger.info("member_status : "+member_status);
			params.put("loginId", loginId); //hashmap 타입으로 한번에 보내기 위해 params 에 넣기
			String page = "./Main/main";
			if(member_status.equals("일반회원")) {
				if(params.get("gender") != null && params.get("job") != null 
						&& params.get("speed") != null) {
					service.profileRegister(photos, params);
					model.addAttribute("msg","프로필 등록이 완료되었습니다.");
				}else {
					model.addAttribute("msg", "입력하지 않은 값을 입력해주세요. 입력되지 않은 것이 있으면 이용에 제한 될 수 있습니다.");
					page="redirect:/profileRegister.go";
				}
			}else {
				model.addAttribute("msg", "등록에 실패하였습니다.");
			}
			
			return page; 
		}
		
		
		//프로필 등록 이동페이지
		@RequestMapping(value = "/profileRegister.go")
		public String profileRegister(HttpSession session, Model model) {
			String loginId = (String) session.getAttribute("loginId");
			String page = "/Main/main";
			if(loginId != null) {
				model.addAttribute("msg","프로필을 등록해야만 마이페이지 이용이 가능합니다.");
				service.profileExist(loginId);
				ArrayList<MemberDTO> foodList = service.foodList(); //음식카테고리 가져오기
				model.addAttribute("foodList", foodList);
				page="/Member/profileRegister";
			}

			return page; 
		}
		
		

		
		
		

}
