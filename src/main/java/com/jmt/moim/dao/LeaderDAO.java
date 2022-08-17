package com.jmt.moim.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.jmt.moim.dto.LeaderDTO;

public interface LeaderDAO {

	LeaderDTO lightDetail(String lightning_no, String loginId);

	LeaderDTO dojangDetail(String dojang_no, String loginId);

	ArrayList<LeaderDTO> lightRecentPost(String lightning_no);
	
	ArrayList<LeaderDTO> dojangRecentPost(String dojang_no);

	LeaderDTO lightJoinWait(String lightning_no);
	
	LeaderDTO dojangJoinWait(String dojang_no);

	int lightJoinWaitUp(HashMap<String, String> params);
	
	int dojangJoinWaitUp(HashMap<String, String> params);

	//void leaderGroupEdit(HashMap<String, String> params);

	int leaderLightEdit(HashMap<String, String> params);

	int leaderDojangEdit(HashMap<String, String> params);

	int allCount(HashMap<String, Object> postSort);

	//ArrayList<LeaderDTO> myGroupPostSettingD(int cnt, int offset);

	LeaderDTO myGroupEtcD(String loginId, String dojang_no);

	ArrayList<LeaderDTO> myGroupMemberSettingD(int cnt, int offset);

	int allCount2();

	ArrayList<LeaderDTO> myGroupPostSettingD(HashMap<String, Object> postSort);

	ArrayList<LeaderDTO> dojangMember(String dojang_no);

	int memberGetOutD(HashMap<String, String> params);

	

	

	

}
