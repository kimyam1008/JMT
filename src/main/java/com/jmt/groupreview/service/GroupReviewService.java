package com.jmt.groupreview.service;

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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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

	public GroupReviewDTO groupReviewDetail(String groupReview_no, String loginId) {
		/*(String groupReview_no, String idx)*/
		logger.info("상세보기 서비스 도착");
		//ArrayList<GroupReviewDTO> grPhotoList = dao.grPhotoList(idx);
		//mav.addObject("grPhotoList",grPhotoList);
		return dao.groupReviewDetail(groupReview_no,loginId);
	}

	public ModelAndView fileUpload(MultipartFile file, HttpSession session) {
		ModelAndView mav = new ModelAndView("./GroupReview/grFileUploadForm");
		logger.info("파일 업로드 팝업 도착");
		
		//1. 파일명 추출
		String fileName = file.getOriginalFilename();
		
		//2. 신규파일명 생성
		String ext = fileName.substring(fileName.lastIndexOf(".")); //확장자 받아오기
		String newFileName = System.currentTimeMillis()+ext;
		
		try {
			//3. 파일 받아오기
			byte[] bytes = file.getBytes();
			
			//4. 파일 저장(java nio 사용)
			Path filePath = Paths.get("C:/STUDY/SPRING_ADVANCE/JMT4/src/main/webapp/resources/photo/review/"+newFileName);
			Files.write(filePath, bytes);
			
			//5. DB에 저장(아직 저장 안했으니 세션에 임시저장)
			HashMap<String, String> map = (HashMap<String, String>) session.getAttribute("fileList");
			if(map==null) {
				map = new HashMap<String, String>();
			}
			
			map.put(newFileName, fileName);
			logger.info("업로드 된 파일 수 : "+map.size());
			session.setAttribute("fileList",map);
			
			//6. 이미지 url 전달
			mav.addObject("path", "/photo/"+newFileName);
			
			//Servers > server.xml 가서 photo 경로 추가!!
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mav;
	}

	public HashMap<String, Object> grFileDelete(String fileName, HttpSession session) {
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
		File file = new File("C:/STUDY/SPRING_ADVANCE/JMT4/src/main/webapp/resources/photo/review/"+fileName);
		boolean success = false;
		if(file.exists()) {
			success = file.delete();
		}
		return success;
	}
	
	@Transactional
	public ModelAndView groupReviewRegister(HashMap<String, String> params, HttpSession session, String loginId) {
		String page = "redirect:/grRegisterForm.go";
		
		//1. 글 저장 작업
		GroupReviewDTO dto = new GroupReviewDTO();
		dto.setReview_title(params.get("review_title"));
		dto.setIdx(Integer.parseInt(params.get("idx")));
		dto.setMember_id(params.get("member_id"));
		dto.setReview_content(params.get("review_content"));
		dto.setClass_no(Integer.parseInt(params.get("class_no")));
		dao.groupReviewRegister(dto);
		
		//2. 글 저장 후 groupReview_no 추출
		int groupReview_no = dto.getGroupReview_no();
		int idx = dto.getIdx();
		int class_no = dto.getClass_no();
		if(class_no > 0) {
			page = "redirect:/groupReviewDetail.do?groupReview_no="+groupReview_no;
			//3.class_no로 파일 DB에 저장
			HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
			if (fileList != null) { //사진이 있을 경우 아래 코드 실행
				
				for (String newFileName : fileList.keySet()) {
					dao.grFileWrite(newFileName, fileList.get(newFileName), class_no, idx);
				}
				//4. session 에서 fileList 삭제
				session.removeAttribute("fileList");
				
			}
		}
		
		return new ModelAndView(page);
	}

	public ArrayList<GroupReviewDTO> groupList(String loginId) {
		logger.info("도장리스트 호출 서비스 도착");
		return dao.groupList(loginId);
	}

	public ArrayList<GroupReviewDTO> lightGroupList(String loginId) {
		logger.info("번개리스트 호출 서비스 도착");
		return dao.lightGroupList(loginId);
	}
	
	public boolean grReviewReport(HashMap<String, String> params) {
		logger.info("모임후기 신고하기 서비스 도착 : " + params);
		
		boolean success = false;
		int row = dao.grReviewReport(params);
		if(row>0) {
			success = true;
		}
		return success;
	}

	public void groupReviewDelete(HashMap<String, String> params) {
		logger.info("삭제(숨김) 서비스 도착");
		int row = dao.groupReviewDelete(params);
	}

	@Transactional
	public ModelAndView groupReviewUpdate(HashMap<String, String> params, HttpSession session, String loginId) {
		logger.info("params : {}",params);
		
		GroupReviewDTO dto = new GroupReviewDTO();
		//int groupReview_no = dto.getGroupReview_no();
		
		dto.setGroupReview_no(Integer.parseInt(params.get("groupReview_no")));
		dto.setReview_title(params.get("review_title"));
		dto.setIdx(Integer.parseInt(params.get("idx")));
		dto.setReview_content(params.get("review_content"));
		dto.setClass_no(Integer.parseInt(params.get("class_no")));
		
		logger.info("모임후기 글번호 : "+params.get("groupReview_no"));
		System.out.println("모임후기 글번호 : "+params.get("groupReview_no"));
		String page = "redirect:/groupReviewDetail.do?groupReview_no="+params.get("groupReview_no");
		
		dao.groupReviewUpdate(dto);
		
		int row = dao.groupReviewUpdate(params);
		logger.info("수정된 데이터 수 : "+row);
		
		//2. 글 저장 후 groupReview_no 추출
		//int groupReview_no = dto.getGroupReview_no();
		int idx = dto.getIdx();
		int class_no = dto.getClass_no();
		if(class_no > 0) {
			page = "redirect:/groupReviewDetail.do?groupReview_no="+params.get("groupReview_no");
			//3.class_no로 파일 DB에 저장
			HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
			if (fileList != null) { //사진이 있을 경우 아래 코드 실행
				
				for (String newFileName : fileList.keySet()) {
					dao.grFileWrite(newFileName, fileList.get(newFileName), class_no, idx);
				}
				//4. session 에서 fileList 삭제
				session.removeAttribute("fileList");
				
			}
		}
		
		return new ModelAndView(page);
	}

	public boolean grCmtReport(HashMap<String, String> params) {
		logger.info("모임후기 댓글 신고하기 서비스 : " + params);
		
		boolean success = false;
		int row = dao.grCmtReport(params);
		if(row>0) {
			success = true;
		}
		return success;
	}
	
	
	
}
