package com.jmt.member.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jmt.member.dao.MemberDAO;
import com.jmt.member.dto.MemberDTO;

@Service
public class MemberService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired MemberDAO dao;

	public HashMap<String, Object> join(HashMap<String, String> params) {
		logger.info("회원 가입 서비스");
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		String hashText = "";
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		hashText = encoder.encode(params.get("pw")); //입력받은 pw를 암호화 하기
		logger.info(hashText);
		
		params.put("pw", hashText); //암호화 한 pw를 params 에 넣기
		
		int row = dao.join(params); //입력받은 정보로 회원가입 하기
		boolean success = false;
		
		if(row>0) { // 정보를 DB 에 저장하는 것이 성공하면 success 를 true 로 바꾸기
			success = true;
		}

		result.put("success", success); // 결과 값 넣기
		
		return result;
	}

	public HashMap<String, Object> idoverlay(String chkId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String overId = dao.idoverlay(chkId); // 입력받은 아이디 DB 에 조회해서 값 가져오기
		logger.info("중복 아이디가 있나? "+overId);
		boolean over = overId == null ? false : true; //아이디없음(false) : 아이디있음(true)
		map.put("idoverlay", over); // 결과 값 넣기
		
		return map;
	}

	public HashMap<String, Object> emailoverlay(String chkEmail) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String overEmail = dao.emailoverlay(chkEmail); // 입력받은 이메일 DB 에 조회해서 값 가져오기
		logger.info("중복 이메일이 있나? "+overEmail);
		boolean over = overEmail == null ? false : true; //이메일없음(false) : 이메일있음(true)
		map.put("emailoverlay", over); // 결과 값 넣기
		
		return map;
	}

	public String login(String id, String hashText) {
		logger.info("로그인 서비스");
		return dao.login(id,hashText);
	}

	public String getMember_status(String id, String hashText) {
		
		return dao.getMbClass(id,hashText);
	}

	public ModelAndView idFind(String email, String birth) {
		String idFind = dao.idFind(email, birth); // 이메일과 생년월일로 id 찾기
		logger.info("아이디 : "+idFind);
		ModelAndView mav = new ModelAndView(); //페이지와 메세지를 동시에 주기 위해 사용
		String msg = null;
		String page = null;
		if(idFind != null) { //조회한 아이디가 존재한다면 경고창으로 알려주고 로그인 페이지로 보내기
			msg = "회원님의 아이디는 "+"'"+idFind+"'"+" 입니다.";
			page = "/Member/login";
		} else { //아이디가 존재하지 않는다면 경고창으로 알려주고 그 페이지 유지하기
			msg = "존재하지 않는 회원입니다.";
			page = "/Member/idFind";
		}
		
		mav.addObject("msg",msg); // 메세지 넣기
		mav.setViewName(page); // 페이지 넣기
		
		return mav;
	}

	public String pwFind(String id, String email) {
		
		return dao.pwFind(id, email);
	}

	public HashMap<String, Object> pwUpdate(String id, String pw) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String hashText = "";
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		hashText = encoder.encode(pw); //입력받은 pw를 암호화 하기
		logger.info(hashText);
		
		int row = dao.pwUpdate(id, hashText); //암호화 한 pw 를 DB 에 업데이트 해주기
		boolean success = false;
		
		if(row>0) { //DB 넣는 것을 성공하면 true 로 바꿔주기
			success = true;
			map.put("success", success); // 결고 값 넣어주기
		}
		
		return map;
	}

	public void profileRegister(MultipartFile[] photos, HashMap<String, Object> params) {
		
		MemberDTO dto = new MemberDTO();
		dto.setFood_no(Integer.parseInt((String) params.get("food_no")));
		dto.setMember_id((String) params.get("loginId"));
		dto.setEat_speed((String) params.get("speed"));
		dto.setProfile_gender((String) params.get("gender"));
		dto.setProfile_job((String) params.get("job"));
		
		int row = dao.profileRegister(dto); //프로필 등록하기
		
		int profile_no = dto.getProfile_no();
		logger.info("방금 넣은 프로필 번호 : "+profile_no);
		
		if (row > 0) { //프로필 등록이 완료되면
			fileSave(photos, profile_no); //회원이 등록한 사진 넣기
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
	

	public String profileExist(String loginId) {
		
		return dao.profileExist(loginId);
	}

	public ArrayList<MemberDTO> foodList() {
		
		return dao.foodList();
	}

	public String con(String id) {
		
		return dao.con(id);
	}

	
	

}
