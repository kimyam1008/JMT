package com.jmt.moim.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jmt.moim.dao.LeaderDAO;
import com.jmt.moim.dto.LeaderDTO;

@Service
public class LeaderService {
	
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  LeaderDAO dao;

	public LeaderDTO lightDetail(String idx, String loginId) {
		logger.info("방장 페이지 번개모임 상세정보 요청");
		return dao.lightDetail(idx,loginId);
	}

	public LeaderDTO dojangDetail(String idx, String loginId) {
		logger.info("방장 페이지 도장깨기 상세정보 요청");
		return dao.dojangDetail(idx,loginId);
	}

	public ArrayList<LeaderDTO> recentPost(String idx) {
		logger.info("최근 게시물 호출 요청");
		return dao.recentPost(idx);
	}

	public ArrayList<LeaderDTO> joinWait(String idx) {
		logger.info("가입 대기 회원 리스트 호출 요청");
		return dao.joinWait(idx);
	}

	public ModelAndView joinWaitUpdate(HashMap<String, String> params) {
		String page = "redirect:/leaderPage.go?"; //마이페이지 완성되면 다시 해봐야됨
		page += "idx="+params.get("idx");
		ModelAndView mav = new ModelAndView(page);
		dao.joinWaitUpdate(params);
		return mav;
	}

	public ModelAndView leaderGroupEdit(HashMap<String, String> params) {
		String page ="redirect:/leaderPage.go?"; //마이페이지 완성되면 다시 해봐야됨
		page += "idx="+params.get("idx");
		ModelAndView mav = new ModelAndView(page);
		if (params.get("class_no") == "1") {
			dao.leaderLightningEdit(params);
		} else {			
			dao.leaderDojangGroupEdit(params);
		}
		return mav;
	}

	public HashMap<String, Object> myGroupPostSetting(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		logger.info("보여줄 페이지 : "+page);
		
		//총 갯수(allCnt) / 페이지당 보여줄 갯수(cnt) = 생성 가능한 페이지(pages)
		int allCnt = dao.allCount();
		logger.info("allCnt : "+allCnt);
		int pages = allCnt % cnt > 0 ? (allCnt / cnt)+1 : (allCnt / cnt);
		logger.info("pages : "+pages);
		
		if(page > pages) {
			page = pages;
		}
		
		map.put("pages", pages); //만들 수 있는 최대 페이지 수
		map.put("currPage", page); //현재 페이지
		
		int offset = (page -1) * cnt; //offset : 게시글 시작 번호
		logger.info("offset : "+offset);
		
		ArrayList<LeaderDTO> myGroupPostSetting = dao.myGroupPostSetting(cnt,offset);
		map.put("myGroupPostSetting", myGroupPostSetting);
		return map;
	}

	public LeaderDTO myGroupEtc(String loginId, String class_no, String idx) {
		logger.info("나의 모임관리 잡다한거 요청");
		return dao.myGroupEtc(loginId,class_no,idx);
	}

}
