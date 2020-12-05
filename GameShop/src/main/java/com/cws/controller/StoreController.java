package com.cws.controller;

import java.sql.Blob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cws.service.StoreService;

@Controller
public class StoreController {
	
	@Autowired private StoreService ss;
	
	// 게임 Store 메인 페이지
//	@RequestMapping(value = "/gameStore/{product}/", method = RequestMethod.GET)
//	public String home(@PathVariable String product, Model model) {
//		model.addAttribute("product", product);
//		return "gameStore";
//	}
	
	@RequestMapping(value = "/gameStore/", method = RequestMethod.GET)
	public String gameStore() {
//		model.addAttribute("product", product);
		return "gameStore";
	}
	
	// 게임 소개하고 구매하는 페이지
	@RequestMapping(value = "/gameIntro/", method = RequestMethod.GET)
	public ModelAndView intro() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gameIntro");
		
		return mav;
	}
	
	// 게임 구매 결제창
	@RequestMapping(value = "/gameStore/gameIntro/payment/", method = RequestMethod.GET)
	public String payment() {
		
		return "payment";
	}
	
	// 게임 구매"완료" 결제창
	@RequestMapping(value = "/gameStore/gameIntro/payment/paymentFinish/", method = RequestMethod.GET)
	public String paymentFinish() {
		
		return "paymentFinish";
	}
	
	// 게임 구매 장바구니
	@RequestMapping(value = "/basket/", method = RequestMethod.GET)
	public String basket() {
		
		return "basket";
	}
}
