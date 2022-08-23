package com.jmt.mypage.service;

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
import org.springframework.web.multipart.MultipartFile;

import com.jmt.member.dto.MemberDTO;
import com.jmt.member.dto.photoDTO;
import com.jmt.mypage.dao.MypageDAO;
import com.jmt.mypage.dto.MypageDTO;

@Service
public class MypageService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  MypageDAO dao;

	public MemberDTO mypage(String loginId) {
		MemberDTO params = dao.mypage(loginId);
		int food_no = params.getFood_no();
		int grade_no = params.getGrade_no();
		if(food_no == 1) {
			params.setFood_name("한식");
		}else if(food_no == 2) {
			params.setFood_name("중식");
		}else if(food_no == 3) {
			params.setFood_name("일식");
		}else if(food_no == 4) {
			params.setFood_name("양식");
		}else if(food_no == 5) {
			params.setFood_name("기타외국음식");
		}else if(food_no == 6) {
			params.setFood_name("디저트/까페");
		}
		
		if(grade_no == 1) {
			params.setGrade_name("나무수저");
		}else if(grade_no == 2) {
			params.setGrade_name("동수저");
		}else if(grade_no == 3) {
			params.setGrade_name("은수저");
		}else if(grade_no == 4) {
			params.setGrade_name("금수저");
		}else if(grade_no == 5) {
			params.setGrade_name("다이아수저");
		}
		
		return params;
	}

	public int blindCount(String loginId) {
		
		return dao.blindCount(loginId);
	}

	public int follower(String loginId) {
		
		return dao.follower(loginId);
	}

	public int following(String loginId) {
		
		return dao.following(loginId);
	}

	public Integer profile_no(String loginId) {
		
		return dao.profile_no(loginId);
	}
	
	public photoDTO photoList(int profile_no) {
		
		return dao.photoList(profile_no);
	}

	public ArrayList<MemberDTO> foodList() {
		
		return dao.foodList();
	}

	public String oriPass(HashMap<String, String> params) {
		
		return dao.oriPass(params);
	}

	public int passUpdate(HashMap<String, String> params) {
		
		return dao.passUpdate(params);
	}

	public void profileUpdate(Model model ,MultipartFile[] photos, HashMap<String, Object> params) {
		
		MemberDTO dto = new MemberDTO();
		dto.setFood_no(Integer.parseInt((String) params.get("food_no")));
		dto.setMember_id((String) params.get("loginId"));
		dto.setEat_speed((String) params.get("speed"));
		dto.setProfile_gender((String) params.get("gender"));
		dto.setProfile_job((String) params.get("job"));
		dto.setMember_name((String) params.get("name"));
		
		int profile_no = dao.profile_num(dto); //프로필 번호 가져오기
		logger.info("프로필 번호 : "+profile_no);
		
		//프로필 업데이트
		int profileUpdate = dao.profileUpdate(dto);
		//회원정보(이름) 업데이트
		int memberUpdate = dao.memberUpdate(dto);
		logger.info("1차 와?");
		//사진 업데이트는 하든 안하든 무조건 기존 사진 삭제하고 다시 올리기
		
		if(profileUpdate > 0 || memberUpdate >0 ) {
			
			if(photos !=null ) {
				fileUpdate(photos,profile_no);
				
			}else {
				
			}
			
			model.addAttribute("msg", "정보수정이 완료되었습니다.");
		}else {
			model.addAttribute("msg", "정보수정에 실패했습니다.");
		}
	}
	
	public void fileSave(MultipartFile[] photos, int profile_no) { //photo, profile 테이블 idx를 알아야함
		// 3. 파일 업로드
		for (MultipartFile photo : photos) {
			String oriFileName = photo.getOriginalFilename(); // 3-1. 파일명 추출
			if(!oriFileName.equals("")) {
				logger.info("업로드 진행");
				// 3-2. 확장자 분리
				String ext = oriFileName.substring(oriFileName.lastIndexOf(".")).toLowerCase();
				// 3-3. 새 이름 만들기
				String newFileName = System.currentTimeMillis()+ext;
				
				logger.info(oriFileName + "=>" + newFileName); 
				
				// 3-4. 파일 받아서 저장하기
				try {
					byte[] arr = photo.getBytes();
					Path path = Paths.get("C:\\STUDY\\SPRING_ADVANCE\\JMT4\\src\\main\\webapp\\resources\\photo\\review\\"+newFileName);
					Files.write(path,arr);
					logger.info(newFileName+" - save ok");
					// 4. 업로드 후 photo 테이블에 데이터 입력
					dao.fileWrite(oriFileName, newFileName, profile_no);
					
				} catch (IOException e) {
					e.printStackTrace();
				}				
			}
		}
	}
	
	
	public void fileUpdate(MultipartFile[] photos, int profile_no) {
		
		for (MultipartFile photo : photos) {
			String oriFileName = photo.getOriginalFilename(); //파일명

			
			if(!oriFileName.equals("")) {
				logger.info("업로드 진행");
				// 3-2. 확장자 분리
				String ext = oriFileName.substring(oriFileName.lastIndexOf(".")).toLowerCase();
				// 3-3. 새 이름 만들기
				String newFileName = System.currentTimeMillis()+ext;
			logger.info("과목이미지:::" + photos);
				try {
					ArrayList<photoDTO> photoUpdate = dao.photoUpdate(Integer.toString(profile_no));
					
					byte[] arr = photo.getBytes();
					Path path = Paths.get("C:/STUDY/SPRING_ADVANCE/JMT4/src/main/webapp/resources/photo/review/" + newFileName);
					Files.write(path, arr);
					
					if(photoUpdate.isEmpty())
						dao.fileWrite(oriFileName, newFileName, profile_no);
					else
						dao.fileUpdate(oriFileName, newFileName, profile_no);
					
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		}
	}
	
	
	

	public int memberDrop(String loginId) {
		
		return dao.memberDrop(loginId);
	}

	public String pwCon(String loginId) {

		return dao.pwCon(loginId);
	}

	public ArrayList<String> followingList(String loginId) {

		return dao.followingList(loginId);
	}

	public ArrayList<String> followerList(String loginId) {
		
		return dao.followerList(loginId);
	}
//
	public MemberDTO otherPage(int profile_no) {
		
		return dao.otherPage(profile_no);
	}

	public photoDTO otherPhoto(int profile_no) {

		return dao.otherPhoto(profile_no);
	}

	public int otherBlind(int profile_no) {

		return dao.otherBlind(profile_no);
	}

	public int otherFollower(int profile_no) {

		return dao.otherFollower(profile_no);
	}

	public int otherFollowing(int profile_no) {

		return dao.otherFollowing(profile_no);
	}

	public int follow(HashMap<String, Object> params) {

		return dao.follow(params);
	}

	public String followCon(String loginId, int profile_no) {

		return dao.followCon(loginId, profile_no);
	}

	public int followRegist(String loginId, String member_id) {
		
		return dao.followRegist(loginId, member_id);
	}

	public int unfollow(String loginId, String member_id) {

		return dao.unfollow(loginId, member_id);
	}

	public ArrayList<String> otherFollowingList(int profile_no) {

		return dao.otherFollowingList(profile_no);
	}

	public ArrayList<String> otherFollowerList(int profile_no) {

		return dao.otherFollowerList(profile_no);
	}

	public ArrayList<MypageDTO> myboard(String loginId) {

		return dao.myboard(loginId);
	}

	public ArrayList<MypageDTO> mycomment(String loginId) {

		return dao.mycomment(loginId);
	}

	public ArrayList<MypageDTO> myLightning(String loginId) {

		return dao.myLightning(loginId);
	}

	public ArrayList<MypageDTO> myDojang(String loginId) {

		return dao.myDojang(loginId);
	}

	public ArrayList<MypageDTO> myLightningRoom(String loginId) {

		return dao.myLightningRoom(loginId);
	}

	public ArrayList<MypageDTO> myDojangRoom(String loginId) {

		return dao.myDojangRoom(loginId);
	}
	
	public MypageDTO myBoardList(String loginId) {
		
		MypageDTO dto = new MypageDTO();
		int dojangCount = dao.dojangCount(loginId); // 도장깨기 하위 게시글 갯수
		int moimCount = dao.moimCount(loginId); // 모임후기 갯수
		int boardCount = dojangCount+moimCount; // 나의 게시글 총 갯수
		dto.setBoardCount(boardCount);; //dto 에 넣어주기
		int lightningCount = dao.lightningCount(loginId);//번개모임 댓글 갯수
		int dojangCommentCount = dao.dojangCommentCount(loginId); //도장깨기 댓글 갯수
		int moimCommentCount = dao.moimCommentCount(loginId); //모임후기 댓글 갯수
		int jmtCount = dao.jmtCount(loginId); //맛집리뷰 댓글 갯수
		int commentCount = lightningCount+dojangCommentCount+moimCommentCount+jmtCount; //나의 댓글 총 갯수
		dto.setCommentCount(commentCount); //dto 에 넣기
		dto.setMember_id(loginId); //마이페이지에 뿌려줄 아이디 넣어주기
		String grade_name = dao.grade(loginId); //마이페이지에 뿌려줄 등급 가져오기
		dto.setGrade_name(grade_name); //dto 에 넣기
		String photo_new = dao.photo_new(loginId); //마이페이지에 뿌려줄 프로필 사진 가져오기
		dto.setPhoto_newFileName(photo_new); //dto 에 넣기

		return dto;
	}

	public ArrayList<MypageDTO> myBoardArry(String loginId) {

		return dao.myBoardArry(loginId);
	}

	public ArrayList<MypageDTO> myCommentArry(String loginId) {

		return dao.myCommentArry(loginId);
	}

	public ArrayList<MypageDTO> myMoimArry(String loginId) {

		return dao.myMoimArry(loginId);
	}

	public String proCon(String loginId) {

		return dao.proCon(loginId);
	}

	public ArrayList<MypageDTO> lightRoom(int profile_no) {

		return dao.lightRoom(profile_no);
	}

	public ArrayList<MypageDTO> dojangRoom(int profile_no) {

		return dao.dojangRoom(profile_no);
	}

	public ArrayList<MypageDTO> otherBoard(int profile_no) {

		return dao.otherBoard(profile_no);
	}

	public ArrayList<MypageDTO> otherCom(int profile_no) {

		return dao.otherCom(profile_no);
	}


	




}
