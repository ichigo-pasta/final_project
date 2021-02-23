package com.ch.pnut.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.pnut.model.Peanuts;

@Repository
public class PeanutsDaoImpl implements PeanutsDao {
	@Autowired
	private SqlSessionTemplate sst;

	public int insert(Peanuts peanut) {
		return sst.insert("peanutsns.insert", peanut);
	}
}
