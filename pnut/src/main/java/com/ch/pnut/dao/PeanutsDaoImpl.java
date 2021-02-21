package com.ch.pnut.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PeanutsDaoImpl implements PeanutsDao {
	@Autowired
	private SqlSessionTemplate sst;
}
