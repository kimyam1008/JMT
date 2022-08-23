package com.jmt.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jmt.member.dto.MemberDTO;
import com.jmt.member.dto.photoDTO;
import com.jmt.mypage.dto.MypageDTO;
import com.jmt.mypage.service.MypageService;

@Controller
public class MypageController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  MypageService service;
	
		// 마이페이지 이동
		@RequestMapping(value = "/mypage.go")
		public String mypage(Model model, HttpSession session) {
			
			String loginId = (String) session.getAttribute("loginId");
			String page = "/Member/profileRegister";
			//프로필 등록 안했다면 마이페이지 이동 불가하게 하기
			String proCon = service.proCon(loginId);
			if(proCon != null) {
				MemberDTO my = service.mypage(loginId); //마이페이지에 보여줄 프로필 정보 가져오기
				int profile_no = service.profile_no(loginId); //프로필 사진 가져올 때 맵퍼에 조건으로 필요
				photoDTO photoList = service.photoList(profile_no); //프로필 사진 가져오기
				//if(photoList == null) { //사진 등록 안하고 프로필 등록하면 기본 이미지 보여주기
					//photoDTO gibonPhoto = service.gibonPhoto(profile_no);
					//photoList = gibonPhoto;
				//}
				int blindCount = service.blindCount(loginId); //블라인드 갯수 가져오기
				int follower = service.follower(loginId); //팔로워 수 가져오기
				int following = service.following(loginId); //팔로잉 수 가져오기
				ArrayList<MypageDTO> myboard = service.myboard(loginId);//내가 쓴 게시글 가져오기 (도장깨기 하위+모임후기)
				ArrayList<MypageDTO> mycomment = service.mycomment(loginId);//내가 쓴 댓글의 게시글 가져오기
				ArrayList<MypageDTO> myLightning = service.myLightning(loginId);//내모임 - 번개
				ArrayList<MypageDTO> myDojang = service.myDojang(loginId);//내모임 - 도장
				ArrayList<MypageDTO> myLightningRoom = service.myLightningRoom(loginId);//내가 생성한 방 - 번개
				ArrayList<MypageDTO> myDojangRoom = service.myDojangRoom(loginId);//내가 생성한 방 - 도장
				//뷰에 보내주기
				model.addAttribute("list", my);
				model.addAttribute("blind", blindCount);
				model.addAttribute("follower", follower);
				model.addAttribute("following", following);
				model.addAttribute("photo",photoList);
				model.addAttribute("myboard", myboard);
				model.addAttribute("mycomment", mycomment);
				model.addAttribute("myLightning", myLightning);
				model.addAttribute("myDojang", myDojang);
				model.addAttribute("myLightningRoom", myLightningRoom);
				model.addAttribute("myDojangRoom", myDojangRoom);
				
				page = "/Mypage/mypage";
			} else {
				page = "redirect:./profileRegister.go";
			}
			
			
			return page;
		}
		
		// 프로필 수정페이지 이동
		@RequestMapping(value = "/profileUpdate.go")
		public String profileUpdate(Model model, HttpSession session) {
			String loginId = (String) session.getAttribute("loginId");
			MemberDTO my = service.mypage(loginId); //프로필 정보
			int profile_no = service.profile_no(loginId);
			photoDTO photoList = service.photoList(profile_no); // 프로필 사진
			ArrayList<MemberDTO> foodList = service.foodList(); //음식카테고리 가져오기
			model.addAttribute("foodList", foodList);
			model.addAttribute("list", my);
			model.addAttribute("photo",photoList);
			
			
			return "/Mypage/profileUpdate";
		}
		
		// 비밀번호 변경 팝업창
		@RequestMapping(value = "/passUpdate.go")
		public String passUpdate() {
			
			return "/Mypage/passUpdate";
		}
		
		// 비밀번호 변경
		@RequestMapping("/passUpdate.ajax")
		@ResponseBody
		public HashMap<String, Object> passUpdate(HttpSession session, @RequestParam HashMap<String, String> params) {
			logger.info("비밀번호 변경: "+params);
			HashMap<String, Object> map = new HashMap<String, Object>();
			String loginId = (String) session.getAttribute("loginId"); //비밀번호 조회를 위한 로그인 아이디 가져오기
			params.put("loginId", loginId); //인자값을 하나로 보내주기 위해 params 에 같이 넣어주기
			String hashText = service.oriPass(params); //DB에 저장되어 있는 현재 비밀번호 가져오기
			String oriPass = params.get("oriPass"); //입력받은 현재 비밀번호 가져오기
			String changePass = params.get("changePass"); //변경 할 비밀번호 가져오기
			String changePassCon = params.get("changePassCon"); //변경 비밀번호 확인 가져오기
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			boolean match = encoder.matches(oriPass, hashText); //디비에 저정된 비밀번호와 입력받은 비밀번호가 맞는지 확인하기
			boolean success = false;
			if(match) { //조회한 비밀번호와 입력받은 비밀번호가 서로 일치한다면
				if(changePass.equals(changePassCon)) { //변경할 비밀번호와 비밀번호 확인을 한번 더 비교하기
					hashText = encoder.encode(changePass); //비교해서 일치하는 것이 확인된다면 다시 암호화 하기
					params.put("changePass", hashText); //암호화 한 비밀번호 params 값에 넣어주기
					int row = service.passUpdate(params); //params 값을 디비에 업데이트
					if(row>0) { // 업데이트가 성공하면
						success = true; //suceess 를 true 로 바꿔주고
						map.put("passUpdate", success); //map 에 넣어서 뷰에 보내기
					}
				}
			}
			
			return map;
		}
		
		// 프로필 수정
		@RequestMapping(value = "/profileUpdate.do")
		public String profileUpdate(Model model, HttpSession session, MultipartFile[] photos,
				@RequestParam HashMap<String, Object> params) {
			String loginId = (String) session.getAttribute("loginId");
			params.put("loginId", loginId);
			logger.info("params :"+params+" 사진 : "+photos);
			service.profileUpdate(model, photos, params);
			
			return "redirect:/mypage.go";
		}
		
		// 회원탈퇴 팝업창
		@RequestMapping(value = "/memberDrop.go")
		public String memberDrop(Model model, HttpSession session) {
			String loginId = (String) session.getAttribute("loginId");
			model.addAttribute("loginId",loginId);
			return "/Mypage/memberDrop";
		}
		
		// 회원탈퇴
		@RequestMapping("/memberDrop.ajax")
		@ResponseBody
		public HashMap<String, Object> memberDrop(HttpSession session, @RequestParam String pw) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			String loginId = (String) session.getAttribute("loginId");
			String hashText = service.pwCon(loginId);
			logger.info("받아온 pw : " +pw);
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			boolean match = encoder.matches(pw, hashText);
			logger.info("매치 : "+match);
			if(match) {
				int row = service.memberDrop(loginId);
				boolean success = false;
				if (row>0) {
					success = true;
					map.put("memberDrop", success);
					session.removeAttribute("loginId");
				}
			}
			
			return map;
		}

		// 팔로잉 리스트 팝업
		@RequestMapping(value = "/followingList.go")
		public String followingList(Model model, HttpSession session) {
			String loginId = (String) session.getAttribute("loginId");
			ArrayList<String> followingList = service.followingList(loginId);
			model.addAttribute("followingList", followingList);
			return "/Mypage/followingList";
		}
		
		// 팔로워 리스트 팝업
		@RequestMapping(value = "/followerList.go")
		public String followerList(Model model, HttpSession session) {
			String loginId = (String) session.getAttribute("loginId");
			ArrayList<String> followerList = service.followerList(loginId);
			model.addAttribute("followerList", followerList);
			return "/Mypage/followerList";
		}
		
		// 다른 사람 마이페이지로 이동
		@RequestMapping(value = "/othersPage.go")
		public String othersPage(HttpSession session, Model model, @RequestParam int profile_no) {
			logger.info("다른사람 프로필 번호 : "+profile_no);
			String loginId = (String) session.getAttribute("loginId");
			MemberDTO other = service.otherPage(profile_no); //마이페이지에 보여줄 프로필 정보 가져오기
			photoDTO otherPhoto = service.otherPhoto(profile_no); //프로필 사진 가져오기
			int otherBlind = service.otherBlind(profile_no); //블라인드 갯수 가져오기
			int otherFollower = service.otherFollower(profile_no); //팔로워 수 가져오기
			int otherFollowing = service.otherFollowing(profile_no); //팔로잉 수 가져오기
			ArrayList<MypageDTO> lightRoom = service.lightRoom(profile_no);//번개 방 만든거 가져오기
			ArrayList<MypageDTO> dojangRoom = service.dojangRoom(profile_no);//도장깨기 방 만든거 가져오기
			ArrayList<MypageDTO> otherBoard = service.otherBoard(profile_no);//게시글 가져오기
			ArrayList<MypageDTO> otherCom = service.otherCom(profile_no);//댓글의 게시글 가져오기
			//로그인 한 아이디의 유저가 해당 페이지의 아이디를 팔로우 하고 있나?
			String followCon = service.followCon(loginId, profile_no);
			if(followCon == null) {
				model.addAttribute("follow", "팔로우");
			} else {
				model.addAttribute("follow", "팔로잉");
			}
			//뷰에 보내주기
			model.addAttribute("list", other);
			model.addAttribute("photo",otherPhoto);
			model.addAttribute("blind", otherBlind);
			model.addAttribute("follower", otherFollower);
			model.addAttribute("following", otherFollowing);
			model.addAttribute("lightRoom",lightRoom);
			model.addAttribute("dojangRoom",dojangRoom);
			model.addAttribute("otherBoard",otherBoard);
			model.addAttribute("otherCom",otherCom);
		
			return "/Mypage/otherspage";
		}
		
		// 다른사람 팔로잉 리스트 팝업
		@RequestMapping(value = "/otherFollowingList.go")
		public String otherFollowingList(Model model, @RequestParam int profile_no) {
			logger.info("다른회원 아이디 : "+profile_no);
			ArrayList<String> otherFollowingList = service.otherFollowingList(profile_no);
			logger.info("다른사람 팔로잉리스트 : "+otherFollowingList);
			model.addAttribute("otherFollowingList", otherFollowingList);
			return "/Mypage/otherFollowingList";
		}
		
		// 다른사람 팔로워 리스트 팝업
		@RequestMapping(value = "/otherFollowerList.go")
		public String otherFollowerList(Model model, @RequestParam int profile_no) {
			logger.info("다른회원 아이디 : "+profile_no);
			ArrayList<String> otherFollowerList = service.otherFollowerList(profile_no);
			logger.info("다른사람 팔로워리스트 : "+otherFollowerList);
			model.addAttribute("otherFollowerList", otherFollowerList);
			return "/Mypage/otherFollowerList";
		}
		
		//팔로우&언팔로우
		@RequestMapping(value = "/follow.do")
		public String follow(HttpSession session, Model model,
				@RequestParam String follow, @RequestParam String member_id, @RequestParam int profile_no) {
			String loginId = (String) session.getAttribute("loginId");
			if(follow.equals("팔로우")) {
				//팔로우 하기
				int row = service.followRegist(loginId, member_id);
				if(row>0) {
					model.addAttribute("follow","팔로잉");
				}
			} else if (follow.equals("팔로잉")) {
				//팔로우 취소
				int row = service.unfollow(loginId, member_id);
				if(row>0) {
					model.addAttribute("follow", "팔로우");
				}
			}
			
			return "redirect:/othersPage.go?profile_no="+profile_no;
		}

		// 내가 쓴 게시글 더보기
		@RequestMapping(value = "/boardMore.go")
		public String boardMore() {
			
			return "/Mypage/myBoardList";
		}
		
		// 내가 쓴 댓글의 게시글 더보기
		@RequestMapping(value = "/commentMore.go")
		public String commentMore() {
			
			return "/Mypage/myBoardList";
		}
		
		// 나의활동 첫 페이지 이동 - 게시글 (상단 프로필)
		//@RequestMapping(value = "/myBoardList.go")
		//public String myBoardList(Model model, HttpSession session) {
		//	String loginId = (String) session.getAttribute("loginId");
		//	MypageDTO dto = service.myBoardList(loginId); // 상단 프로필쪽
		//	model.addAttribute("dto",dto); // 상단 프로필쪽
		//	ArrayList<MypageDTO> myBoardArry = service.myBoardArry(loginId);
		//	model.addAttribute("list",myBoardArry);
			
		//	return "/Mypage/myBoardList";
		//}
		
		// 나의활동 첫 페이지 이동 - 게시글 (아작스 페이징) -- 페이징이랑 같이하면 리스트 안불러와져서 일단 페이징 안하고 리스트만 불러옴
		//@RequestMapping("/myBoardList.ajax")
		//@ResponseBody
		//public HashMap<String, Object> myBoardListAjax(@RequestParam HashMap<String, String>params, HttpSession session) {
		//	String loginId = (String) session.getAttribute("loginId");
		//	params.put("loginId", loginId);
			
		//	return service.myBoardListAjax(params);
		//}
		
		// 나의활동 댓글단 글
		//@RequestMapping(value = "/myComment.go")
		//public String myComment(Model model, HttpSession session) {
		//	String loginId = (String) session.getAttribute("loginId");
		//	MypageDTO dto = service.myBoardList(loginId); // 상단 프로필쪽
		//	model.addAttribute("dto",dto); // 상단 프로필쪽
		//	ArrayList<MypageDTO> myCommentArry = service.myCommentArry(loginId);
		//	model.addAttribute("list",myCommentArry);
			
		//	return "/Mypage/myComment";
		//}
		
		// 나의활동 댓글단 글
		//@RequestMapping(value = "/myMoim.go")
		//public String myMoim(Model model, HttpSession session) {
		//	String loginId = (String) session.getAttribute("loginId");
		//	MypageDTO dto = service.myBoardList(loginId); // 상단 프로필쪽
		//	model.addAttribute("dto",dto); // 상단 프로필쪽
		//	ArrayList<MypageDTO> myMoimArry = service.myMoimArry(loginId);
		//	model.addAttribute("list",myMoimArry);
			
		//	return "/Mypage/myMoim";
		//}
		

}
