package com.jmt.moim.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.jmt.moim.dto.LeaderDTO;

public interface LeaderDAO {

	LeaderDTO lightDetail(String lightning_no, String loginId);

	LeaderDTO dojangDetail(String dojang_no, String loginId);

	ArrayList<LeaderDTO> lightRecentPost(String lightning_no);
	
	ArrayList<LeaderDTO> dojangRecentPost(String dojang_no);

	ArrayList<LeaderDTO> lightJoinWait(String lightning_no);
	
	ArrayList<LeaderDTO> dojangJoinWait(String dojang_no);

	int lightJoinWaitUp(HashMap<String, String> params);
	
	int dojangJoinWaitUp(HashMap<String, String> params);

	//void leaderGroupEdit(HashMap<String, String> params);

	int leaderLightEdit(HashMap<String, String> params);

	int leaderDojangEdit(HashMap<String, String> params);

	int allCount(HashMap<String, Object> postSort);

	//ArrayList<LeaderDTO> myGroupPostSettingD(int cnt, int offset);

	LeaderDTO myGroupEtcD(String loginId, String dojang_no);
	
	LeaderDTO myGroupEtcL(String loginId, String lightning_no);

	ArrayList<LeaderDTO> myGroupMemberSettingD(int cnt, int offset);

	int allCount2(HashMap<String, Object> postSort);

	ArrayList<LeaderDTO> myGroupPostSettingD(HashMap<String, Object> postSort);

	ArrayList<LeaderDTO> dojangMember(String dojang_no);

	int memberGetOutD(HashMap<String, String> params);

	ArrayList<LeaderDTO> myGroupPostSettingL(HashMap<String, Object> postSort2);

	ArrayList<LeaderDTO> lightMember(String lightning_no);

	int memberGetOutL(HashMap<String, String> params);

	int leaderLightDelete(String lightning_no);

	int leaderDojangDelete(String dojang_no);

	void lightDelNoti(String lightning_no);

	void DojangDelNoti(String dojang_no);

	void lightGetOutNoti(HashMap<String, String> params);

	void DojangGetOutNoti(HashMap<String, String> params);

	void JoinStatusChangeNoti(HashMap<String, String> params);

	void JoinStatusChangeNotiD(HashMap<String, String> params);



}
