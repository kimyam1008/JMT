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

	public LeaderDTO lightDetail(String lightning_no, String loginId) {
		logger.info("번개모임 방장 페이지 번개모임 상세정보 요청");
		return dao.lightDetail(lightning_no,loginId);
	}

	public LeaderDTO dojangDetail(String dojang_no, String loginId) {
		logger.info("도장깨기 방장 페이지 도장깨기 상세정보 요청");
		return dao.dojangDetail(dojang_no,loginId);
	}

	public ArrayList<LeaderDTO> lightRecentPost(String lightning_no) {
		logger.info("번개모임 최근 게시물 호출 요청");
		return dao.lightRecentPost(lightning_no);
	}

	public ArrayList<LeaderDTO> dojangRecentPost(String dojang_no) {
		logger.info("도장깨기 최근 게시물 호출 요청");
		return dao.dojangRecentPost(dojang_no);
	}
	
	public LeaderDTO lightJoinWait(String lightning_no) {
		logger.info("번개모임가입 대기 회원 리스트 호출 요청");
		return dao.lightJoinWait(lightning_no);
	}
	
	public LeaderDTO dojangJoinWait(String dojang_no) {
		logger.info("도장깨기 대기 회원 리스트 호출 요청");
		return dao.dojangJoinWait(dojang_no);
	}

	public boolean lightJoinWaitUp(HashMap<String, String> params) {
		logger.info("번개 가입 승인 서비스 도착 : "+params);

		boolean success = false;
		int row = dao.lightJoinWaitUp(params);
		if(row>0) {
			success=true;
		}
		return success;
	}
	
	public boolean dojangJoinWaitUp(HashMap<String, String> params) {
		logger.info("도장깨기 가입 승인 서비스 도착 : "+params);

		boolean success = false;
		int row = dao.dojangJoinWaitUp(params);
		if(row>0) {
			success=true;
		}
		return success;
	}
	
	public boolean leaderDojangEdit(HashMap<String, String> params) {
		logger.info("도장깨기 수정 서비스 도착 : "+params);
		
		boolean success = false;
		int row = dao.leaderDojangEdit(params);
		if (row>0) {
			success=true;
		}
		return success;
	}
	
	public boolean leaderLightEdit(HashMap<String, String> params) {
		logger.info("번개 수정 서비스 도착 : "+params);
		boolean success = false;
		int row = dao.leaderLightEdit(params);
		if (row>0) {
			success=true;
		}
		return success;
	}

	public HashMap<String, Object> myGroupPostSettingD(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		logger.info("보여줄 페이지 : "+page);
		
		String dojang_no = params.get("dojang_no");
		HashMap<String, Object> postSort = new HashMap<String, Object>();
		postSort.put("dojang_no", dojang_no);
		logger.info("dojang_no : "+dojang_no);
		
		//총 갯수(allCnt) / 페이지당 보여줄 갯수(cnt) = 생성 가능한 페이지(pages)
		int allCnt = dao.allCount(postSort);
		logger.info("allCnt : "+allCnt);
		int pages = allCnt % cnt > 0 ? (allCnt / cnt)+1 : (allCnt / cnt);
		logger.info("pages : "+pages);
		
		if(pages==0) {pages=1;}
		
		if(page > pages) {
			page = pages;
		}
		
		map.put("pages", pages); //만들 수 있는 최대 페이지 수
		map.put("currPage", page); //현재 페이지
		
		int offset = (page -1) * cnt; //offset : 게시글 시작 번호
		logger.info("offset,cnt : "+offset+","+cnt);
		
		postSort.put("cnt", cnt);
		postSort.put("offset", offset);
		
		logger.info("postSort : "+postSort);
		ArrayList<LeaderDTO> myGroupPostSettingD = dao.myGroupPostSettingD(postSort);
		map.put("myGroupPostSettingD", myGroupPostSettingD);
		return map;
	}

	public LeaderDTO myGroupEtcD(String loginId, String dojang_no) {
		logger.info("도장-나의 모임관리 잡다한거 요청");
		return dao.myGroupEtcD(loginId,dojang_no);
	}

	public ArrayList<LeaderDTO> dojangMember(String dojang_no) {
		return dao.dojangMember(dojang_no);
	}

	public boolean memberGetOutD(HashMap<String, String> params) {
		logger.info("도장깨기 회원 추방 서비스 도착");
		boolean success = false;
		int row = dao.memberGetOutD(params);
		if (row>0) {
			success=true;
		}
		return success;
	}

	



}
