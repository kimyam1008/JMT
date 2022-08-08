package com.jmt.member.dao;

import java.util.HashMap;

public interface MemberDAO {

	int join(HashMap<String, String> params);

	String idoverlay(String chkId);

	String emailoverlay(String chkEmail);

	String login(String id, String pw);

	String getMbClass(String id, String pw);

	String idFind(String email, String birth);

	String pwFind(String id, String email);

	int pwUpdate(String id, String pw);

}
