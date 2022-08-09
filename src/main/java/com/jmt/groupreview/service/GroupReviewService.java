package com.jmt.groupreview.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmt.groupreview.dao.GroupReviewDAO;
import com.jmt.groupreview.dto.GroupReviewDTO;

@Service
public class GroupReviewService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired GroupReviewDAO dao;

	public HashMap<String, Object> groupReviewList(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> param = new HashMap<String, Object>();
		//cnt : 리스트 갯수, page : 보여줄 페이지 수
		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		logger.info("보여줄 페이지 : "+page);
		
		//받아온 검색 조건
		String groupSort = params.get("groupSort");
		String searchCate = params.get("searchCate");
		String keyword = params.get("keyword");
		
		HashMap<String, Object> searchResult = new HashMap<String, Object>();		
		searchResult.put("keyword", keyword);
		searchResult.put("searchCate", searchCate);
		searchResult.put("groupSort", groupSort);
		
		logger.info("keyword : "+keyword+"/"+"셀렉트박스 선택값 : "+searchCate);
		
		//총 갯수(allCnt) / 페이지당 보여줄 갯수(cnt) = 생성 가능한 페이지(pages)

		int allCnt = dao.allCount(searchResult);
		logger.info("allCnt : "+allCnt);
		int pages = allCnt % cnt > 0 ? (allCnt / cnt)+1 : (allCnt / cnt);
		logger.info("pages : "+pages);
		
		if(pages==0) {pages=1;}
		
		if(page > pages) { //5개씩 보는 마지막 페이지로 갔을 때, 15개씩 보는 걸로 바꿨을때 뜨는 에러 해결
			page = pages;
		}
		
		map.put("pages", pages); //만들 수 있는 최대 페이지 수
		map.put("currPage", page); //현재 페이지
		
		int offset = (page-1) * cnt;
		logger.info("offset,cnt : "+offset+","+cnt); //offset:게시글 시작번호
		
		
		searchResult.put("cnt", cnt);
		searchResult.put("offset", offset);
		
		ArrayList<GroupReviewDTO> groupReviewList = dao.groupReviewList(searchResult);

		map.put("groupReviewList", groupReviewList);
		
		return map;
	}

	public GroupReviewDTO groupReviewDetail(String groupReview_no) {
		return dao.groupReviewDetail(groupReview_no);
	}

}
