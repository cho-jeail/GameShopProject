package com.cws.dao;

import java.util.List;

import com.cws.vo.CompareProductVO;
import com.cws.vo.ProductVO;
import com.cws.vo.UserVO;
import com.cws.vo.WishVO;

public interface StoreDAO {

	List<ProductVO> storeSelectAll();

	List<ProductVO> storeSelect(String product);

	UserVO selectGetUser(String userSession);

	void compareInsert(CompareProductVO compare);

	List<CompareProductVO> compareSelect(String userid);

	ProductVO productSelect(String name);

	int count(String userID);

	List<WishVO> wishSelect(String userid);

	void wishInsert(WishVO wv);

	List<WishVO> wishSelectAll(String product);

	void delProduct(String product);

	ProductVO selectName(String game);

	ProductVO selectInfo(String name);

	int wishCount(String userID);

	List<WishVO> wishList(String name);
	
}
