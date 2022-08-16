package com.jmt.moim.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.jmt.moim.dto.LeaderDTO;

public interface LeaderDAO {

	LeaderDTO lightDetail(String idx, String loginId);

	LeaderDTO dojangDetail(String idx, String loginId);

	ArrayList<LeaderDTO> recentPost(String idx);

	ArrayList<LeaderDTO> joinWait(String idx);

	void joinWaitUpdate(HashMap<String, String> params);

	//void leaderGroupEdit(HashMap<String, String> params);

	void leaderLightningEdit(HashMap<String, String> params);

	void leaderDojangGroupEdit(HashMap<String, String> params);

	int allCount();

	ArrayList<LeaderDTO> myGroupPostSetting(int cnt, int offset);

	LeaderDTO myGroupEtc(String loginId, String class_no, String idx);

}
