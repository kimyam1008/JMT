package com.jmt.moim.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.jmt.moim.dto.LightningDTO;

public interface LightningDAO {

	ArrayList<LightningDTO> foodList();
	
	ArrayList<LightningDTO> selectedList(HashMap<String, Object> selectedparams);

	int allCount(HashMap<String, Object> selectedparams);

	void changeStatus();

	LightningDTO detail(String lightning_no, String loginId);

	int register(String lightning_no, String loginId);

	void dropout(String loginId, String lightning_no);

	LightningDTO profile(String loginId);

	int report(HashMap<String, String> params);

	void delete(String lightning_no);

	int cmtReport(HashMap<String, String> params); 

	void cmtDel(String lightning_no);

	int profileChk(String loginId);

	ArrayList<LightningDTO> resList(HashMap<String, String> param);

	void lightCreate(HashMap<String, String> params);

	void Delnoti(String lightning_no);

}
