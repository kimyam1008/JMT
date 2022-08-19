package com.jmt.main.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jmt.main.service.MainService;

@Controller
public class MainController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired MainService service;

	@RequestMapping(value = "/")
	public String main(Model model,HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
	    model.addAttribute("loginId", loginId);
		return "./Main/main";
	}
	
}
