package com.jmt.moim.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.jmt.moim.dto.LeaderDTO;

public interface LeaderDAO {

	LeaderDTO lightDetail(String lightning_no, String loginId);

	LeaderDTO dojangDetail(String dojang_no, String loginId);

	ArrayList<LeaderDTO> recentPost();

	ArrayList<LeaderDTO> joinWait();

	void joinWaitUpdate(HashMap<String, String> params);

	//void leaderGroupEdit(HashMap<String, String> params);

	void leaderLightningEdit(HashMap<String, String> params);

	void leaderDojangGroupEdit(HashMap<String, String> params);

	int allCount();

	ArrayList<LeaderDTO> myGroupPostSetting(int cnt, int offset);

	LeaderDTO myGroupEtc(String loginId, String class_no, String idx);

	ArrayList<LeaderDTO> myGroupMemberSetting(int cnt, int offset);

	int allCount2();

}
