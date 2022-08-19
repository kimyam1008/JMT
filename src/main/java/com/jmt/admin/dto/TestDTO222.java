package com.jmt.admin.dto;

import java.util.ArrayList;

public class TestDTO222 {
private ArrayList<Grade_DTO> gradelist;

public ArrayList<Grade_DTO> getGradelist() {
	return gradelist;
}

public void setGradelist(ArrayList<Grade_DTO> gradelist) {
	this.gradelist = gradelist;
}

@Override
public String toString() {
	return "TestDTO222 [gradelist=" + gradelist + "]";
}




}
