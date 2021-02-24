package com.ch.pnut.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<Peanuts> selectList(String id, int amt) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("amt", amt);
		return sst.selectList("peanutsns.selectList", map);
	}
	
}
