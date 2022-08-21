package com.jmt.moim.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jmt.moim.dto.DojangDTO;
import com.jmt.moim.dto.LightningDTO;
import com.jmt.moim.service.DojangService;
import com.jmt.moim.service.LightningService;

@Controller
public class DojangController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  DojangService service;
	@Autowired LightningService servicelig;
	
	@RequestMapping(value = "/dojang.go")
	public String main(Model model) {
		
		ArrayList<LightningDTO> foodList = servicelig.foodList();
		if(foodList.size()>0) {
			model.addAttribute("foodList", foodList);
		}
		
		
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
	public String dojangRegGo(HttpSession session,Model model) {
		String page= "./Dojang/dojang";
		
		if(session.getAttribute("loginId") != null) {
			page="./Dojang/dojangReg";
			ArrayList<LightningDTO> foodList = servicelig.foodList();
				model.addAttribute("foodList", foodList);

			
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}
		logger.info("도장깨기 생성");
		return page;
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
		public String dojangHomeGo(@RequestParam String dojang_no, Model model, HttpSession session) {
			session.setAttribute("dojang_no", dojang_no);
			String loginId = (String) session.getAttribute("loginId");
			String dojangHomeMstatus = service.dojangHomeMstatus(dojang_no,loginId);
			String dojangHomeLeader = service.reported(dojang_no);
			ArrayList<DojangDTO> dojangHomeMember = service.dojangHomeMember(dojang_no);
			String dojangTitle = service.dojangTitle(dojang_no);
			model.addAttribute("dojangTitle",dojangTitle);
			model.addAttribute("dojangHomeMember",dojangHomeMember);
			model.addAttribute("leader",dojangHomeLeader);
			model.addAttribute("loginId",loginId);
			model.addAttribute("member",dojangHomeMstatus);
			return "./Dojang/dojangHome";
		}
		
		//도장깨기 방(공지)
		@RequestMapping("/dojangHomeL.go")
		public String dojangHomeGoL(@RequestParam String dojang_no,Model model, HttpSession session) {
			session.setAttribute("dojang_no", dojang_no);
			String loginId = (String) session.getAttribute("loginId");
			String dojangHomeLeader = service.reported(dojang_no);
			String dojangHomeMstatus = service.dojangHomeMstatus(dojang_no,loginId);
			ArrayList<DojangDTO> dojangHomeMember = service.dojangHomeMember(dojang_no);
			String dojangTitle = service.dojangTitle(dojang_no);
			model.addAttribute("dojangTitle",dojangTitle);
			model.addAttribute("dojangHomeMember",dojangHomeMember);
			model.addAttribute("leader",dojangHomeLeader);
			model.addAttribute("loginId",loginId);
			model.addAttribute("member",dojangHomeMstatus);
			return "./Dojang/dojangHomeL";
		}
				
		//도장깨기 방(일반)
		@RequestMapping("/dojangHomeM.go")
		public String dojangHomeGoM(@RequestParam String dojang_no,Model model, HttpSession session) {
			session.setAttribute("dojang_no", dojang_no);
			String loginId = (String) session.getAttribute("loginId");
			String dojangHomeLeader = service.reported(dojang_no);
			String dojangHomeMstatus = service.dojangHomeMstatus(dojang_no,loginId);
			ArrayList<DojangDTO> dojangHomeMember = service.dojangHomeMember(dojang_no);
			String dojangTitle = service.dojangTitle(dojang_no);
			model.addAttribute("dojangTitle",dojangTitle);
			model.addAttribute("dojangHomeMember",dojangHomeMember);
			model.addAttribute("leader",dojangHomeLeader);
			model.addAttribute("loginId",loginId);
			model.addAttribute("member",dojangHomeMstatus);
			return "./Dojang/dojangHomeM";
		}		
		
		//회원탈퇴
		@RequestMapping("/dojangHome..ajax")
		@ResponseBody HashMap<String, Object> Mstatus(HttpSession session) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			String dojang_no = (String) session.getAttribute("dojang_no");
			String loginId = (String) session.getAttribute("loginId");
			boolean Mstatus = service.Mstatus(dojang_no,loginId);
			
			map.put("Mstatus", Mstatus);
			
			return map;
		}
		
		//도장깨기 전체 ajax
		@RequestMapping("/dojangHome.ajax")
		@ResponseBody
		public HashMap<String, Object> dojangHome(@RequestParam HashMap<String, String> params, HttpSession session) {
			String dojang_no = (String) session.getAttribute("dojang_no");
			String loginId = (String) session.getAttribute("loginId");
			int cnt = Integer.parseInt(params.get("cnt")); //현재 페이지에 리스트 갯수
			int page = Integer.parseInt(params.get("page"));
			
			
			//회원 탈퇴
			//boolean Mstatus = service.Mstatus(dojang_no,loginId);
			//logger.info("탈퇴회원 확인...:::" +dojang_no+loginId);
			
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
			//map.put("Mstatus", Mstatus);
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
		public String dojangHomeDetailGo(@RequestParam String dojangPost_no, Model model, HttpSession session) {
			session.setAttribute("dojangPost_no", dojangPost_no);
			String loginId = (String) session.getAttribute("loginId");
			String dojang_no = (String) session.getAttribute("dojang_no");
			
			DojangDTO dojangHomeDetail = service.dojangHomeDetail(dojangPost_no);
			String dojangHomeMstatus = service.dojangHomeMstatus(dojang_no,loginId);
			String dojangHomeLeader = service.reported(dojang_no);
			ArrayList<DojangDTO> dojangHomeMember = service.dojangHomeMember(dojang_no);
			String dojangTitle = service.dojangTitle(dojang_no);
			model.addAttribute("dojangTitle",dojangTitle);
			model.addAttribute("dojangHomeMember",dojangHomeMember);
			model.addAttribute("leader",dojangHomeLeader);
			
				model.addAttribute("loginId",loginId);
				model.addAttribute("list",dojangHomeDetail);
				model.addAttribute("member",dojangHomeMstatus);
			return "./Dojang/dojangHomeDetail";
		}	
		
		//도장깨기 방 상세 글삭제
		@RequestMapping("/dojangHomeDetail..ajax")
		@ResponseBody HashMap<String, Object> dojangPostDelete(HttpSession session) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			String dojangPost_no = (String) session.getAttribute("dojangPost_no");
			boolean success =  service.dojangPostDelete(dojangPost_no);
			
			map.put("success", success);
			
			return map;
		}
		
		
		//도장깨기 방 게시글 상세보기
		@RequestMapping("/dojangHomeDetail.ajax")
		@ResponseBody
		public HashMap<String, Object> dojangHomeDetail(HttpSession session) {

			HashMap<String, Object> map = new HashMap<String, Object>();
			
				String dojangPost_no = (String) session.getAttribute("dojangPost_no");
				String dojang_no = (String) session.getAttribute("dojang_no");
				
				//글삭제(숨김)
				//boolean success =  service.dojangPostDelete(dojangPost_no);
			    //map.put("success", success);
			    //logger.info("숨김처리 제발::"+dojangPost_no);

				ArrayList<DojangDTO> dojangHomeMember = service.dojangHomeMember(dojang_no);
				DojangDTO dojangHomeDetail = service.dojangHomeDetail(dojangPost_no);
				String dojangHomeLeader = service.reported(dojang_no);
				map.put("dojangHomeDetail", dojangHomeDetail);
				map.put("dojangHomeMember", dojangHomeMember);
				map.put("dojangHomeLeader", dojangHomeLeader);
				
			return map;
		}
	
		
		
		//도장깨기방 글쓰기 페이지
		@RequestMapping("/dojangPostReg.go")
		public String dojangPostRegGo(Model model, HttpSession session) {
			String dojang_no = (String) session.getAttribute("dojang_no");
			String loginId = (String) session.getAttribute("loginId");
			String dojangHomeLeader = service.reported(dojang_no);
			ArrayList<DojangDTO> dojangHomeMember = service.dojangHomeMember(dojang_no);
			String dojangTitle = service.dojangTitle(dojang_no);
				model.addAttribute("dojangTitle",dojangTitle);
				model.addAttribute("dojangHomeMember",dojangHomeMember);
				model.addAttribute("leader",dojangHomeLeader);
				model.addAttribute("loginId",loginId);
			logger.info("방장확인::"+dojangHomeLeader);
			logger.info("도장깨기 방번호 확인 ::"+ dojang_no+"도장깨기 방 게시글 작성자 ::"+ loginId);
			return "./Dojang/dojangPostReg";
		}
		
		//도장깨기방 글쓰기
		@RequestMapping("/dojangPostReg.ajax")
		@ResponseBody
		public HashMap<String, Object> dojangPostReg(@RequestParam HashMap<String, String> params, HttpSession session) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			String dojang_no = (String) session.getAttribute("dojang_no");
			System.out.println("도장번호 확인..."+params.get("dojang_no"));
			System.out.println("작성자 확인..."+params.get("member_id"));
			System.out.println("도장제목 확인..."+params.get("dojangPost_subject"));
			System.out.println("도장내용 확인..."+params.get("dojangPost_content"));
			System.out.println("식당번호 확인..."+params.get("restaurant_no"));
			
			
			String dojangHomeLeader = service.reported(dojang_no);
			ArrayList<DojangDTO> dojangHomeMember = service.dojangHomeMember(dojang_no);
			
			
			boolean dojangPostReg = service.dojangPostReg(params,session);
			map.put("dojangPostReg", dojangPostReg);
			map.put("dojangHomeLeader", dojangHomeLeader);
			map.put("dojangHomeMember", dojangHomeMember);
			
			return map;
		}
		
		
		//도장깨기 방 파일 업로드 팝업
		   @RequestMapping(value = "/gpFileUploadForm.go")
		   public String gpFileUploadForm() {
		      logger.info("파일 업로드 팝업 열기");
		      return "./Dojang/gpFileUploadForm";
		   }
		   
		   //도장깨기 방 파일 업로드
		   @RequestMapping(value = "/gpFileUpload")
		   public ModelAndView gpFileUpload(MultipartFile file, HttpSession session) {
		      logger.info("upload 요청");
		      return service.fileUpload(file,session);
		   }
		
		
		   
		   //도장깨기 방 파일 삭제
		   @RequestMapping(value = "/gpFileDelete.ajax")
		   @ResponseBody
		   public HashMap<String, Object> gpFileDelete(@RequestParam String fileName, HttpSession session) {
		      logger.info(fileName+"삭제 요청");
		      return service.gpFileDelete(fileName,session);
		   }
		   
		   //도장깨기 회원리스트
		   
		   @RequestMapping(value = "/dojangMember.ajax")
		   @ResponseBody
		   public HashMap<String, Object> dojangMember(HttpSession session) {
			   String dojang_no = (String) session.getAttribute("dojang_no");
			   HashMap<String, Object> map = new HashMap<String, Object>();
			   
			   String dojangHomeLeader = service.reported(dojang_no);
			   ArrayList<DojangDTO> dojangHomeMember = service.dojangHomeMember(dojang_no);
			   
				map.put("dojangHomeLeader", dojangHomeLeader);
				map.put("dojangHomeMember", dojangHomeMember);
			   
		      return map;
		   }
		   
		   
		 //도장깨기방 글 수정 페이지 이동
			@RequestMapping("/dojangPostUpdate.go")
			public String dojangPostUpdateGo(@RequestParam String dojangPost_no,Model model,HttpSession session) {
				String dojang_no = (String) session.getAttribute("dojang_no");
				String loginId = (String) session.getAttribute("loginId");
				String dojangHomeLeader = service.reported(dojang_no);
					model.addAttribute("leader",dojangHomeLeader);
					model.addAttribute("loginId",loginId);
				
				session.setAttribute("dojangPost_no", dojangPost_no);
				return "./Dojang/dojangPostUpdate";
			}
			
			
			//도장깨기방 글 수정
			@RequestMapping("/dojangPostUpdate.ajax")
			@ResponseBody
			public HashMap<String, Object>dojangPostUpdate(@RequestParam HashMap<String, String> params,HttpSession session){
				logger.info("params : " + params);
				HashMap<String, Object> map = new HashMap<String, Object>();

				boolean success = service.dojangPostUpdate(params);
				map.put("success", success);

				return map;
			}	
			
			
			
			//도장깨기 방 글쓰기 맛집검색 팝업
			@RequestMapping(value = "/gpRestaurantSearch.go")
			public String gpRestaurantSearchGo(Model model, HttpSession session) {	
				return "./Dojang/gpRestaurantSearch";	
			}
			
			
			//도장깨기 방 글쓰기 맛집검색
			@RequestMapping(value = "/gpRestaurantSearch.do")
			public String gpRestaurantSearch(Model model, HttpSession session, HttpServletRequest req) {
				logger.info("맛집 검색");
				
				String gpSearchCondition = req.getParameter("gpSearchCondition");
				String searchContent = req.getParameter("searchContent");
				
				ArrayList<DojangDTO> gpRestaurantSearchList = service.gpRestaurantSearchList(gpSearchCondition,searchContent);
				logger.info("list size : " + gpRestaurantSearchList.size());
				model.addAttribute("gpRestaurantSearchList", gpRestaurantSearchList);

				
				return "./Dojang/gpRestaurantSearch";
		
			}
			
			
			
			//도장깨기 방 게시글 신고 팝업
			@RequestMapping("/dojangPostReport.go")
			public String dojangPostReportGo(@RequestParam String dojangPost_no, HttpSession session) {
				session.setAttribute("dojangPost_no", dojangPost_no);
				logger.info("도장가입신청"+dojangPost_no+"로그인아이디::"+session.getAttribute("loginId"));
				
				//신고당한 ID
				String postReported = service.postReported(dojangPost_no);
				session.setAttribute("reported",postReported);
				return"./Dojang/dojangPostReport";	
			}
			
			
			//도장깨기 방 게시글신고내용 
				@RequestMapping("/dojangPostReport.ajax")
				@ResponseBody
				public HashMap<String, Object> dojangPostReport(@RequestParam HashMap<String, String> params,HttpSession session){
					
					HashMap<String, Object> map = new HashMap<String, Object>();
					
					boolean dojangPostReport = service.dojangPostReport(params);
					map.put("dojangPostReport", dojangPostReport);

					return map;
				}
				
				
				 //모임후기 댓글 신고 팝업 페이지 이동
				   @RequestMapping("/dojangCmtReport.go")
					public String dojangCmtReport(Model model,@RequestParam String comment_no) {
						logger.info("모임 후기 댓글 신고 팝업 이동  : "+comment_no);
						model.addAttribute("comment_no", comment_no);
						return"./Dojang/dojangCmtReport";	
					}
				   
				   //모임후기 댓글 신고 팝업
				   @RequestMapping("/dojangCmtReport.ajax")
					@ResponseBody
					public HashMap<String, Object> dojangCmtReport(@RequestParam HashMap<String, String> params, HttpSession session) {
						String loginId = (String) session.getAttribute("loginId");
						params.put("loginId", loginId);
							
						logger.info("번개 모임 댓글 신고  : "+ params);
						HashMap<String, Object> map = new HashMap<String, Object>();
						boolean report = service.dojangCmtReport(params);
						map.put("dojangCmtReport", report);
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
