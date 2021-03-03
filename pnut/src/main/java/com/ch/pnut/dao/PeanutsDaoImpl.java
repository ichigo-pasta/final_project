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
	public List<Peanuts> selectList(String m_id, int amt, List<String> followList) {
		Map<String, Object> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("amt", amt);
		map.put("followList", followList);
		return sst.selectList("peanutsns.selectList", map);
	}
	
}
