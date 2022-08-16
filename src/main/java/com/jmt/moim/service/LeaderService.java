package com.jmt.moim.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmt.groupreview.dto.GroupReviewDTO;
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

}
