package com.jmt.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.annotation.ResponseStatusExceptionResolver;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jmt.admin.dto.TestDto;
import com.jmt.admin.service.GradeService;
import com.jmt.admin.service.ReportService;
import com.jmt.mypage.service.MypageService;

import io.netty.handler.codec.http.HttpRequest;



@Controller
public class GradeController extends HandlerInterceptorAdapter{
	
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired GradeService service;
	@Autowired MypageService service2;
	@Autowired ReportService service3;
	
	
	// 등급 관리 페이지 
	@RequestMapping(value = "/grade.go")
	public ModelAndView grade(Model model) {
		logger.info("등급 페이지 이동");
		ModelAndView mav = new ModelAndView("Grade/grade");
		ArrayList<HashMap<String, Object>> list = service.list();
		model.addAttribute("list", list);
		return mav;
		
		
	}
	
	
	
	@RequestMapping(value = "/grade")
	public String gradeUpdate(HttpServletRequest request, RedirectAttributes ra, HttpSession session, @RequestParam HashMap<String, String> params) {
		
		String page = "Grade/grade";
		//String msg = "";
		
		int a = service.gradeUpdate(params);
		
		if(a > 0) {
			//msg = "등급 변경 성공";
			ra.addFlashAttribute("msg", "등급 변경 성공");
		}
 		
		return "redirect:/grade.go";
		
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	
		logger.info("등급 확인 합니다.");
		
		HttpSession session = request.getSession();
	
		 String loginId = (String) session.getAttribute("loginId"); 
			

			
			
		 	if(loginId!=null ) {
		 		
			Integer result = service2.profile_no(loginId);
			System.out.println(result);
			
		
			if((Integer)result != null) {
			
			
			System.out.println("로그인 아이디 확인:"+loginId);
			
			// 사용자 등급 no 가져옴. 
			int userGrade_no = service3.chkGrade(loginId);
			System.out.println("로그인 등급 no 확인:"+userGrade_no);
			
			// 해당 계정의 게시글 댓글 확인
			int comment_no = service3.test(loginId);
			System.out.println("사용자의 댓글 수확인:"+comment_no);
			
			// 해당 계정의 도장 게시판 확인
			int dojang_no = service.dojang_no(loginId);
			System.out.println("사용자의 댓글 수확인:"+dojang_no);
			
			// 해당 계정의 도장 하위 게시판 확인
			int dojang_no2 = service.dojang_no2(loginId);
			System.out.println("사용자의 댓글 수확인:"+dojang_no2);
			
			// 해당 계정의 번개 게시판 확인
			int il_no = service.il_no(loginId);
			System.out.println("사용자의 댓글 수확인:"+il_no);
			
			int all_no = dojang_no + dojang_no2 + il_no;
			System.out.println("사용자의 댓글 수확인:"+ all_no);
			
			
			ArrayList<TestDto> list = service3.spoonList();	
			// 나무 수저
		int tree_post = list.get(0).getGrade_post();
		int tree_comment = list.get(0).getGrade_comment();
		String level_0 =list.get(0).getGrade_name();
		int level_0_no =list.get(0).getGrade_no();
			
			// 동
		int bronze_post = list.get(1).getGrade_post();
		int bronze_comment = list.get(1).getGrade_comment();
		String level_1 =list.get(1).getGrade_name();
		int level_1_no =list.get(1).getGrade_no();
			// 은 
		int silver_post = list.get(2).getGrade_post();
		int silver_comment = list.get(2).getGrade_comment();
		String level_2 =list.get(2).getGrade_name();
		int level_2_no =list.get(2).getGrade_no();
			// 금 
		int gold_post = list.get(3).getGrade_post();
		int gold_comment = list.get(3).getGrade_comment();
		String level_3 =list.get(3).getGrade_name();
		int level_3_no =list.get(3).getGrade_no();
			// 다이아 
		int dia_post = list.get(4).getGrade_post();
		int dia_comment = list.get(4).getGrade_comment();
		String level_4 =list.get(4).getGrade_name();
		int level_4_no =list.get(4).getGrade_no();
		
			
		
		
		Map<String, Object> data = new HashMap<String, Object>(); 
		int  level_no = 0; 
		data.put("loginId", loginId);
		
	
		String msg =""; 
		
		if(bronze_comment <= comment_no && comment_no < silver_comment && bronze_comment <= all_no && all_no < silver_comment && userGrade_no!= level_1_no) {
			level_no=level_1_no;
			data.put("level_no", level_no);
			service3.levelUp(data);
			msg="동수저로 등업했습니다.";
			System.out.println("등업 성공..");
		} 
		else if(silver_comment <= comment_no && comment_no< gold_comment && silver_comment <= all_no && all_no < gold_comment && userGrade_no!= level_2_no) { 
			level_no=level_2_no;
			data.put("level_no", level_no);
			service3.levelUp(data);
			System.out.println("등업 성공..");
			msg="동수저로 등업했습니다.";
		}
		else if(gold_comment <= comment_no && comment_no< dia_comment && gold_comment <= all_no && all_no < dia_comment && userGrade_no!= level_3_no) { 
			level_no=level_3_no;
			data.put("level_no", level_no);
			service3.levelUp(data);
			msg="동수저로 등업했습니다.";
			
		}
		
		else if(dia_comment <= comment_no  && dia_comment <= all_no  && userGrade_no!= level_4_no) {
			data.put("level_no", level_no);
			level_no=level_4_no;
			service3.levelUp(data);
			msg="동수저로 등업했습니다.";
		}
		
			
		
		}
		
		 	}
			
}
	
	
	
	
//	@RequestMapping(value = "/gradeList.ajax")
//	@ResponseBody
//	public HashMap<String, Object> gradeList(Model model,@RequestParam HashMap<String, String> params) {
//		
//		logger.info("등급 리스트 요청");
//		
//		return service.gradeList(params);
//	}
//	
//	@RequestMapping(value = "update/{col}/{val}/{team}")
//	public HashMap<String, Object> update(
//			@PathVariable String col, @PathVariable String val, @PathVariable String team
//			) {
//		
//		val = val.equals("_value_")?"":val;
//		
//		logger.info("리스트 요청");
//		return service.update(col,val,team);
//	}
//	
//	
//	@RequestMapping(value = "/grade")
//	public String grade(@RequestParam String colorCode ,@RequestParam HashMap<String, String> params) {
//		String page = "Grade/grade";
//		
//		String str = colorCode;
//		logger.info(" : " + colorCode);
//		String[] strArr = str.split(",");
//		
//		for(int i=0;i<strArr.length;i++) {
//			System.out.println(strArr[i]);
//				service.colorCode(strArr[i]);
//			}
//		
//		logger.info(" : " +strArr);
//		
//		return "redirect:/grade.go";
//		
//		
//	}

	
	
	
	
	
}
