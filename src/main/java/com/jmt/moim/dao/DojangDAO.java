package com.jmt.moim.dao;

import java.util.ArrayList;

import com.jmt.moim.dto.DojangDTO;

public interface DojangDAO {

	ArrayList<DojangDTO> dojangList(int cnt, int offset);

	int allCount();

	ArrayList<DojangDTO> foodname();


}
