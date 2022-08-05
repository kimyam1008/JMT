package com.jmt.moim.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jmt.moim.service.DojangService;

@Controller
public class DojangController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  DojangService service;

}
