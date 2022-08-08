package com.jmt.moim.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmt.moim.dao.DojangDAO;
import com.jmt.moim.dto.DojangDTO;

@Service
public class DojangService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  DojangDAO dao;

	public HashMap<String, Object> dojangList(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		logger.info("보여줄 페이지 :" + page);
		

		int allCnt = dao.allCount();
		logger.info("allCnt : " + allCnt);
		
		int pages = allCnt % cnt > 0 ? (allCnt / cnt)+1 : (allCnt / cnt);
		logger.info("pages : " + pages);
		
		if(page>pages) {
			page = pages;
		}
		
		logger.info("pages : " + pages);
		map.put("pages", pages); //만들 수 있는 최대 페이지 수
		map.put("currPage", page); // 현재 페이지
		
		int offset = (page-1)*cnt; 
		logger.info("offset: " + offset);
		
		ArrayList<DojangDTO> list = dao.dojangList(cnt, offset);

		//dao.memberCOUNT(dojangNo);
		map.put("dojangList", list);

		return map;
	}

	public ArrayList<DojangDTO> foodname() {
		return dao.foodname();
	}



}
