package com.jmt.member.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jmt.member.dao.MemberDAO;

@Service
public class MemberService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired MemberDAO dao;

	public HashMap<String, Object> join(HashMap<String, String> params) {
		logger.info("회원 가입 서비스");
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		String hashText = "";
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		hashText = encoder.encode(params.get("pw"));
		logger.info(hashText);
		
		params.put("pw", hashText);
		
		int row = dao.join(params);
		boolean success = false;
		
		if(row>0) {
			success = true;
		}

		result.put("success", success);
		
		return result;
	}

	public HashMap<String, Object> idoverlay(String chkId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String overId = dao.idoverlay(chkId);
		logger.info("중복 아이디가 있나? "+overId);
		boolean over = overId == null ? false : true; //아이디없음(false) : 아이디있음(true)
		map.put("idoverlay", over);
		
		return map;
	}

	public HashMap<String, Object> emailoverlay(String chkEmail) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String overEmail = dao.emailoverlay(chkEmail);
		logger.info("중복 이메일이 있나? "+overEmail);
		boolean over = overEmail == null ? false : true; //이메일없음(false) : 이메일있음(true)
		map.put("emailoverlay", over);
		
		return map;
	}

	public String login(String id, String pw) {
		logger.info("로그인 서비스");
		return dao.login(id,pw);
	}

	public String getMember_status(String id, String pw) {
		
		return dao.getMbClass(id,pw);
	}

	public ModelAndView idFind(String email, String birth) {
		String idFind = dao.idFind(email, birth);
		logger.info("아이디 : "+idFind);
		ModelAndView mav = new ModelAndView();
		String msg = null;
		String page = null;
		if(idFind != null) {
			msg = "회원님의 아이디는 "+"'"+idFind+"'"+" 입니다.";
			page = "/Member/login";
		} else {
			msg = "존재하지 않는 회원입니다.";
			page = "/Member/idFind";
		}
		
		mav.addObject("msg",msg);
		mav.setViewName(page);
		
		return mav;
	}

	public String pwFind(String id, String email) {
		
		return dao.pwFind(id, email);
	}

	public HashMap<String, Object> pwUpdate(String id, String pw) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = dao.pwUpdate(id, pw);
		boolean success = false;
		
		if(row>0) {
			success = true;
			map.put("success", success);
		}
		
		return map;
	}
	
	

}
