package com.jmt.main.dao;

import java.util.ArrayList;

import com.jmt.main.dto.MainDTO;

public interface MainDAO {

	ArrayList<MainDTO> lightDto();

	ArrayList<MainDTO> dojangDto();

	ArrayList<MainDTO> resDto();

	ArrayList<MainDTO> grDto();

}
