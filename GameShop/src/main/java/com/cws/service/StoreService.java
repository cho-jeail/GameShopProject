package com.cws.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cws.dao.StoreDAO;

@Service
public class StoreService {
	
	@Autowired private StoreDAO sd;
}
