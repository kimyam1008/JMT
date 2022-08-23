package com.jmt.restaurant.service;

import java.io.File;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public void resDetail(Model model, int restaurant_no) {
		
		logger.info("맛집 상세보기 서비스 요청 : " + restaurant_no);
		RestaurantDTO resDetail = dao.resDetail(restaurant_no);
		model.addAttribute("resDetail",resDetail);
		
	}

	
	// 음식점 수정요청
	public ModelAndView restaurantWrite(HashMap<String, String> params, HttpSession session) {
		String idx = params.get("idx");
		String page = "redirect:/resDetail.do?restaurant_no="+idx;		
		
		RestaurantDTO dto = new RestaurantDTO();
		logger.info(params.get("restaurant_no"));
		//dto.getIdx(params.get(idx));
		dto.setRestaurant_no(Integer.parseInt(params.get("restaurant_no")));
		dto.setMember_id(params.get("member_id"));
		dto.setRestaurantUpdate_reason(params.get("restaurantUpdate_reason"));
		dao.restaurantWrite(dto);
		

		
		return new ModelAndView(page);
	}
	

	
	public String reviewWrite(MultipartFile[] photos, HashMap<String, String> params) {
		
		String idx = params.get("idx");
		String page = "redirect:/resDetail.do?restaurant_no="+idx;

		RestaurantDTO dto = new RestaurantDTO(); 
		
		
		logger.info("서비스 확인 : " + params);
		
		
		dto.setMember_id(params.get("loginId"));
		dto.setComment_content(params.get("Comment_content"));
		dto.setIdx(Integer.parseInt(params.get("idx")));
		
		
		// 리뷰 성공여부 확인
		int row = dao.reviewWrite(dto);
		logger.info(row + "개의 리뷰 작성 성공");
		
		// 실행 후 Parameter 에 담긴 review_id 추출
		int getComment_no = dto.getComment_no();
		logger.info("방금 넣은 글 번호 : " + getComment_no);
		logger.info("photos : " + photos);
		
		// 파일을 올리지 않아도 fileSave 가 진행되는 것을 방지하는 조건문
		
		if(row > 0) {
			reviewFileSave(photos, getComment_no, 8);
			
		}
		
		return page;
	}
	
	//사진저장
	public void reviewFileSave(MultipartFile[] photos, int idx, int class_noID) {
		
		RestaurantDTO dto = new RestaurantDTO();
		
		int comment_no = dto.getComment_no();
		logger.info(" : " +comment_no);
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
					Path path = Paths.get("C:/STUDY/SPRING_ADVANCE/JMT4/src/main/webapp/resources/photo/review/" + photo_newFileName);
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
	
	public String reviewReLoad(MultipartFile[] photos, HashMap<String, String> params) {
		String idx = params.get("restaurant_no");
		String page = "redirect:/resDetail.do?restaurant_no="+idx;

		RestaurantDTO dto = new RestaurantDTO(); 
		
		
		logger.info("서비스 확인 : " + params);
		
		
		dto.setMember_id(params.get("loginId"));
		dto.setComment_content(params.get("comment_content"));
		dto.setIdx(Integer.parseInt(params.get("idx")));
		//dto.setComment_no(Integer.parseInt(params.get("comment_no")));
		
		
		// 리뷰 수정 성공여부 확인
		int row = dao.reviewReLoad(dto);
		logger.info(row + "리뷰 수정 성공여부");
		
		// 실행 후 Parameter 에 담긴 review_id 추출
		int getComment_no = Integer.parseInt(params.get("idx"));
		logger.info("수정 글 번호 : " + getComment_no);
		logger.info("photos : " + photos);
		
		// 파일을 올리지 않아도 fileSave 가 진행되는 것을 방지하는 조건문
		
		if(row > 0) {
			reviewFileSave(photos, getComment_no, 8);
		}
		
		return page;
	}


	public ArrayList<RestaurantDTO> photoList(Model model, int restaurant_no) {
		return dao.photoList(restaurant_no);
	}


	public ArrayList<RestaurantDTO> resCommet(String loginId, int restaurant_no) {
		return dao.resCommet(loginId,restaurant_no);
	}


	public ArrayList<RestaurantDTO> lightninglist(Model model, int restaurant_no) {
		return dao.lightninglist(restaurant_no);
	}


	public boolean commentDel(HashMap<String, String> params) {
		boolean success = false;
		int row = dao.commentDel(params);
		if(row>0) {
			success = true;
		}
		
		return success;
	}


	public ArrayList<RestaurantDTO> photoDel(HashMap<String, String> params) {
		return dao.photoDel(params);
		
		
	}


	public RestaurantDTO reviewUpdate(Model model, String comment_no) {
		return dao.reviewUpdate(comment_no);
	}


	public ArrayList<RestaurantDTO> reviewPhoto(Model model, String comment_no) {
		return dao.reviewPhoto(comment_no);
	}


	public HashMap<String, String> reviewDel(HashMap<String, String> params) {
		 
		
		ArrayList<RestaurantDTO> photoDelList = dao.photoDelList(params);
		logger.info(photoDelList+" 번 게시물에 업로드된 사진 수 "+photoDelList.size());
		
		//bbs 테이블의 데이터 삭제(이때 photo 도 자동으로 지워진다.)
		if(dao.reviewDel(params)>0) {
			//성공하면 사진도 삭제
			for (RestaurantDTO photo : photoDelList) {
				File f = new File("C:/STUDY/SPRING_ADVANCE/JMT4/src/main/webapp/resources/photo/review/" +photo.getPhoto_newFileName());
				if(f.exists()) {
					boolean success = f.delete();
					logger.info(photo.getPhoto_newFileName()+"삭제 여부 : "+success);
				}
				
			}
		}
		return null;
		
		
		
	}


	public boolean like(HashMap<String, String> params) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		 boolean success = false;
		
		RestaurantDTO dto = new RestaurantDTO();
		dto.setMember_id(params.get("loginId"));
		
		if(dao.like(params) > 0) {
			success = true;
		}
		
		result.put("success", success);
		
		return success;
	}


	public void likeDel(HashMap<String, String> params) {	
		 int likeDel = dao.likeDel(params);
	}


	public HashMap<String, Object> resUpdateList(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		logger.info("보여줄 페이지 :" + page);
		
		//검색조건
		String search = params.get("search");
		String foodname = params.get("foodname");
		String gender = params.get("gender");
		String list_option =params.get("list_option");
		
		
		HashMap<String, Object> searchResult = new HashMap<String, Object>();
		searchResult.put("list_option", list_option);
		
		searchResult.put("search", search);
		searchResult.put("foodname", foodname);
		searchResult.put("gender", gender);
		

		int allCnt = dao.allCount2(searchResult);
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
		
		ArrayList<RestaurantDTO> list = dao.resUpdateList(searchResult);

		//dao.memberCOUNT(dojangNo);
		map.put("resUpdateList", list);

		return map;
	}


	public RestaurantDTO requestNO(int restaurant_no) {
		return dao.requestNO(restaurant_no);
	}


	public RestaurantDTO restuarantUpdateNo(int restuarantUpdate_no) {
		return dao.restuarantUpdateNo(restuarantUpdate_no);
	}


	public String resAdminUpdate(HashMap<String, String> params, RedirectAttributes ra) {
		String idx = params.get("restaurant_no");
		String idx2 = params.get("restuarantUpdate_no");
		
		String page = "redirect:/resAdminUpdate.go?restaurant_no="+idx+"&restuarantUpdate_no="+idx2;
		RestaurantDTO dto = new RestaurantDTO();
		String msg = "수정이 완료 되었습니다.";
		
		dto.setRestaurant_name(params.get("restaurant_name"));
		dto.setRestaurant_address(params.get("restaurant_address"));
		dto.setRestaurant_info(params.get("restaurant_info"));
		dto.setRestaurant_call(params.get("restaurant_call"));
		dto.setRestaurant_no(Integer.parseInt(params.get("restaurant_no")));
		int a = dao.resAdminUpdate(dto);
		if(a > 0 ) {
			ra.addFlashAttribute("msg", msg);
		}
		return page;
	}


	public String Reporthandling(HashMap<String, String> params, RedirectAttributes ra) {
		
		String idx = params.get("restaurant_no");
		String idx2 = params.get("restuarantUpdate_no");
		
		String page = "redirect:/resAdminUpdate.go?restaurant_no="+idx+"&restuarantUpdate_no="+idx2;
		String msg = "수정이 완료 되었습니다.";
		
		RestaurantDTO dto = new RestaurantDTO();
		dto.setRestaurantUpdate_proc_status(params.get("restaurantUpdate_proc_status"));
		dto.setRestuarantUpdate_no(Integer.parseInt(params.get("restuarantUpdate_no")));
		int a = dao.Reporthandling(dto);
		if(a > 0) {
			ra.addFlashAttribute("msg", msg);
		}
		
		return page;
	}


	public ArrayList<HashMap<String, String>> CommentPhoto(int comment_no) {
		logger.info("번호확인:::" + comment_no);
		return dao.CommentPhoto(comment_no);
	}
	
	/*
	public HashMap<String, String> commentPhotoDel(HashMap<String, String> params) {
		return dao.commentPhotoDel(params);
	}
*/

	public ArrayList<HashMap<String, String>> CommentLike(int comment_no) {
		return dao.CommentLike(comment_no);
	}


	public void commentList(Model model, int comment_no) {
		RestaurantDTO commentList = dao.commentList(comment_no);
		model.addAttribute("comment_no",comment_no);
		
	}


	public boolean resCmtReport(HashMap<String, String> params) {
		logger.info("번개모임 댓글 신고하기 서비스 : " + params);
		
		boolean success = false;
		int row = dao.resCmtReport(params);
		if(row>0) {
			success = true;
		}
		return success;
	}


//	public ArrayList<HashMap<String, String>> memberPhoto(String member_id) {
//		return dao.memberPhoto(member_id);
//	}


	



	
	




	


	


	


	

	
	







	
	
	



	


	

	


	

}
