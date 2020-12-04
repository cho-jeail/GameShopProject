package com.cws.vo;

import java.util.Date;

/*
이름        널        유형             
--------- -------- -------------- 
ID        NOT NULL VARCHAR2(250)  
TITLE              VARCHAR2(200)  
CONTENT            VARCHAR2(2000) 
WRITER             VARCHAR2(50)   
VIEWS              NUMBER         
WRITEDATE          DATE                  
 */

public class NoticeBoardVO {
	private String id;
	private String title;
	private String content;
	private String writer;
	private int views;
	private Date writedate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
}
