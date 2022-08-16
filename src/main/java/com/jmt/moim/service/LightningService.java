package com.jmt.moim.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmt.moim.dao.LightningDAO;
import com.jmt.moim.dto.LightningDTO;

@Service
public class LightningService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  LightningDAO dao;

	public ArrayList<LightningDTO> foodList() {
		logger.info("음식카테고리 가져오기 서비스");
		return dao.foodList();
	}
	
	/*
	public ArrayList<LightningDTO> list() {
		logger.info("전체리스트 서비스 요청");
		return dao.list();
	}
	*/

	public ArrayList<LightningDTO> selectedList(HashMap<String, Object> selectedparams) {
		logger.info("검색필터 옵션 리스트 요청");
		return dao.selectedList(selectedparams);
	}

	public int allCount(HashMap<String, Object> selectedparams) {
		logger.info("총개수 서비스 요청");
		return dao.allCount(selectedparams);
	}

	
	public void changeStatus() {
		dao.changeStatus();
		logger.info("업데이트완료");
	}


	public LightningDTO detail(String lightning_no, String loginId) {
		logger.info("상세보기 서비스 요청");
		return dao.detail(lightning_no,loginId);
	}


	public int register(String loginId,String lightning_no) {
		logger.info("번개 모임 신청 서비스");
		return dao.register(loginId,lightning_no);
	}

	public void dropout(String loginId, String lightning_no) {
		logger.info("탈퇴 서비스 요청");
		dao.dropout(loginId,lightning_no);
	}

	public LightningDTO profile(String loginId) {
		logger.info("회원 프로필 정보 가져오기");
		return dao.profile(loginId);
	}

	public boolean report(HashMap<String, String> params) {
		logger.info("번개모임 신고하기 서비스 : " + params);
		
		boolean success = false;
		int row = dao.report(params);
		if(row>0) {
			success = true;
		}
		return success;
	}

	public boolean cmtReport(HashMap<String, String> params) {
		logger.info("번개모임 댓글 신고하기 서비스 : " + params);
		
		boolean success = false;
		int row = dao.cmtReport(params);
		if(row>0) {
			success = true;
		}
		return success;
	}
	
	
	
	public void delete(String lightning_no) {
		logger.info("번개 모임 게시글 삭제 서비스");
		dao.delete(lightning_no);
	}

	
	public void cmtDel(String lightning_no) {
		logger.info("번개 모임 게시글 삭제시 댓글 삭제 서비스 ");
		dao.cmtDel(lightning_no);
		
	}

	public boolean profileChk(String loginId) {
		logger.info("번개모임 생성시 프로필 유무 체크 서비스");
		boolean profileChk = false;
		int row =dao.profileChk(loginId);
		if(row>0) {
			profileChk = true;
		}
		return profileChk;
	}

	public ArrayList<LightningDTO> resList(HashMap<String, String> param) {
		logger.info("레스토랑 리스트 가져오기 서비스");
		return dao.resList(param);
	}

	public void lightCreate(HashMap<String, String> params) {
		logger.info("번개 모임 생성 서비스");
		dao.lightCreate(params);
	}


	public void Delnoti(String lightning_no) {
		logger.info("알림 서비스 요청");
		dao.Delnoti(lightning_no);
		
	}

	
	
}
