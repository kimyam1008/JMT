package com.jmt.main.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmt.main.dao.MainDAO;
import com.jmt.main.dto.MainDTO;

@Service
public class MainService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MainDAO dao;

	public ArrayList<MainDTO> lightDto() {
		logger.info("메인페이지 번개리스트 요청");
		return dao.lightDto();
	}

	public ArrayList<MainDTO> dojangDto() {
		logger.info("메인페이지 도장리스트 요청");
		return dao.dojangDto();
	}

	public ArrayList<MainDTO> resDto() {
		logger.info("메인페이지 맛집리스트 요청");
		return dao.resDto();
	}

	public ArrayList<MainDTO> grDto() {
		logger.info("메인페이지 모임후기 리스트 요청");
		return dao.grDto();
	}

}
