package com.cws.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.cws.vo.CouponVO;
import com.cws.vo.PagingParamsVO;
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
	public String home(Model model, HttpServletRequest request) {
		String pag = request.getParameter("page");
		int page = Integer.parseInt(pag);
		int AllCount = ss.selectProductCount();
		
		PagingParamsVO ppv = new PagingParamsVO(page, AllCount);
		List<ProductVO> storeList = ss.selectAll(ppv);
		
		model.addAttribute("storeList", storeList);
		model.addAttribute("PageParam", ppv);
		
		return "gameStore";
	}
	
	// 게임 Store 메뉴 카테고리
	@RequestMapping(value = "/gameStore/", method = RequestMethod.POST)
	public String gameStore(HttpServletRequest request, Model model) {
		System.out.println("gameStore : POST");
		String name = request.getParameter("name");
		String kind = request.getParameter("kind");
		String developer = request.getParameter("developer");
		String pag = request.getParameter("page");
		int page = Integer.parseInt(pag);
		int AllCount = ss.selectProductCount();
		
		System.out.println("gameStore : " + name); 
		System.out.println("gameStore : " + kind); 
		System.out.println("gameStore : " + developer); 
		
		if(name == null && (developer == null && kind == null)) {
			PagingParamsVO ppv = new PagingParamsVO(page, AllCount);
			List<ProductVO> storeList = ss.selectAll(ppv);
			
			model.addAttribute("storeList", storeList);
			model.addAttribute("PageParam", ppv);
			
			return "gameStore";
		}
		else if(developer == null && kind == null) {
			model.addAttribute("storeList", ss.cateList(name));
			return "gameStore";
		}
		else if(developer == "" && kind == "") {
			PagingParamsVO ppv = new PagingParamsVO(page, AllCount);
			List<ProductVO> storeList = ss.selectAll(ppv);
			
			model.addAttribute("storeList", storeList);
			model.addAttribute("PageParam", ppv);
			
			return "gameStore";
		}
		else if(developer != null || kind != null) {
			System.out.println("필터에 들어옴");
			List<ProductVO> list = ss.filterSelect(developer, kind);
			model.addAttribute("storeList", list);
			return "gameStore";
		}
		return "exhaust";
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
			mav.addObject("compare", ss.selHistory(user.getId(), prod));
			List<CouponVO> coupon = ss.selectCoupon(user.getId());
			if(coupon != null) {
				System.out.println("coupon : " + coupon.get(0).getName());
				mav.addObject("coupon", coupon);
			}
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
			HttpServletResponse response,
			Model model) {
		ProductVO pvo = ss.selectInfo(name);	// 게임 정보
		UserVO user = ss.selectGetUser(userID);
		if(name.equals(game) && coupon != "") {		// 구매하기
			int cnt = 0;		// 보유중인 게임 개수
			cnt = ss.count(userID);
			List<CompareProductVO> compareList = ss.updateCoupon(name, user, cnt, coupon);
			System.out.println("쿠폰결제의 : " + coupon);
			if (compareList == null) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out;
				try {
					System.out.println("비싼 쿠폰이 사용됨");
					List<CouponVO> c = ss.selectCoupon(userID);
					out = response.getWriter();
					out.println("<script>alert('쿠폰 정보를 확인해주세요');</script>");
		            out.flush();
					model.addAttribute("userCoupons", c);
		            return "mypageCoupon";
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
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
