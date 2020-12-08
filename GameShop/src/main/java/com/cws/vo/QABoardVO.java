package com.cws.vo;

import java.util.Date;

//	이름       		널        		유형             
//	--------- 	-------- 	-------------- 
//	ID        	NOT NULL 	NUMBER         
//	CATEGORY           		VARCHAR2(50)   
//	TITLE              		VARCHAR2(200)  
//	CONTENT            		VARCHAR2(2000) 
//	WRITER             		VARCHAR2(50)   
//	WRITEDATE          		DATE           
//	IMAGE1             		VARCHAR2(200)  
//	IMAGE2             		VARCHAR2(200)  
//	IMAGE3             		VARCHAR2(200)

public class QABoardVO {
	private int id;
	private String category;
	private String title;
	private String content;
	private String writer;
	private Date writeDate;
	private String image1;
	private String image2;
	private String image3;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
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
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
}
