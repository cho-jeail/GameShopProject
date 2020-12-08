package com.cws.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cws.dao.StoreDAO;
import com.cws.vo.ProductVO;

@Service
public class StoreService {
	
	@Autowired private StoreDAO sd;

	public List<ProductVO> selectAll() {
		System.out.println("넘어옴");
//		ModelAndView mav = new ModelAndView();
		List<ProductVO> storeList = sd.storeSelectAll();
//		mav.setViewName("/gameStore/");
//		mav.addObject("storeList", storeList);
		return storeList;
	}
	
	public List<ProductVO> select(String product) {
		System.out.println("product : " + product);
//		ModelAndView mav = new ModelAndView();
		List<ProductVO> gameList = sd.storeSelect(product);
//		mav.setViewName("/gameStore/gameIntro/"+ product + "/");
//		mav.addObject("gameList", gameList);
//		return mav;
		return gameList;
	}
	
}
