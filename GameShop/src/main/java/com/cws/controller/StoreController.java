package com.cws.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cws.service.StoreService;

@Controller
public class StoreController {
	
	@Autowired private StoreService ss;
	
	@RequestMapping(value = "/GameStore/", method = RequestMethod.GET)
	public String Store() {
		
		return "GameStore";
	}
	
	@RequestMapping(value = "/GameStore/GameIntro", method = RequestMethod.GET)
	public String Intro() {
		
		return "GameIntro";
	}
}
