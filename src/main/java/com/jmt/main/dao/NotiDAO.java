package com.jmt.main.dao;

import java.util.ArrayList;

import com.jmt.main.dto.NotiDTO;

public interface NotiDAO {

	int notiChk(String loginId);

	ArrayList<NotiDTO> notiList(String loginId);

	

}
