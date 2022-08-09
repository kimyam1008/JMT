package com.jmt.moim.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.jmt.moim.dto.LightningDTO;

public interface LightningDAO {

	ArrayList<LightningDTO> foodList();
	
	ArrayList<LightningDTO> selectedList(HashMap<String, Object> selectedparams);

	int allCount(HashMap<String, Object> selectedparams);

	void changeStatus();

	LightningDTO detail(String lightning_no);

}
