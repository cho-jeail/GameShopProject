package com.cws.vo;

import java.util.Date;

public class CompareProductVO {
	private String userid;
	private String id;
	private String name;
	private int price;
	private String info;
	private String developer;
	private String publisher;
	private Date releaseDate;
	private String tags;
	private int platform;
	private int controller;
	private int rating;
	private String languages;
	private String kind;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getDeveloper() {
		return developer;
	}
	public void setDeveloper(String developer) {
		this.developer = developer;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public int getPlatform() {
		return platform;
	}
	public void setPlatform(int platform) {
		this.platform = platform;
	}
	public int getController() {
		return controller;
	}
	public void setController(int controller) {
		this.controller = controller;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getLanguages() {
		return languages;
	}
	public void setLanguages(String languages) {
		this.languages = languages;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
}
