package com.jmt.moim.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jmt.moim.dto.DojangDTO;
import com.jmt.moim.service.DojangService;

@Controller
public class DojangController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  DojangService service;
	
	@RequestMapping(value = "/dojang.go")
	public String main(Model model) {
		
		return "./Dojang/dojang";
	}
	
	//도장 리스트
	@RequestMapping(value = "/dojang.ajax")
	@ResponseBody
	public HashMap<String, Object> dojangList(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("도장 리스트 요청");
		return service.dojangList(params,session);
	}
	
	//음식 카테고리
	@RequestMapping("/foodname.ajax")
	@ResponseBody
	public HashMap<String, Object> foodname(){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<DojangDTO> foodname = service.foodname();
		map.put("foodname", foodname);
		return map;
	}
	
	//도장 상세
	@RequestMapping("/dojangDetail.do")
	public ModelAndView dojangDetail(@RequestParam String dojang_no, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		return service.dojangDetail(dojang_no,loginId);
	}
	
	//가입신청 팝업
	@RequestMapping("/dojangApply.go")
	public String dojangApplyGo(@RequestParam String dojang_no, HttpSession session) {
		session.setAttribute("dojang_no", dojang_no);
		logger.info("도장가입신청"+dojang_no+"로그인아이디::"+session.getAttribute("loginId"));
		return"./Dojang/dojangApply";	
	}
	
	//도장가입 신청 팝업
	@RequestMapping("/dojangApply.ajax")
	@ResponseBody
	public HashMap<String, Object> dojangApply(HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		String loginId = (String) session.getAttribute("loginId");
		String dojang_no = (String) session.getAttribute("dojang_no");
		
		boolean dojangApply = service.dojangApply(dojang_no,loginId);
		map.put("dojangApply", dojangApply);

		return map;
	}
	
	
	//도장깨기 생성 페이지
	@RequestMapping("/dojangReg.go")
	public String dojangRegGo() {
		logger.info("도장깨기 생성");
		return "./Dojang/dojangReg";
	}
	
	//도장깨기 생성
	@RequestMapping("/dojangReg.ajax")
	@ResponseBody
	public HashMap<String, Object> dojangReg(@RequestParam HashMap<String, String> params, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//String loginId = (String) session.getAttribute("loginId");
		boolean dojangReg = service.dojangReg(params);
		map.put("dojangReg", dojangReg);
		
		return map;
	}
	
	
	//도장깨기 신고 팝업
	@RequestMapping("/dojangReport.go")
	public String dojangReportGo(@RequestParam String dojang_no, HttpSession session) {
		session.setAttribute("dojang_no", dojang_no);
		logger.info("도장가입신청"+dojang_no+"로그인아이디::"+session.getAttribute("loginId"));
		
		//신고당한 ID
		String reported = service.reported(dojang_no);
		session.setAttribute("reported",reported);
		return"./Dojang/dojangReport";	
	}
	
	
	//도장깨기 신고내용 
		@RequestMapping("/dojangReport.ajax")
		@ResponseBody
		public HashMap<String, Object> dojangReport(@RequestParam HashMap<String, String> params,HttpSession session){
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			boolean dojangReport = service.dojangReport(params);
			map.put("dojangReport", dojangReport);

			return map;
		}
		
		
		
		//도장깨기 방(전체)
		@RequestMapping("/dojangHome.go")
		public String dojangHomeGo(@RequestParam String dojang_no, HttpSession session) {
			session.setAttribute("dojang_no", dojang_no);
			return "./Dojang/dojangHome";
		}
		
		//도장깨기 방(공지)
		@RequestMapping("/dojangHomeL.go")
		public String dojangHomeGoL(@RequestParam String dojang_no, HttpSession session) {
			session.setAttribute("dojang_no", dojang_no);
			return "./Dojang/dojangHomeL";
		}
				
		//도장깨기 방(일반)
		@RequestMapping("/dojangHomeM.go")
		public String dojangHomeGoM(@RequestParam String dojang_no, HttpSession session) {
			session.setAttribute("dojang_no", dojang_no);
			return "./Dojang/dojangHomeM";
		}		
		
		//도장깨기 전체 ajax
		@RequestMapping("/dojangHome.ajax")
		@ResponseBody
		public HashMap<String, Object> dojangHome(@RequestParam HashMap<String, String> params, HttpSession session) {
			String dojang_no = (String) session.getAttribute("dojang_no");
			int cnt = Integer.parseInt(params.get("cnt")); //현재 페이지에 리스트 갯수
			int page = Integer.parseInt(params.get("page"));
			
			logger.info("보여줄 페이지 :" + page);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
		
			HashMap<String, Object> post = new HashMap<String, Object>();
			
			post.put("dojang_no", dojang_no);
			logger.info("도장번호 없나"+dojang_no);
			
			int allCnt = service.allCountHome(params);
			logger.info("allCnt : " + allCnt);
			
			int pages = allCnt % cnt > 0 ? (allCnt / cnt)+1 : (allCnt / cnt);
			logger.info("pages : " + pages);
			
			if(pages==0) {pages=1;}
			
			if(page>pages) {
				page = pages;
			}
			
			map.put("dojang_no", dojang_no);
			
			logger.info("pages : " + pages);
			map.put("pages", pages); //만들 수 있는 최대 페이지 수
			map.put("currPage", page); // 현재 페이지
			
			
			int offset = (page-1)*cnt;
			System.out.println("DATA ::: " + offset);
			logger.info("offset: " + offset);
			
			post.put("cnt", cnt);
			post.put("offset", offset);
			
			ArrayList<DojangDTO> dojangHome = service.dojangHome(post);
			ArrayList<DojangDTO> dojangHomeM = service.dojangHomeM(post);
			
			String dojangHomeLeader = service.reported(dojang_no);
			ArrayList<DojangDTO> dojangHomeMember = service.dojangHomeMember(dojang_no);
			map.put("dojangHome", dojangHome);
			map.put("dojangHomeM", dojangHomeM);
			map.put("dojangHomeLeader", dojangHomeLeader);
			map.put("dojangHomeMember", dojangHomeMember);
			logger.info("방장 아이디"+dojangHomeLeader);
			
			return map;
		}
		
		
		
		//도장깨기 공지 ajax
		@RequestMapping("/dojangHomeL.ajax")
		@ResponseBody
		public HashMap<String, Object> dojangHomeL(@RequestParam HashMap<String, String> params, HttpSession session) {
			String dojang_no = (String) session.getAttribute("dojang_no");
			int cnt = Integer.parseInt(params.get("cnt")); //현재 페이지에 리스트 갯수
			int page = Integer.parseInt(params.get("page"));
			System.out.println("DATA:::"+cnt);
			logger.info("보여줄 페이지 :" + page);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
		
			HashMap<String, Object> post = new HashMap<String, Object>();
			
			post.put("dojang_no", dojang_no);
			logger.info("도장번호 없나"+dojang_no);
			
			int allCnt = service.allCountHomeL(params);
			logger.info("allCnt : " + allCnt);
			
			int pages = allCnt % cnt > 0 ? (allCnt / cnt)+1 : (allCnt / cnt);
			logger.info("pages : " + pages);
			
			if(pages==0) {pages=1;}
			
			if(page>pages) {
				page = pages;
			}
			
			map.put("dojang_no", dojang_no);
			
			logger.info("pages : " + pages);
			map.put("pages", pages); //만들 수 있는 최대 페이지 수
			map.put("currPage", page); // 현재 페이지
			
			
			int offset = (page-1)*cnt;
			System.out.println("DATA ::: " + offset);
			logger.info("offset: " + offset);
			
			post.put("cnt", cnt);
			post.put("offset", offset);
			
			ArrayList<DojangDTO> dojangHomeL = service.dojangHomeL(post);
			
			String dojangHomeLeader = service.reported(dojang_no);
			ArrayList<DojangDTO> dojangHomeMember = service.dojangHomeMember(dojang_no);
			map.put("dojangHomeL", dojangHomeL);
			map.put("dojangHomeLeader", dojangHomeLeader);
			map.put("dojangHomeMember", dojangHomeMember);
			logger.info("방장 아이디"+dojangHomeLeader);
			
			return map;
		}
		
		//도장깨기 일반 ajax
		@RequestMapping("/dojangHomeM.ajax")
		@ResponseBody
		public HashMap<String, Object> dojangHomeM(@RequestParam HashMap<String, String> params, HttpSession session) {
			String dojang_no = (String) session.getAttribute("dojang_no");
			int cnt = Integer.parseInt(params.get("cnt")); //현재 페이지에 리스트 갯수
			int page = Integer.parseInt(params.get("page"));
			
			logger.info("보여줄 페이지 :" + page);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
		
			HashMap<String, Object> post = new HashMap<String, Object>();
			
			post.put("dojang_no", dojang_no);
			logger.info("도장번호 없나"+dojang_no);
			
			int allCnt = service.allCountHomeM(params);
			logger.info("allCnt : " + allCnt);
			
			int pages = allCnt % cnt > 0 ? (allCnt / cnt)+1 : (allCnt / cnt);
			logger.info("pages : " + pages);
			
			if(pages==0) {pages=1;}
			
			if(page>pages) {
				page = pages;
			}
			
			map.put("dojang_no", dojang_no);
			
			logger.info("pages : " + pages);
			map.put("pages", pages); //만들 수 있는 최대 페이지 수
			map.put("currPage", page); // 현재 페이지
			
			
			int offset = (page-1)*cnt;
			System.out.println("DATA ::: " + offset);
			logger.info("offset: " + offset);
			
			post.put("cnt", cnt);
			post.put("offset", offset);
			
			ArrayList<DojangDTO> dojangHomeM = service.dojangHomeM(post);
			
			String dojangHomeLeader = service.reported(dojang_no);
			ArrayList<DojangDTO> dojangHomeMember = service.dojangHomeMember(dojang_no);
			map.put("dojangHomeM", dojangHomeM);
			map.put("dojangHomeLeader", dojangHomeLeader);
			map.put("dojangHomeMember", dojangHomeMember);
			logger.info("방장 아이디"+dojangHomeLeader);
			
			return map;
		}
		
		
		//도장깨기 방 게시글 상세보기 이동
		@RequestMapping("/dojangHomeDetail.go")
		public String dojangHomeDetailGo(@RequestParam String dojangPost_no, HttpSession session) {
			session.setAttribute("dojangPost_no", dojangPost_no);
			return "./Dojang/dojangHomeDetail";
		}	
		
		//도장깨기 방 게시글 상세보기
		@RequestMapping("/dojangHomeDetail.ajax")
		@ResponseBody
		public HashMap<String, Object> dojangHomeDetail(HttpSession session) {

			HashMap<String, Object> map = new HashMap<String, Object>();
			
				String dojangPost_no = (String) session.getAttribute("dojangPost_no");

				session.removeAttribute("dojangPost_no");

				DojangDTO dojangHomeDetail = service.dojangHomeDetail(dojangPost_no);
				map.put("dojangHomeDetail", dojangHomeDetail);
				
			return map;
		}
	
	
	//도장모임 검색
	/*
	@RequestMapping("/dojangSearch.ajax")
	@ResponseBody
	public HashMap<String, Object> courSearch(
			@RequestParam HashMap<String, String> params){
		//HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("검색결과 리스트 요청"+params);
		return service.dojangList(params);
	}
	
	*/
	
	
	
	
	
	

}
