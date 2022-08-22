package com.jmt.moim.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jmt.main.controller.NotiController;
import com.jmt.main.dao.NotiDAO;
import com.jmt.main.service.NotiService;
import com.jmt.moim.dto.LightningDTO;
import com.jmt.moim.service.LightningService;

@Controller
public class LightningController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  LightningService service;

	//번개모임리스트 lightning.jsp 페이지 이동 
	@RequestMapping(value="/lightList.go") 
	public String listPage(Model model,HttpSession session) {
		logger.info("리스트 페이지 이동");
		//음식카테고리 가져오기 
		ArrayList<LightningDTO> foodList = service.foodList();
			if(foodList.size()>0) {
				model.addAttribute("foodList", foodList);
			}
			
			//방장아이디와 로그인아이디 비교하기 위해서 
			String loginId = (String) session.getAttribute("loginId");
			model.addAttribute("loginId", loginId);
			//프로필 있는지 알아보기
			boolean profileChk = service.profileChk(loginId);
			logger.info("프로필 유무 : " + profileChk); //true or false
			model.addAttribute("profileChk", profileChk); 
			
		return "./Lightning/lightning";
	}
	
	
	
	@RequestMapping(value = "/lightList.ajax")
	@ResponseBody
	public HashMap<String, Object> list(Model model,
			@RequestParam HashMap<String, String>params, HttpSession session) {
		logger.info("리스트 불러오기");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//params 확인
		logger.info("모임 : "+params.get("lightning_title"));
		logger.info("음식 카테고리 : "+params.get("food_no"));
		logger.info("속도 : "+params.get("eat_speed"));
		logger.info("직업 : "+params.get("job"));
		logger.info("성별 : "+params.get("gender"));
		
		HashMap<String, Object> selectedparams = new HashMap<String, Object>();
		selectedparams.put("lightning_title", params.get("lightning_title"));
		selectedparams.put("food_no", params.get("food_no"));
		selectedparams.put("eat_speed", params.get("eat_speed"));
		selectedparams.put("job", params.get("job"));
		selectedparams.put("gender", params.get("gender"));
		selectedparams.put("loginId", session.getAttribute("loginId"));
		 
		//페이징- 현재페이지
		int page = Integer.parseInt(params.get("page"));
		//int page = params.get("page");
		logger.info("보여줄 페이지 :" + page);
		
		//offset 구하기 
		int offset = 10 * (page-1);
		logger.info("offset : " + offset);
		selectedparams.put("offset", offset);
		
		//총개수 
		int allCnt = service.allCount(selectedparams);
		logger.info("allCnt : " + allCnt);
		
		//생성가능한 페이지(pages)
		int pages = allCnt%10>0? (allCnt/10+1) : (allCnt/10);
		logger.info("pages : " + pages);
		if(pages<page) {
			page = pages;
		}
		map.put("currPage", page);
		map.put("pages", pages);
		
		//리스트 불러오기
		ArrayList<LightningDTO> selectedList = service.selectedList(selectedparams);
		map.put("list", selectedList);
		
		return map;
	}
	
	
	@RequestMapping("/lightDetail.go") 
	public String lightDetail(Model model,HttpSession session
			,@RequestParam String lightning_no) {
		logger.info("상세보기 페이지 이동");
		String loginId = (String) session.getAttribute("loginId");
		model.addAttribute("loginId", loginId);
		
		LightningDTO dto = service.detail(lightning_no,loginId);
		if(dto != null) {
			model.addAttribute("dto", dto);
		}
		
		//프로필 정보 
		LightningDTO profileInfo = service.profile(loginId);
		model.addAttribute("profileInfo", profileInfo);
		
		//프로필 있는지 알아보기
		boolean profileChk = service.profileChk(loginId);
		logger.info("프로필 유무 : " + profileChk); //true or false
		model.addAttribute("profileChk", profileChk);
		
		return "./Lightning/lightDetail";
	}
	
	
	
	//상세보기페이지 - 번개모임에 신청할 시 
	@RequestMapping("/lightRegister.do") 
	public String lightRegister(HttpSession session
			,RedirectAttributes rAttr, @RequestParam String lightning_no) {
		logger.info("번개 모임 신청 : " + lightning_no);
		String loginId = (String) session.getAttribute("loginId");
		
		//가입신청종합 테이블에 대기로 insert
		int row = service.register(loginId,lightning_no);
		
		String msg = "";
		if(row<1){
			msg = "신청에 실패했습니다.";
		}
		
		rAttr.addFlashAttribute("msg", msg);
		
		return "redirect:/lightDetail.go?lightning_no="+lightning_no;
	}
	
	
	//탈퇴 
	@RequestMapping("/lightDropOut.do") 
	public String lightStatusUpdate(Model model,HttpSession session
			,@RequestParam String lightning_no) {
		logger.info("번개 모임 탈퇴 : " + lightning_no);
		String loginId = (String) session.getAttribute("loginId");
		
		//탈퇴- apply 테이블 update
		service.dropout(loginId,lightning_no);
		
		return "redirect:/lightList.go";
	}
	
	
	//번개모임 게시글 신고 팝업 페이지 이동
	@RequestMapping("/lightReport.go")
	public String lightReportPopup(Model model,@RequestParam String lightning_no) {
		//String loginId = (String) session.getAttribute("loginId");
		
		logger.info("번개 모임 신고 팝업 이동  : "+lightning_no);
		model.addAttribute("lightning_no", lightning_no);
		return"./Lightning/lightReport";	
	}
	
	
	//번개모임 신고 팝업
	@RequestMapping("/lightReport.ajax")
	@ResponseBody
	public HashMap<String, Object> lightReport(@RequestParam HashMap<String, String> params, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		params.put("loginId", loginId);
		
		logger.info("번개 모임 글 신고  : "+ params);
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean report = service.report(params);
		map.put("lightReport", report);
		return map;	
	}
	
	
	
	//번개 모임 삭제(update)
	@Transactional
	@RequestMapping("/lightDelete.do")
	public String lightDelete(Model model,@RequestParam String lightning_no
			,HttpSession session) {
		logger.info("번개 모임 게시글 삭제   : "+lightning_no);
		service.delete(lightning_no);
		
		//글 삭제시 댓글도 삭제 처리 
		service.cmtDel(lightning_no);
		
		//알람이 가게 
		service.Delnoti(lightning_no);
		model.addAttribute("notiChk", true);
		return "redirect:/lightList.go";	
	}
	
	
	
	//번개모임 댓글 신고 팝업 페이지 이동
	@RequestMapping("/lightCmtReport.go")
	public String lightCmtReport(Model model,@RequestParam String comment_no) {
		logger.info("번개 모임 신고 팝업 이동  : "+comment_no);
		model.addAttribute("comment_no", comment_no);
		return"./Lightning/lightCmtReport";	
	}
	
	
	//번개모임 댓글 신고 팝업
	@RequestMapping("/lightCmtReport.ajax")
	@ResponseBody
	public HashMap<String, Object> lightCmtReport(@RequestParam HashMap<String, String> params, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		params.put("loginId", loginId);
			
		logger.info("번개 모임 댓글 신고  : "+ params);
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean report = service.cmtReport(params);
		map.put("lightCmtReport", report);
		return map;	
	}
	
	
	//번개모임 생성하기 페이지 이동
	@RequestMapping("/lightCreate.go") 
	public String lightCreatePage(Model model,HttpSession session) {
		logger.info("리스트 페이지 이동");
			
				
		return "./Lightning/lightCreate";
	}
		
		
	//번개모임 생성하기 - 맛집 검색 팝업 이동
	@RequestMapping("/lightResSearch.go") 
	public String resSearchPop(Model model,HttpSession session
			,@RequestParam HashMap<String, String> param) {
		logger.info("맛집 검색 팝업 이동");
					
		ArrayList<LightningDTO> resList = service.resList(param);
		logger.info("레스토랑 리스트 : " + resList.size());
		model.addAttribute("resList", resList);
		return "./Lightning/lightSearch";
	}
	
	
	/*팝업 - 맛집 리스트 가져오기
	@RequestMapping("/lightResList.do") 
	public String lightResList(Model model ,@RequestParam HashMap<String, String> param) {
		logger.info("맛집 검색 팝업 이동");
		return "./Lightning/lightSearch";
	}
	*/
	
	// 번개 모임 생성 
	@RequestMapping("/lightCreate.do") 
	public String lightCreate(Model model,HttpSession session
			,@RequestParam HashMap<String, String> params) {
		logger.info("번개 모임 생성 : " + params);
		String loginId = (String) session.getAttribute("loginId");
		params.put("loginId", loginId);
		service.lightCreate(params);
		return "redirect:/lightList.go";
	}
	
	
	
	
	
	
	
	
	//매일 밤 12시 모임날짜가 지난 게시글 모집마감으로 변경 
	@Scheduled(cron="0 0 0 * * *")
	public void changeStatus() {
		service.changeStatus();
		logger.info("모집마감 변경 완료");
	}
}
