package com.jmt.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

import com.jmt.member.dto.MemberDTO;
import com.jmt.member.dto.photoDTO;

public interface MypageDAO {

	MemberDTO mypage(String loginId);

	int blindCount(String loginId);

	int follower(String loginId);

	int following(String loginId);

	int profile_no(String loginId);

	photoDTO photoList(int profile_no);

	ArrayList<MemberDTO> foodList();

	String oriPass(HashMap<String, String> params);

	int passUpdate(HashMap<String, String> params);

	int profile_num(MemberDTO dto);

	int profileUpdate(MemberDTO dto);

	int memberUpdate(MemberDTO dto);

	int photoDel(int profile_no);

	void fileWrite(String oriFileName, String newFileName, int profile_no);

	




}
