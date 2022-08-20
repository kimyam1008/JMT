package com.jmt.main.dao;

import java.util.ArrayList;

import com.jmt.main.dto.MainDTO;

public interface MainDAO {

	ArrayList<MainDTO> lightDto();

	ArrayList<MainDTO> dojangDto();

	ArrayList<MainDTO> resDto();

	ArrayList<MainDTO> grDto();

	ArrayList<MainDTO> lightReco(String loginId);

	ArrayList<MainDTO> dojangReco(String loginId);

}
