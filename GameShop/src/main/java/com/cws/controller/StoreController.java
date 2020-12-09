package com.cws.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cws.service.StoreService;
import com.cws.vo.ProductVO;

@Controller
public class StoreController {

	@Autowired private StoreService ss;

	// 게임 Store 메인 페이지
	@RequestMapping(value = "/gameStore/", method = RequestMethod.GET)
	public String home(Model model) {
		System.out.println("넘어옴");
		List<ProductVO> storeList = ss.selectAll();
		model.addAttribute("storeList", storeList);
		return "gameStore";

	}

	// 게임 소개하고 구매하는 페이지
	@RequestMapping(value = "/gameStore/gameIntro/{product}/", method = RequestMethod.GET)
	public ModelAndView introImage(@PathVariable("product") String prod) {
		//			String product = request.getParameter(name);
		System.out.println("product : " + prod);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gameIntro");
		mav.addObject("product", ss.select(prod));
		return mav;
	}
	
	// 게임구매 팝업창
	@RequestMapping(value = "/purchasePopup/", method=RequestMethod.GET)
	public String popup() {
		
		return "purchasePopup()";
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
