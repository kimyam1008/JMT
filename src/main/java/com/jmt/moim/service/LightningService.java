package com.jmt.moim.service;

import java.util.ArrayList;

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

}
