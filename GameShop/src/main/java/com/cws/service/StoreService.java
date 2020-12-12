package com.cws.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cws.dao.StoreDAO;
import com.cws.vo.ProductVO;

@Service
public class StoreService {
	
	@Autowired private StoreDAO sd;

	// 전체 상품목록을 불러옴
	public List<ProductVO> selectAll() {
		System.out.println("넘어옴");
		List<ProductVO> storeList = sd.storeSelectAll();
		return storeList;
	}
	
	// 단일 상품의 정보를 불러옴
	public List<ProductVO> select(String product) {
		System.out.println("product : " + product);
		List<ProductVO> gameList = sd.storeSelect(product);
		return gameList;
	}
	
}
