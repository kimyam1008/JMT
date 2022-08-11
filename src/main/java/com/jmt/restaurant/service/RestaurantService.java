package com.jmt.restaurant.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jmt.moim.dto.DojangDTO;
import com.jmt.restaurant.dao.RestaurantDAO;
import com.jmt.restaurant.dto.RestaurantDTO;

@Service
public class RestaurantService {
	
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  RestaurantDAO dao;
	
	
	public HashMap<String, Object> resList(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		logger.info("보여줄 페이지 :" + page);
		
		//검색조건
		String search = params.get("search");
		String foodname = params.get("foodname");
		String gender = params.get("gender");
		
		
		
		HashMap<String, Object> searchResult = new HashMap<String, Object>();
		
		searchResult.put("search", search);
		searchResult.put("foodname", foodname);
		searchResult.put("gender", gender);
		

		int allCnt = dao.allCount(searchResult);
		logger.info("allCnt : " + allCnt);
		
		int pages = allCnt % cnt > 0 ? (allCnt / cnt)+1 : (allCnt / cnt);
		logger.info("pages : " + pages);
		
		if(pages==0) {pages=1;}
		
		if(page>pages) {
			page = pages;
		}
		
		logger.info("pages : " + pages);
		map.put("pages", pages); //만들 수 있는 최대 페이지 수
		map.put("currPage", page); // 현재 페이지
		
		int offset = (page-1)*cnt; 
		logger.info("offset: " + offset);
		
		
		searchResult.put("cnt", cnt);
		searchResult.put("offset", offset);
		
		ArrayList<RestaurantDTO> list = dao.resList(searchResult);

		//dao.memberCOUNT(dojangNo);
		map.put("resList", list);

		return map;
	}
	
	
	//음식 카테고리
	public ArrayList<RestaurantDTO> foodname() {
		return dao.foodname();
	}
	
	
	// 음식점 상세보기
	public void resDetail(Model model, String restaurant_no) {
		
		logger.info("맛집 상세보기 서비스 요청 : " + restaurant_no);
		RestaurantDTO resDetail = dao.resDetail(restaurant_no);
	
		//ArrayList<RestaurantDTO> list = dao.photoList(restaurant_no); //photo 정보 가져옴
		model.addAttribute("resDetail",resDetail);
		//model.addAttribute("list",list);
		//logger.info("photo:" + list);
		
	}

	
	// 음식점 수정요청
	public ModelAndView restaurantWrite(HashMap<String, String> params, HttpSession session) {
		String page = "redirect:/resDetail.do?restaurant_no=restaurant_no";
		
		
		RestaurantDTO dto = new RestaurantDTO();
		logger.info(params.get("restaurant_no"));
		//dto.getIdx(params.get(idx));
		dto.setMember_id(params.get("loginId"));
		dto.setRestaurantUpdate_reason(params.get("setRestaurantUpdate_reason"));
		dao.restaurantWrite(dto);
		

		
		return new ModelAndView(page);
	}
	

	
	public String reviewWrite(MultipartFile[] photos, HashMap<String, String> params) {
		
		String page = "redirect:/resDetail.do?restaurant_no=restaurant_no";

		RestaurantDTO dto = new RestaurantDTO(); 
		
		
		logger.info("서비스 확인 : " + params);
		
		
		dto.setMember_id(params.get("loginId"));
		dto.setComment_content(params.get("Comment_content"));
		dto.setIdx(Integer.parseInt(params.get("idx")));
		//dto.setIdx(Integer.parseInt(params.get(idx)));
		//dto.setIdx(params.get(idx));
		
		// 리뷰 성공여부 확인
		int row = dao.reviewWrite(dto);
		logger.info(row + "개의 리뷰 작성 성공");
		
		// 실행 후 Parameter 에 담긴 claim_id 추출
		int getComment_no = dto.getComment_no();
		logger.info("방금 넣은 글 번호 : " + getComment_no);
		logger.info("photos : " + photos);
		
		// 파일을 올리지 않아도 fileSave 가 진행되는 것을 방지하는 조건문
		
		if(row > 0) {
			reviewFileSave(photos, getComment_no, 8);
		}
		
		return page;
	}
	
	public void reviewFileSave(MultipartFile[] photos, int idx, int class_noID) {
		
		
		int class_no = class_noID;
		
		// 이미지 파일 업로드
		for (MultipartFile photo : photos) {
			String photo_oriFileName = photo.getOriginalFilename();
			
			// 이미지 파일을 업로드 안했을 때를 제외하기 위한 조건문 처리
			if(!photo_oriFileName.equals("")) {
				logger.info("업로드 진행");
				// 확장자 추출
				String ext = photo_oriFileName.substring(photo_oriFileName.lastIndexOf(".")).toLowerCase();
				// 새 파일 이름으로 업로드 당시 시간을 붙인다.
				String photo_newFileName = System.currentTimeMillis() + ext;
				
				logger.info(photo_oriFileName + " ===> " + photo_newFileName);
				
				try {
					byte[] arr = photo.getBytes();
					Path path = Paths.get("/Users/moon/Documents/SPRING_ADVANCE/JMT4/src/main/webapp/resources/photo/review/" + photo_newFileName);
					// 같은이름의 파일이 나올 수 없기 떄문에 옵션 설정 안해도된다.
					Files.write(path, arr);
					logger.info(photo_newFileName + " SAVE OK");
					// 4. 업로드 후 photo 테이블에 데이터 입력
					dao.reviewFileWrite(photo_oriFileName,photo_newFileName,idx,class_no);
					
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
	}


	public ArrayList<RestaurantDTO> photoList(Model model, String restaurant_no) {
		return dao.photoList(restaurant_no);
	}


	public ArrayList<RestaurantDTO> resCommet(Model model, String restaurant_no) {
		return dao.resCommet(restaurant_no);
	}


	public ArrayList<RestaurantDTO> lightninglist(Model model, String restaurant_no) {
		return dao.lightninglist(restaurant_no);
	}


	


	

	
	

//	public void detail(Model model, HashMap<String, String> params) {
//		
//		ArrayList<RestaurantDTO> list = dao.photoList(params); //photo 정보 가져옴
//		model.addAttribute("res", list);
//		logger.info("photo:"+list);		
//	}







	
	
	



	


	

	


	

}
