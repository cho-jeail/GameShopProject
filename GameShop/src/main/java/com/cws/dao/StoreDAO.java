package com.cws.dao;

import java.util.List;

import com.cws.vo.CompareProductVO;
import com.cws.vo.CouponVO;
import com.cws.vo.NoticeBoardVO;
import com.cws.vo.PagingParamsVO;
import com.cws.vo.ProductVO;
import com.cws.vo.StorePagingVO;
import com.cws.vo.UserVO;
import com.cws.vo.WishVO;

public interface StoreDAO {

	List<ProductVO> storeSelectAll(PagingParamsVO ppv);

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

	List<ProductVO> newList();

	List<ProductVO> freeList();

	List<ProductVO> favoList();

	List<ProductVO> discList(String disc);

	CouponVO findCoupon(CouponVO cvo);

	void deleteCoupon(CouponVO cvo);

	int selectCount();

	List<ProductVO> pageAll(StorePagingVO spv);

	List<NoticeBoardVO> selectBoard();

	int selectProductCount();

	List<ProductVO> kindList(String kind);

	List<ProductVO> developerList(String developer);

	List<ProductVO> filterSelect(ProductVO pvo);

	List<CouponVO> selectCoupon(String id);

	List<ProductVO> selectRecommend();
	
}
