package com.jmt.moim.dao;

import java.util.ArrayList;

import com.jmt.moim.dto.LeaderDTO;

public interface LeaderDAO {

	LeaderDTO lightDetail(String idx, String loginId);

	LeaderDTO dojangDetail(String idx, String loginId);

	ArrayList<LeaderDTO> recentPost(String idx);

	ArrayList<LeaderDTO> joinWait(String idx);

}
