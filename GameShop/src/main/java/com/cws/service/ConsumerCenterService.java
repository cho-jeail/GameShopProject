package com.cws.service;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class ConsumerCenterService {

	public ModelAndView CCMain() {
		ModelAndView mav = new ModelAndView("consumerCenter");
		
		return mav;
	}
}
