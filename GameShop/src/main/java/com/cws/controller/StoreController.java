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
		System.out.println("넘어옴");
		List<ProductVO> storeList = ss.selectAll();
		model.addAttribute("storeList", storeList);
		return "gameStore";

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
			mav.addObject("compare", ss.selHistory(singin));
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
			Model model) throws NullPointerException {
		System.out.println("결제창 들어옴!!! : " + game);
		System.out.println("결제창 들어옴 : " + name);
		ProductVO pvo = ss.selectInfo(name);	// 게임 정보
//		System.out.println("pvo : " + name.equals(pvo.getName()));
//		System.out.println("list" + list.size());
		UserVO user = ss.selectGetUser(userID);
//		System.out.println("userid : " + user.getId());

//		System.out.println("cnt : " + cnt);
//		System.out.println(pvo2.getName());
		if(name.equals(game)) {		// 구매하기
//			System.out.println("구매하기" + pvo.getName());
			int cnt = 0;		// 보유중인 게임 개수
			cnt = ss.count(userID);
			List<CompareProductVO> compareList = ss.update(name, user, cnt);
			model.addAttribute("compareList", compareList);
			return "redirect:/";
		}
		else if(name.equals(pvo.getId())) {	// 위시리스트
//			System.out.println("위시리스트" + pvo.get(i).getInfo());
			System.out.println("위시리스트 들어옴");
			System.out.println("game : " + game);
			int cnt = 0;		// 보유중인 게임 개수
			cnt = ss.wishCount(userID);
			List<WishVO> wishList = ss.addWish(game, user, cnt);
			model.addAttribute("wishList", wishList);

			return "redirect:/";
		}
		else return "exhaust";
	}

	// 위시리스트 항목 삭제
	@RequestMapping(value = "/mypage/basket/{product}", 
			produces="application/text;charset=utf8")
	@ResponseBody
	public String delProduct(@PathVariable("product")String product) {
		System.out.println("삭제product : " + product);
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
