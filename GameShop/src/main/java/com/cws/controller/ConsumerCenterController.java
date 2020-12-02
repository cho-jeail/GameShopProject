package com.cws.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cws.service.ConsumerCenterService;

@Controller
public class ConsumerCenterController {

	@Autowired private ConsumerCenterService ccs;
	
	@RequestMapping(value = "/CC/", method = RequestMethod.GET)
	public ModelAndView CCMain() {
		return ccs.CCMain();
	}
}
