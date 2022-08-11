package com.jmt.mypage.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmt.member.dto.MemberDTO;
import com.jmt.member.dto.photoDTO;
import com.jmt.mypage.dao.MypageDAO;

@Service
public class MypageService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  MypageDAO dao;

	public MemberDTO mypage(String loginId) {
		MemberDTO params = dao.mypage(loginId);
		int food_no = params.getFood_no();
		int grade_no = params.getGrade_no();
		if(food_no == 1) {
			params.setFood_name("한식");
		}else if(food_no == 2) {
			params.setFood_name("중식");
		}else if(food_no == 3) {
			params.setFood_name("일식");
		}else if(food_no == 4) {
			params.setFood_name("양식");
		}else if(food_no == 5) {
			params.setFood_name("기타외국음식");
		}else if(food_no == 6) {
			params.setFood_name("디저트/까페");
		}
		
		if(grade_no == 1) {
			params.setGrade_name("나무수저");
		}else if(grade_no == 2) {
			params.setGrade_name("동수저");
		}else if(grade_no == 3) {
			params.setGrade_name("은수저");
		}else if(grade_no == 4) {
			params.setGrade_name("금수저");
		}else if(grade_no == 5) {
			params.setGrade_name("다이아수저");
		}
		
		return params;
	}

	public int blindCount(String loginId) {
		
		return dao.blindCount(loginId);
	}

	public int follower(String loginId) {
		
		return dao.follower(loginId);
	}

	public int following(String loginId) {
		
		return dao.following(loginId);
	}

	public int profile_no(String loginId) {
		
		return dao.profile_no(loginId);
	}
	
	public photoDTO photoList(int profile_no) {
		
		return dao.photoList(profile_no);
	}

	public ArrayList<MemberDTO> foodList() {
		
		return dao.foodList();
	}


}
