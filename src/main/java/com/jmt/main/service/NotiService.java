package com.jmt.main.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmt.main.dao.NotiDAO;
import com.jmt.main.dto.NotiDTO;

@Service
public class NotiService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired NotiDAO dao;

	public boolean notiChk(String loginId) {
		logger.info("NOTI TEST 알람테스트트트트트" );
		int row = dao.notiChk(loginId);
		boolean success = false;
		if(row>0) {
			success = true;
		}
		return success;
	}

	public ArrayList<NotiDTO> notiList(String loginId) {
		logger.info("알림 리스트 서비스");
		return dao.notiList(loginId);
	}



}
