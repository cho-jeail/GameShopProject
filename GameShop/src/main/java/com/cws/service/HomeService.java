package com.cws.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cws.dao.HomeDAO;

@Service
public class HomeService {
	
	@Autowired private HomeDAO HDAO;
	
	
}
