package com.cws.dao;

import java.util.List;

import com.cws.vo.CompareProductVO;
import com.cws.vo.ProductVO;
import com.cws.vo.UserVO;

public interface StoreDAO {

	List<ProductVO> storeSelectAll();

	List<ProductVO> storeSelect(String product);

	UserVO selectGetUser(String userSession);

	void compareInsert(CompareProductVO compare);

	List<CompareProductVO> compareSelect(String userid);

	ProductVO productSelect(String game);

	
}
