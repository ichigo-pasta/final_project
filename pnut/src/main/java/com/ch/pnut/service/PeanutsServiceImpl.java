package com.ch.pnut.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.pnut.dao.PeanutsDao;

@Service
public class PeanutsServiceImpl implements PeanutsService {
	@Autowired
	private PeanutsDao pd;
}
