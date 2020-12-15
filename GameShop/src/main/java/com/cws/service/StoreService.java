package com.cws.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cws.dao.StoreDAO;
import com.cws.vo.CompareProductVO;
import com.cws.vo.ProductVO;
import com.cws.vo.UserVO;

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
		System.out.println("gameList : " + gameList.get(0));
		return gameList;
	}

	// 결제한 게임을 개인의 유저목록에 추가함
	public List<CompareProductVO> update(String game, UserVO user, int cnt) {
		CompareProductVO compare = new CompareProductVO();
		ProductVO pvo = sd.productSelect(game);
		
		compare.setUserid(user.getId());
		compare.setId(pvo.getId());
		compare.setName(pvo.getName());
		compare.setPrice(pvo.getPrice());
		compare.setInfo(pvo.getInfo());
		compare.setDeveloper(pvo.getDeveloper());
		compare.setPublisher(pvo.getPublisher());
		compare.setTags(pvo.getTags());
		compare.setPlatform(pvo.getPlatform());
		compare.setController(pvo.getController());
		compare.setRating(pvo.getRating());
		compare.setLanguages(pvo.getLanguages());
		compare.setKind(pvo.getKind());
		System.out.println("이건 대체 뭘까 : " + compare.getUserid());
		
		List<CompareProductVO> compareList = sd.compareSelect(compare.getUserid());
		System.out.println("game : " + game);
		System.out.println(compareList.size());
		System.out.println(cnt);
		
		if(compareList.size() == 0)
			sd.compareInsert(compare);
		else {
			for(int i = 0; i < cnt; i ++) {
				if(!game.equals(compareList.get(i).getName()))
					sd.compareInsert(compare);
			}
		}
		
		return compareList;
	}

	// 게임을 결제한 유저의 ID값을 받아옴
	public UserVO selectGetUser(String userSession) {
		return sd.selectGetUser(userSession);
	}

	// 한 유저가 보유한 게임 개수
	public int count(String userID) {
		return sd.count(userID);
	}
	
}
