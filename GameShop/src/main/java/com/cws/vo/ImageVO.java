package com.cws.vo;

import org.springframework.web.multipart.MultipartFile;

public class ImageVO {
	private String id;
	private MultipartFile imgUrl;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public MultipartFile getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(MultipartFile imgUrl) {
		this.imgUrl = imgUrl;
	}
}
