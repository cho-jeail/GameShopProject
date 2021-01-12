package com.cws.vo;

public class PagingParamsVO {

	private int page; 			// 현재 페이지
	private int perPage;		// 페이지 당 게시글 수
	private int perSection;		// Section당 페이지 수
	private int AllCount; 		// 게시글 총 갯수
	private int PageCount; 		// 총 페이지 수
	
	// 게시글의 시작과 끝
	private int first;		// 현재 페이지에서 시작하는 글 번호
	private int last;		// 현재 페이지에서 마지막 글번호
	
	// 페이지 번호 시작과 끝
	private int section;	// 페이지를 10단위로 나눈 수
	private int begin;		// 현 section에서 시작 페이지 번호
	private int end;		// 현 section에서 마지막 페이지 번호
	
	private boolean prev;
	private boolean next;
	
	public PagingParamsVO(int page, int AllCount) {
		perPage = 12;
		perSection = 10;
		this.page = page;
		this.AllCount = AllCount;
		
		PageCount = AllCount / perPage;
		PageCount += AllCount % perPage == 0 ? 0 : 1;
		
		first = (page - 1) * perPage + 1;
		last = AllCount <= first + perPage - 1 ? AllCount : first + perPage - 1;
		
		section = (page - 1) / perPage;
		begin = section * perSection + 1;
		end = PageCount <= begin + perSection - 1 ? PageCount : begin + perSection - 1;
		
		prev = section > 0 ? true : false;
		next = end < PageCount ? true : false;
	}
	
	public int getPage() {
		return page;
	}
	public int getPerPage() {
		return perPage;
	}
	public int getPerSection() {
		return perSection;
	}
	public int getAllCount() {
		return AllCount;
	}
	public int getPageCount() {
		return PageCount;
	}
	
	// 게시글 번호 관련
	public int getFirst() {
		return first;
	}
	public int getLast() {
		return last;
	}
	
	// 페이지 번호 관련
	public int getSection() {
		return section;
	}
	public int getBegin() {
		return begin;
	}
	public int getEnd() {
		return end;
	}

	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}	
}
