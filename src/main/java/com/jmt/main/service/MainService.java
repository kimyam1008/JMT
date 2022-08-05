package com.jmt.main.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmt.main.dao.MainDAO;

@Service
public class MainService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MainDAO dao;

}
