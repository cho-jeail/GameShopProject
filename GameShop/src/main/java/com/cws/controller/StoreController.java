package com.cws.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.cws.vo.CompareProductVO;
import com.cws.vo.ProductVO;
import com.cws.vo.UserVO;
import com.cws.vo.WishVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class StoreController {

	@Autowired private StoreService ss;

	// 게임 Store 메인 페이지
	@RequestMapping(value = "/gameStore/", method = RequestMethod.GET)
	public String home(Model model) {
		List<ProductVO> storeList = ss.selectAll();
		model.addAttribute("storeList", storeList);
		return "gameStore";
	}
	
	// 게임 Store 메뉴 카테고리
	@RequestMapping(value = "/gameStore/", method = RequestMethod.POST)
	public String gameStore(@RequestParam("name") String name, Model model) {
		model.addAttribute("storeList", ss.cateList(name));	
		return "gameStore";
	}
	
	// 게임 Store 페이징
	@RequestMapping(value = "/gameStore/{page}/")
	public ModelAndView storePage(@PathVariable("page") int page, HttpServletRequest request) {
		return ss.storePage(page, request);
	}

	// 게임 소개 페이지
	@RequestMapping(value = "/gameStore/gameIntro/{product}/", method = RequestMethod.GET)
	public ModelAndView introImage(@PathVariable("product") String prod, 
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("signin");
		System.out.println("product : " + prod);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gameIntro");
		mav.addObject("product", ss.select(prod));
		if(user != null) {
			String singin = user.getId();
			mav.addObject("compare", ss.selHistory(singin, prod));
		}
		return mav;
	}

	// 게임구매 팝업창
	@RequestMapping(value = "/purchasePopup/", method=RequestMethod.GET)
	public void popup() {}

	// 게임 구매"완료" 결제창
	@RequestMapping(value = "/gameStore/gameIntro/{game}/", method = RequestMethod.POST)
	public String paymentFinish(@PathVariable("game")String game, 
			@RequestParam("name")String name, 
			@RequestParam("userID")String userID, 
			@RequestParam("coupon")String coupon, 
			Model model) {
		ProductVO pvo = ss.selectInfo(name);	// 게임 정보
		UserVO user = ss.selectGetUser(userID);
		if(name.equals(game) && coupon != "") {		// 구매하기
			int cnt = 0;		// 보유중인 게임 개수
			cnt = ss.count(userID);
			List<CompareProductVO> compareList = ss.updateCoupon(name, user, cnt, coupon);
			System.out.println("쿠폰결제의 : " + coupon);
			if (compareList.get(0).getPrice() < 0)
				System.out.println("비싼 쿠폰이 사용됨");
				model.addAttribute("msg", "쿠폰금액이 결제금액 보다 많습니다. 결제를 진행하시겠습니까?");
			model.addAttribute("compareList", compareList);
			return "redirect:/";
		}
		else if(name.equals(game)) {
			int cnt = 0;		// 보유중인 게임 개수
			cnt = ss.count(userID);
			List<CompareProductVO> compareList = ss.update(name, user, cnt);
			model.addAttribute("compareList", compareList);
			return "redirect:/";
		}
		else if(name.equals(pvo.getId())) {	// 위시리스트
			int cnt = 0;		// 보유중인 게임 개수
			cnt = ss.wishCount(userID);
			List<WishVO> wishList = ss.addWish(game, user, cnt);
			model.addAttribute("wishList", wishList);

			return "redirect:/";
		}
		else return "exhaust";
	}

	// 위시리스트 항목 삭제
	@RequestMapping(value = "/mypage/basket/{product}", produces="application/text;charset=utf8")
	@ResponseBody
	public String delProduct(@PathVariable("product")String product) {
		String jsonString = null;
		ObjectMapper jsonMapper = new ObjectMapper();
		try {
			jsonString = jsonMapper.writeValueAsString(ss.delProduct(product));
			System.out.println("요것은" + jsonString);
		} catch (JsonProcessingException e) {
			System.out.println("JSON 파싱 에러 !!");
		}
		return jsonString;
	}
}
