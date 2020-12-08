package com.cws.dao;

import java.util.List;

import com.cws.vo.ProductVO;

public interface StoreDAO {

	List<ProductVO> storeSelectAll();

	List<ProductVO> storeSelect(String product);

}
