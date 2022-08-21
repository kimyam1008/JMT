package com.jmt.moim.service;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jmt.moim.dao.DojangDAO;
import com.jmt.moim.dto.DojangDTO;

@Service
public class DojangService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  DojangDAO dao;

	public HashMap<String, Object> dojangList(HashMap<String, String> params, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		logger.info("보여줄 페이지 :" + page);
		
		//검색조건
		String search = params.get("search");
		String foodname = params.get("foodname");
		String eat_speed = params.get("eat_speed");
		String job = params.get("job");
		String gender = params.get("gender");
		
		
		
		HashMap<String, Object> searchResult = new HashMap<String, Object>();
		
		searchResult.put("search", search);
		searchResult.put("foodname", foodname);
		searchResult.put("eat_speed", eat_speed);
		searchResult.put("job", job);
		searchResult.put("gender", gender);
		searchResult.put("loginId", session.getAttribute("loginId"));
		
		//logger.info("확인:::"+session.getAttribute("loginId"));
		

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
		
		ArrayList<DojangDTO> list = dao.dojangList(searchResult);

		map.put("dojangList", list);
		
		

		return map;
	}

	public ArrayList<DojangDTO> foodname() {
		return dao.foodname();
	}

	public ModelAndView dojangDetail(String dojang_no, String loginId) {
		logger.info("도장 상세보기");
		DojangDTO dojangDetail = dao.dojangDetail(dojang_no);
		ArrayList<DojangDTO> dojangGreview = dao.dojangGreview(dojang_no);
		
		//가입신청 관리
		DojangDTO applyStatus = dao.applyStatus(loginId,dojang_no);
		logger.info("data:::"+loginId+","+dojang_no);
		//logger.info("상태"+applyStatus.getStatus());
		
		
		
		String leader = dao.reported(dojang_no);
		logger.info("리더"+leader);
		
		ModelAndView mav = new ModelAndView();
		
		
		//"redirect:/detail.do?idx="+params.get("idx");
		
		/*
		if(leader == null || status.equals("승인")) {
			mav.setViewName("redirect:/dojangHome.do?dojang_no="+dojang_no);
		}else {
		*/
		
		//가입신청 프로필조건
		DojangDTO profileStatus = dao.profileStatus(loginId);
		
		mav.setViewName("./Dojang/dojangDetail");
		mav.addObject("dojangDetail",dojangDetail);
		mav.addObject("dojangGreview",dojangGreview);
		mav.addObject("applyStatus",applyStatus);
		mav.addObject("profileStatus",profileStatus);
		
		//}
		
		return mav;
	}

	public boolean dojangApply(String dojang_no, String loginId) {
		
		HashMap<String, Object> result=new HashMap<String, Object>();
		logger.info("확인:::"+dojang_no);
		
		int row = dao.dojangApply(dojang_no,loginId);
		
		boolean success = false;
		
		if(row >0) {
			success = true;
		}
		
		result.put("success", success);
		return success;
		
		
		
	}


	public boolean dojangReg(HashMap<String, String> params) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		boolean success = false;
		
		if(dao.dojangReg(params)>0) {
			success = true;
		}
		
		result.put("success", success);
		return success;
	}

	public boolean dojangReport(HashMap<String, String> params) {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		boolean success = false;
		
		if(dao.dojangReport(params)>0) {
			success = true;
		}
		
		result.put("success", success);
		return success;
	
	}

	public String reported(String dojang_no) {
		return dao.reported(dojang_no);
	}



	public ArrayList<DojangDTO> dojangHome(HashMap<String, Object> post) {
		return dao.dojangHome(post);
	}

	public ArrayList<DojangDTO> dojangHomeMember(String dojang_no) {
		
		return dao.dojangHomeMember(dojang_no);
	}

	public ArrayList<DojangDTO> dojangHomeL(HashMap<String, Object> post) {
		return dao.dojangHomeL(post);
	}

	public ArrayList<DojangDTO> dojangHomeM(HashMap<String, Object> post) {
		return dao.dojangHomeM(post);
	}

	public DojangDTO dojangHomeDetail(String dojangPost_no) {
		return dao.dojangHomeDetail(dojangPost_no);
	}

	public int allCountHome(HashMap<String, String> params) {
		return dao.allCountHome(params);
	}

	public int allCountHomeL(HashMap<String, String> params) {
		return dao.allCountHomeL(params);
	}

	public int allCountHomeM(HashMap<String, String> params) {
		return dao.allCountHomeM(params);
	}

	public ModelAndView fileUpload(MultipartFile file, HttpSession session) {
		
		ModelAndView mav = new ModelAndView("./Dojang/gpFileUploadForm");
		
		//1.파일명 추출
		String fileName = file.getOriginalFilename();
		
		//2. 신규파일명 생성
		String ext = fileName.substring(fileName.lastIndexOf("."));
		String newFileName = System.currentTimeMillis()+ext;
		
		
		try {
			byte[] bytes = file.getBytes();//3. 파일 받아오기
			//4. 파일 저장(java nio 사용)
			Path filePath = Paths.get("C:/STUDY/SPRING_ADVANCE/JMT4/src/main/webapp/resources/photo/review/" + newFileName);
			Files.write(filePath, bytes);
			//5. DB에 저장(불가능 하다 - 아직 글을 쓰지도 않았으니까)
			//그래서 세션에 임시 저장 한다.
			
			HashMap<String, String> map = (HashMap<String, String>) session.getAttribute("fileList");
			if(map == null) {
				map = new HashMap<String, String>();
			}
			
			map.put(newFileName, fileName);
			logger.info("업로드 된 파일 수 : "+map.size());
			session.setAttribute("fileList", map);
			
			//6. 이미지 url 전달
			mav.addObject("path", "/photo/" + newFileName);
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return mav;
	}
	

	public boolean dojangPostReg(HashMap<String, String> params, HttpSession session) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		System.out.println("도장번호 확인..."+params.get("dojang_no"));
		System.out.println("작성자 확인..."+params.get("member_id"));
		System.out.println("도장제목 확인..."+params.get("dojangPost_subject"));
		System.out.println("도장내용 확인..."+params.get("dojangPost_content"));
		//1. 게시글 저장 작업
		DojangDTO dto = new DojangDTO();
		dto.setDojangPost_subject(params.get("dojangPost_subject"));
		dto.setDojangPost_content(params.get("dojangPost_content"));
		dto.setDojang_no(Integer.parseInt(params.get("dojang_no")));
		dto.setRestaurant_no(params.get("restaurant_no"));
		dto.setMember_id(params.get("member_id"));
		dto.setDojangPost_type(params.get("dojangPost_type"));
		
		
		int dojangPost_no = dto.getDojangPost_no();
		int idx = dto.getIdx();
		int class_no = dto.getClass_no();
		
		boolean success = true;
		
		
			
		dao.dojangPostReg(dto);
		
		
		if(dojangPost_no >0) {
			
			//3. idx로 파일 디비 저장
			HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
			if (fileList != null) {
			for (String newFileName : fileList.keySet()) {
				dao.filewrite(newFileName, fileList.get(newFileName),dojangPost_no);
			}
			
			//4. session 에서 fileList 삭제
			session.removeAttribute("fileList");

			}
		}
		
		result.put("success", success);
		return success;
	}

	public HashMap<String, Object> gpFileDelete(String fileName, HttpSession session) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		//파일 삭제 성공시
		boolean success = delFile(fileName);
		if (success) {
			HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
			fileList.remove(fileName);
			logger.info("삭제 후 남은 파일 수 : "+fileList.size());
			session.setAttribute("fileList", fileList);
		}
		result.put("success", success);
		return result;
	}

	private boolean delFile(String fileName) {
		File file = new File("C:/upload/"+fileName);
		boolean success = false;
		if(file.exists()) {
			success = file.delete();
		}
		return success;
	}

	

	public ArrayList<DojangDTO> gpRestaurantSearchList(String gpSearchCondition, String searchContent) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("gpSearchCondition", gpSearchCondition);
		map.put("searchContent", searchContent);
		
			
		return dao.gpRestaurantSearchList(map);
	}

	public boolean dojangPostUpdate(HashMap<String, String> params) {
		boolean success =false;
		System.out.println("업데이트 데이터::{}"+params);
		int row = dao.dojangPostUpdate(params);
		  
		  if (row > 0) { success = true; }
		  logger.info("update success : " + success);
		  
		  return success; 
	}

	public String postReported(String dojangPost_no) {
		return dao.postReported(dojangPost_no);
	}

	public boolean dojangPostReport(HashMap<String, String> params) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		boolean success = false;
		
		if(dao.dojangPostReport(params)>0) {
			success = true;
		}
		
		result.put("success", success);
		return success;
	}

	public boolean dojangPostDelete(String dojangPost_no) {
		boolean success = true;
		int row = dao.dojangPostDelete(dojangPost_no);
		logger.info("뭐가문제니?::"+dojangPost_no+":"+row);

		return success;
		
	}

	public String dojangHomeMstatus(String dojang_no, String loginId) {
		return dao.dojangHomeMstatus(dojang_no,loginId);
	}

	public boolean Mstatus(String dojang_no, String loginId) {
		boolean success = false;
		int row = dao.Mstatus(dojang_no,loginId);
		
		if(row>0) {
			success = true;
		}
		logger.info("탈퇴확인::"+row);
		return success;
	}
	
	
	public boolean dojangCmtReport(HashMap<String, String> params) {
		logger.info("모임후기 댓글 신고하기 서비스 : " + params);
		
		boolean success = false;
		int row = dao.dojangCmtReport(params);
		if(row>0) {
			success = true;
		}
		return success;
	}

	public String dojangTitle(String dojang_no) {

		return dao.dojangTitle(dojang_no);
	}
	

	


}
