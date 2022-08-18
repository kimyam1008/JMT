package com.jmt.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.jmt.member.dto.MemberDTO;

public interface MemberDAO {

	int join(HashMap<String, String> params);

	String idoverlay(String chkId);

	String emailoverlay(String chkEmail);

	String login(String id, String hashText);

	String getMbClass(String id, String hashText);

	String idFind(String email, String birth);

	String pwFind(String id, String email);

	int pwUpdate(String id, String hashText);

	int profileRegister(MemberDTO dto);

	String profileExist(String loginId);

	ArrayList<MemberDTO> foodList();

	String con(String id);

	void fileWrite(String oriFileName, String newFileName, int profile_no);




}
