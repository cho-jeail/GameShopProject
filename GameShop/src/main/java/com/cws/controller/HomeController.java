package com.cws.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cws.service.ConsumerCenterService;
import com.cws.service.StoreService;
import com.cws.service.UserService;
import com.cws.vo.CouponVO;
import com.cws.vo.OutReasonVO;
import com.cws.vo.ProductVO;
import com.cws.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired private UserService UServ;
	@Autowired private ConsumerCenterService CCS;
	@Autowired private StoreService ss;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("BoardList", ss.selectBoard());
		model.addAttribute("storeList", ss.selectRecommend());
		return "home";
	}
	
	@RequestMapping(value = "/siteInfo/")
	public void siteInfo() {}
	
	@RequestMapping(value = "/signin")
	public void signInMain() {}
	
	@RequestMapping(value = "/policy")
	public void policyMain() {}
	
	@RequestMapping(value = "/join")
	public void joinMain() {}
	
	@RequestMapping(value = "/jusoPopup")
	public void jusoPopupMain() {}
	
	@RequestMapping(value = "/findpwd")
	public void findpwd() {}
	
	@RequestMapping(value = "/mypage")
	public void mypage() {}
	
	@RequestMapping(value = "join/", method = RequestMethod.POST)
	public ModelAndView joinForm(UserVO vo) {
		return UServ.joinUser(vo);
	}
	
	@RequestMapping(value = "updateInfo/", method = RequestMethod.POST)
	public ModelAndView updateInfo(UserVO vo, HttpSession session) {
		return UServ.updateUser(vo, session);
	}
		
	@RequestMapping(value = "/mypage/mypQna/", method = RequestMethod.GET)
	public ModelAndView MypageQna(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String naverState = (String)session.getAttribute("naverState");
		if(naverState == null) {
			return CCS.MypageQna(req);
		}
		return naverLoginSF();
	}
	
	@RequestMapping(value = "/mypage/mypQna/{id}/", method = RequestMethod.GET)
	public ModelAndView QnaBoardView(@PathVariable("id") int id) {
		return CCS.QnaBoardView(id);
	}
	
	@RequestMapping(value = "/mypage/mypageMemberOut/")
	public ModelAndView memberOutView(HttpSession session) {
		String naverState = (String)session.getAttribute("naverState");
		if(naverState == null) {
			ModelAndView mav = new ModelAndView("mypageMemberOut");
			return mav;
		}
		return naverLoginSF();
	}
	
	@RequestMapping(value = "/mypage/mypageCoupon/")
	public ModelAndView mypageCouponView(HttpSession session) { 
		UserVO vo = (UserVO)session.getAttribute("signin");
		String naverState = (String)session.getAttribute("naverState");
		if(naverState == null) {
			return UServ.selectCoupons(vo.getId());
		}
		return naverLoginSF();
	}
	
	@RequestMapping(value = "/mypage/mypageMemberOut/", method = RequestMethod.POST)
	public ModelAndView memberOut(OutReasonVO vo, HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
		return UServ.memberOut(vo, session, req, resp);
	}
	
	@RequestMapping(value = "/mypage/mypageCoupon/regCoupon/", method = RequestMethod.POST)
	public ModelAndView insertCoupon(CouponVO vo) {
		return UServ.insertCoupon(vo);
	}
	
	@RequestMapping(value = "/mypage/compareProduct/", method = RequestMethod.GET)
	public ModelAndView compareProduct (HttpServletRequest request) {
		HttpSession session = request.getSession();
		String name = ((UserVO)session.getAttribute("signin")).getId();
		String naverState = (String)session.getAttribute("naverState");
		if(naverState == null) {
			return ss.compareSelectAll(name);
		}
		return naverLoginSF();
	}
	
	@RequestMapping(value = "/mypage/basket/", method = RequestMethod.GET)
	public ModelAndView basket (HttpServletRequest request) {
		System.out.println("위시리스트mpg");
		HttpSession session = request.getSession();
		String name = ((UserVO)session.getAttribute("signin")).getId();
		String naverState = (String)session.getAttribute("naverState");
		if(naverState == null) {
			return ss.wishList(name);
		}
		return naverLoginSF();
	}
	
	@RequestMapping(value = "/info/", method = RequestMethod.GET)
	public ModelAndView searchWord(@RequestParam("word") String word, HttpServletRequest request) {
		System.out.println("검색이 들어온다!!!! : " + word);
		return ss.searchWord(word);
	}
	
	@RequestMapping(value = "/info/", method = RequestMethod.POST)
	public String gameStore(HttpServletRequest request, Model model) {
		System.out.println("gameStore : POST");
		String name = request.getParameter("name");
		String kind = request.getParameter("kind");
		String developer = request.getParameter("developer");
		
		
		System.out.println("gameStore : " + name); 
		System.out.println("gameStore : " + kind); 
		System.out.println("gameStore : " + developer); 
		
		if(developer == null && kind == null) {
			model.addAttribute("storeList", ss.cateList(name));
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
	
	public ModelAndView naverLoginSF() {
		ModelAndView mav = new ModelAndView("redirect");
		mav.addObject("msg", "네이버 아이디로 로그인하신 경우 해당기능을 이용하실 수 없습니다.");
		mav.addObject("url", "mypage");
		return mav;
	}
}
