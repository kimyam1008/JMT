package com.jmt.moim.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.jmt.moim.dto.LightningDTO;

public interface LightningDAO {

	ArrayList<LightningDTO> foodList();

	ArrayList<LightningDTO> list();

	ArrayList<LightningDTO> selectedList(HashMap<String, String> params);

}
