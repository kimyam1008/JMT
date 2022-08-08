package com.jmt.moim.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.jmt.moim.dto.DojangDTO;

public interface DojangDAO {

	int allCount(HashMap<String, Object> searchResult);

	ArrayList<DojangDTO> foodname();

	ArrayList<DojangDTO> dojangList(HashMap<String, Object> searchResult);


}
