package com.jmt.moim.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.jmt.moim.dto.DojangDTO;

public interface DojangDAO {

	int allCount(HashMap<String, Object> searchResult);

	ArrayList<DojangDTO> foodname();

	ArrayList<DojangDTO> dojangList(HashMap<String, Object> searchResult);

	DojangDTO dojangDetail(String dojang_no);

	ArrayList<DojangDTO> dojangGreview(String dojang_no);

	int dojangApply(String dojang_no, String loginId);

	DojangDTO applyStatus(String loginId, String dojang_no);


}
