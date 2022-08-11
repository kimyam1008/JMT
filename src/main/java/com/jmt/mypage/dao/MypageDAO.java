package com.jmt.mypage.dao;

import java.util.ArrayList;

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


}
