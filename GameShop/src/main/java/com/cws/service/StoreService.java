package com.cws.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.cws.dao.StoreDAO;
import com.cws.vo.CompareProductVO;
import com.cws.vo.ProductVO;
import com.cws.vo.UserVO;
import com.cws.vo.WishVO;

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
	public List<CompareProductVO> update(String name, UserVO user, int cnt) {
		CompareProductVO compare = new CompareProductVO();
		ProductVO pvo = sd.productSelect(name); 
		
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
		
		//		구매한 목록을 불러오는 compareList
		List<CompareProductVO> compareList = sd.compareSelect(compare.getUserid());
		
		//		구매한 리스트의 크기
//		System.out.println("리스트 크기" + compareList.size());
		
		//		유저가 구매한 게임의 갯수
//		System.out.println("cnt : " + cnt);
		
		if(compareList.size() == 0) {
			sd.compareInsert(compare);
		}
		else {
//			for(int i = 0; i < cnt; i ++) {
//				if(!name.equals(compareList.get(i).getName()) == true) {
//					System.out.println("과연? " + (game.equals(compareList.get(i).getName()) == true));
					sd.compareInsert(compare);
//				}
//			}
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

	public List<WishVO> addWish(String name, UserVO user, int cnt) {
		WishVO wv = new WishVO();
		ProductVO pvo = sd.productSelect(name); 
		System.out.println("info : " + name);
		
		wv.setUserid(user.getId());
		wv.setId(pvo.getId());
		wv.setName(pvo.getName());
		wv.setPrice(pvo.getPrice());
		wv.setInfo(pvo.getInfo());
		wv.setDeveloper(pvo.getDeveloper());
		wv.setPublisher(pvo.getPublisher());
		wv.setTags(pvo.getTags());
		wv.setPlatform(pvo.getPlatform());
		wv.setController(pvo.getController());
		wv.setRating(pvo.getRating());
		wv.setLanguages(pvo.getLanguages());
		wv.setKind(pvo.getKind());
		
		List<WishVO> wishList = sd.wishSelect(user.getId());
		
		if(wishList.size() == 0) {
			sd.wishInsert(wv);
		}
		else {
//			for(int i = 0; i < cnt; i ++) {
//				if(!name.equals(wishList.get(i).getName()) == true) {
					sd.wishInsert(wv);
//				}
//			}
		}
		
		return wishList;
	}

	// 위시리스트 전체 항목을 불러옴
	public List<WishVO> wishSelectAll(String product) {
		return sd.wishSelectAll(product);
	}

	// 위시리스트 항목 삭제
	public String delProduct(String product) {
		sd.delProduct(product);
		return "basket";
	}

	// 게임 구매 시
	public ProductVO selectName(String game) {
		return sd.selectName(game);
	}

	// 게임 위시리스트 추가 시
	public ProductVO selectInfo(String name) {
		return sd.selectInfo(name);
	}

	// 위시리스트 항목 수
	public int wishCount(String userID) {
		return sd.wishCount(userID);
	}

	// 전체 위시리스트 항목
	public ModelAndView wishList(String name) {
		System.out.println("위시리스트mpg - service");
		ModelAndView mav = new ModelAndView("basket");
		List<WishVO> wishList = sd.wishList(name);
		mav.addObject("wishList", wishList);
		return mav;
	}

	public ModelAndView compareSelectAll(String name) {
		ModelAndView mav = new ModelAndView("paymentFinish");
		mav.addObject("compareList", sd.compareSelect(name));
		return mav;
	}
	
}
