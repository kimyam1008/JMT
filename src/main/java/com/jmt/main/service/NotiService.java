package com.jmt.main.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmt.main.dao.NotiDAO;

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



}
