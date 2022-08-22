package com.jmt.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.jmt.admin.dao.ReportDAO;
import com.jmt.admin.dto.ReportDTO;
import com.jmt.admin.dto.ReportPostDto;
import com.jmt.admin.dto.TestDto;

@Service
public class ReportService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired ReportDAO dao;

	public HashMap<String, Object> reportList(HashMap<String, String> params) {
		
		
	HashMap<String, Object> map = new HashMap<String, Object>(); 
		
		int cnt =Integer.parseInt(params.get("cnt"));  
		int page =Integer.parseInt(params.get("page"));
		String keyword = params.get("keyword");
		String report_status = params.get("report_status");
		String report_sort = params.get("report_sort");
		
		Map<String, Object> data = new HashMap<String, Object>(); 
		data.put("keyword", keyword);
		data.put("report_status", report_status);
		data.put("report_sort", report_sort);
		
		logger.info("보여줄 페이지:"+page);
		
		// 총 게시글 갯수 (allCnt)/ 페이지당 보여줄 갯수 (cnt) = 생성 가능한 페이지 (pages).
		int allCnt = dao.allCount(data);
		logger.info("총 allCnt:"+allCnt); // 총 페이지 수 
		int pages = allCnt%cnt>0 ? (allCnt/cnt)+1 :(allCnt/cnt);  // 현재 만들 수 있는 최대 페이지 수 
		if(pages==0) {pages=1;}
		if(page>pages) {  // 페이지 바뀌는 경우 . 현재 페이지 가 
			page=pages;
		}
		logger.info("pages"+pages);
		
		map.put("pages", pages);// 만들 수 있는 최대 페이지 수 
		map.put("currPage",page); // 현재 페이지
		/* currPage>pages? : page */
		int offset =(page-1)*cnt;
		logger.info("offset:"+offset);
	//	ArrayList<HashMap<String, Object>> list =dao.reportList(cnt,offset);
		data.put("cnt", cnt);
		data.put("offset", offset);
	ArrayList<ReportDTO> list =dao.reportList(data);
	
	
		//ArrayList<HashMap<String, Object>> list = dao.reportList();
		map.put("list", list);
		return map;
	}

	public ReportDTO reportDetail(int report_no) {
		return dao.reportDetail(report_no);
	}

	
	// 신고 수정. 
	// 이슈 : 수정버튼 누를때 블라인드로 상태 변경 되면서 insert 	블라인드 되야함. 
	// 그리고 아마 같은 게시글들이 블라인드 되는 경우. 그 신고 게시판에서 동일 게시글 신고한 경우 그것들도 다 블라인드로 바껴야 한다.. ? 
	public int reportUpdate(Map<String, Object> data) {
		int result = 0; 
		int class_no=(int) data.get("class_no"); 
		System.out.println("클래스 넘버 확인 :"+ class_no);
		result = uPdateTypeChecker(data, result, class_no);
		
		
		return result;
	}

	private int uPdateTypeChecker(Map<String, Object> data, int result, int class_no) {
		if(class_no==1) {
			result= dao.reportUpdate1(data);
		}
		
		else if(class_no==2) {
			result= dao.reportUpdate2(data);
		}
		
		else if(class_no==3) {
			result= dao.reportUpdate3(data);
		}
		
		else if(class_no==4) {
			result= dao.reportUpdate4(data);
		}
		
		else if(class_no==5) { // 도장깨기 댓글
			result= dao.reportUpdate2(data);
		}
		
		else if(class_no==6) {// 모임 후기 
			result= dao.reportUpdate6(data);
		}
		
		else if(class_no==7) { // 모임후기 댓글 
			result= dao.reportUpdate2(data);
		}
		
		else if(class_no==8) { // 맛집리뷰 댓글 
			result= dao.reportUpdate2(data);
		}
		return result;
	}
	
	
	
	// 상세보기 내 신고 게시글 
	public ReportPostDto reportPost(Map<String, Object> data) {
		int class_no=(int) data.get("class_no");
		int idx = (int) data.get("idx");
		logger.info("class_no 정보 {} , idx 정보 {}",class_no,idx);
		ReportPostDto reportPost = null; 
		
		if(class_no==1) {
			 reportPost= dao.select_no1(idx);
		}
		
		else if(class_no==2) {
			 reportPost= dao.select_no2(idx);
		}
		
		else if(class_no==3) {
			 reportPost= dao.select_no3(idx);
		}
		
		else if(class_no==4) {
			reportPost= dao.select_no4(idx);
		}
		
		else if(class_no==5) { // 도장깨기 댓글
			reportPost= dao.select_no2(idx);
		}
		
		else if(class_no==6) {// 모임 후기 
			 reportPost= dao.select_no6(idx);
		}
		
		else if(class_no==7) { // 모임후기 댓글 
			reportPost= dao.select_no2(idx);
		}
		
		else if(class_no==8) { // 맛집리뷰 댓글 
			reportPost= dao.select_no2(idx);
		}
		
		return reportPost;
	}
	// 체크박스 블라인드 처리. 
	public int blind(ArrayList<String> blindPost) {
		int i=0; 
		for (String idx : blindPost) {
			i += dao.blind(idx);
		}
		
		return i;
	}
	
	// 블라인드 리스트 .. 
	public Map<String, Object> blindList(HashMap<String, String> params) {
		int cnt =Integer.parseInt(params.get("cnt"));  
		int page =Integer.parseInt(params.get("page"));
		
		/* 검색 옵션*/
		String status_option = params.get("status_option");
		String  search_option = params.get("search_option");
		String keyword =  params.get("keyword");
		
		
		Map<String, Object> map = new HashMap<String, Object>();  // 리턴용 	
		Map<String, Object> data = new HashMap<String, Object>(); // 파라미터용
		
		data.put("status_option", status_option);
		data.put("search_option", search_option);
		data.put("keyword", keyword);
		
		int allCnt = dao.blindCount(data);
		logger.info("총 allCnt:"+allCnt); // 총 페이지 수 
		int pages = allCnt%cnt>0 ? (allCnt/cnt)+1 :(allCnt/cnt);  // 현재 만들 수 있는 최대 페이지 수 
		if(pages==0) {pages=1;}
		if(page>pages) {  // 페이지 바뀌는 경우 . 현재 페이지 가 
			page=pages;
		}
		logger.info("pages"+pages);
		
		map.put("pages", pages);// 만들 수 있는 최대 페이지 수 
		map.put("currPage",page); // 현재 페이지
		/* currPage>pages? : page */
		int offset =(page-1)*cnt;
		logger.info("offset:"+offset);
	//	ArrayList<HashMap<String, Object>> list =dao.reportList(cnt,offset);
		data.put("cnt", cnt);
		data.put("offset", offset);
		
		
	
		//리스트 뿌려주기 . 
		ArrayList<ReportDTO> blindList= dao.blindList(data); 

		map.put("blindList", blindList);
		
		return map;
	
	}
	
	//reportUpdate 시 블라인드로 변경 되었는지 확인할 것. 
	public String updateCheck(int report_no) {
		return dao.updateCheck(report_no);
	}



	public int insertBlind(Map<String, Object> data) {
		return dao.insertBlind(data);
		
	}

	public ArrayList<ReportDTO> blindHistory(Map<String, Object> data) {
		int class_no=(int) data.get("class_no");
		int idx = (int) data.get("idx");
		 
		ArrayList<ReportDTO> history = new ArrayList<ReportDTO>();
		if(class_no==1) {
			history= dao.blindHistory1(idx);	 
		}
		
		else if(class_no==2) {
			history=dao.blindHistory2(idx);
			
		}
		
		else if(class_no==3) {
			history=dao.blindHistory3(idx);
			
		}
		
		else if(class_no==4) {
			history=dao.blindHistory4(idx);
			
		}
		
		else if(class_no==5) { // 도장깨기 댓글
			history=dao.blindHistory2(idx);
			
		}
		
		else if(class_no==6) {// 모임 후기 
			history=dao.blindHistory6(idx);
			
		}
		
		else if(class_no==7) { // 모임후기 댓글 
			history=dao.blindHistory2(idx);
			
		}
		
		else if(class_no==8) { // 맛집리뷰 댓글 
			history=dao.blindHistory2(idx);
			
		}
		
		return history;
	}

	
	
	public void changeStatus(Map<String, Object> data) {
		dao.changeStatus(data);
		
	}
	@Transactional
	public int changeBlind(Map<String, Object> data) {
		int result = 0; 
		
		String obj_class_no= (String) data.get("class_no");
		Integer class_no = Integer.parseInt(obj_class_no);
		
		/* String string_class_no= String.valueOf(data); */
		
		int insert= dao.insertBlind(data); // 블라인드 insert 
		
		//알림
		String blichk = (String) data.get("report_status");
		String b_idx = (String) data.get("idx");
		Integer idx = Integer.parseInt(b_idx);
		String reported = (String) data.get("reported");
		logger.info("블라인드 리스트 블라인드 설정 : "+blichk+idx+reported );
		if(blichk.equals("블라인드")) {
			dao.blindNoti(class_no,idx,reported);
		}
		// insert한 데이터를 update 해서 report 수정  
		if(insert>0) {
			uPdateTypeChecker(data, result, class_no);
			dao.changeStatus(data);
		}
		

		return insert;
	}

	public Map<String, Object> memberList(HashMap<String, String> params) {
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		int cnt =Integer.parseInt(params.get("cnt"));  
		int page =Integer.parseInt(params.get("page"));
		String list_option =params.get("list_option");
		
		String keyword = params.get("keyword");
		String memberSearch = params.get("memberSearch");
		
		
		Map<String, Object> data = new HashMap<String, Object>(); 
		data.put("list_option", list_option);
		data.put("keyword",keyword);
		data.put("memberSearch",memberSearch);
		
		logger.info("보여줄 페이지:"+page);
		
		// 총 게시글 갯수 (allCnt)/ 페이지당 보여줄 갯수 (cnt) = 생성 가능한 페이지 (pages).
		int allCnt = dao.allMemberListCount(data);
		logger.info("총 allCnt:"+allCnt); // 총 페이지 수 
		int pages = allCnt%cnt>0 ? (allCnt/cnt)+1 :(allCnt/cnt);  // 현재 만들 수 있는 최대 페이지 수 
		if(pages==0) {pages=1;}
		if(page>pages) {  // 페이지 바뀌는 경우 . 현재 페이지 가 
			page=pages;
		}
		logger.info("pages"+pages);
		
		map.put("pages", pages);// 만들 수 있는 최대 페이지 수 
		map.put("currPage",page); // 현재 페이지
		/* currPage>pages? : page */
		int offset =(page-1)*cnt;
		logger.info("offset:"+offset);
	//	ArrayList<HashMap<String, Object>> list =dao.reportList(cnt,offset);
		data.put("cnt", cnt);
		data.put("offset", offset);
		ArrayList<ReportDTO> memberList =dao.MemberList(data);
	
	
		//ArrayList<HashMap<String, Object>> list = dao.reportList();
		map.put("list", memberList);
		return map;
	}

	public ReportDTO memberDetail(String member_id) {
		return dao.memberDetail(member_id);
	}

	public Map<String, Object> blindMemberList(HashMap<String, String> params) {
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		int cnt =Integer.parseInt(params.get("cnt"));  
		int page =Integer.parseInt(params.get("page"));
		String member_id= params.get("member_id");
		Map<String, Object> data = new HashMap<String, Object>(); 
		data.put("member_id", member_id);
		
		int allCnt = dao.blindMemberCount(data);
		logger.info("총 allCnt:"+allCnt); // 총 페이지 수 
		int pages = allCnt%cnt>0 ? (allCnt/cnt)+1 :(allCnt/cnt);  // 현재 만들 수 있는 최대 페이지 수 
		if(pages==0) {pages=1;}
		if(page>pages) {  // 페이지 바뀌는 경우 . 현재 페이지 가 
			page=pages;
		}
		logger.info("pages"+pages);
		
		map.put("pages", pages);// 만들 수 있는 최대 페이지 수 
		map.put("currPage",page); // 현재 페이지
		/* currPage>pages? : page */
		int offset =(page-1)*cnt;
		logger.info("offset:"+offset);
	//	ArrayList<HashMap<String, Object>> list =dao.reportList(cnt,offset);
		data.put("cnt", cnt);
		data.put("offset", offset);
		
		ArrayList<ReportDTO>  dto= dao.blindMemberList(data);
		 map.put("blindList",dto);
		return map;
	}
	
	
	
	@Transactional
	public Map<String, Object> blackReg(HashMap<String, String> params) {
		Map<String, Object> data  = new HashMap<String, Object>();
		 int result = dao.blackReg(params);
		dao.blackUPdate(params);
		 
		String msg =""; 
		if(result >0 ) {
			msg="처리가 완료되었습니다."; 
			
		}
		 data.put("result",result);
		 data.put("msg",msg);
		return data;
	}

	public ReportDTO blackList(String member_id) {
		return dao.blackList(member_id);
	}

	public Map<String, Object> blackMemberList(HashMap<String, String> params) {
		
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		int cnt =Integer.parseInt(params.get("cnt"));  
		int page =Integer.parseInt(params.get("page"));
		String member_id= params.get("member_id");
		Map<String, Object> data = new HashMap<String, Object>(); 
		data.put("member_id", member_id);
		
		int allCnt = dao.blackMemberCount(data);
		logger.info("총 allCnt:"+allCnt); // 총 페이지 수 
		int pages = allCnt%cnt>0 ? (allCnt/cnt)+1 :(allCnt/cnt);  // 현재 만들 수 있는 최대 페이지 수 
		if(pages==0) {pages=1;}
		if(page>pages) {  // 페이지 바뀌는 경우 . 현재 페이지 가 
			page=pages;
		}
		logger.info("pages"+pages);
		
		map.put("pages", pages);// 만들 수 있는 최대 페이지 수 
		map.put("currPage",page); // 현재 페이지
		/* currPage>pages? : page */
		int offset =(page-1)*cnt;
		logger.info("offset:"+offset);
	//	ArrayList<HashMap<String, Object>> list =dao.reportList(cnt,offset);
		data.put("cnt", cnt);
		data.put("offset", offset);
		
		ArrayList<ReportDTO>  dto= dao.blackMemberList(data);
		 map.put("blackMemberList",dto);
		return map;	
		
		
		
	}
	
	
	
	
	
	
	
	
	// test test test 
	public int test(String loginId) {
		int comment_no = dao.testPost(loginId);
		return comment_no; 
	
		
	}

	public ArrayList<TestDto> spoonList() {
		
		return dao.spoonList();
	}

	public void levelUp(Map<String, Object> data) {
		dao.levelUp(data);
		//등급 변경 시 알림
		dao.gradeNoti(data);
	}

	public void levelUp(String loginId, String level_0) {
		// TODO Auto-generated method stub
		
	}

	public int chkGrade(String loginId) {
		
		return dao.chkGrade( loginId);
	}

	public void blindNoti(Integer class_no, Integer idx, String reported) {
		logger.info("신고리스트- 블라인드 처리 시 알림 서비스");
		dao.blindNoti(class_no,idx,reported);
	}


	


	
	

}
