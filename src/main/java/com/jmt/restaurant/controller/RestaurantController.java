package com.jmt.restaurant.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jmt.restaurant.service.RestaurantService;

@Controller
public class RestaurantController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  RestaurantService service;

}
