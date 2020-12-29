package com.cws.vo;

//	이름       	  널        	    유형             
//	-------- -------- -------------- 
//	ID       NOT NULL NUMBER         
//	CATEGORY          NUMBER         
//	TITLE             VARCHAR2(200)  
//	CONTENT           VARCHAR2(2000)

public class FAQBoardVO {
	private int id;
	private int category;
	private String title;
	private String content;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content.replace("\n", "<br>");
	}
}
