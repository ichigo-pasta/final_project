package com.ch.pnut.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.pnut.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSessionTemplate sst;

	public Member select(String m_id) {
		return sst.selectOne("memberns.select", m_id);
	}

	public int insert(Member member) {
		return sst.insert("memberns.insert", member);
	}

	public int update(Member member) {
		return sst.update("memberns.update", member);
	}

	public void insert(String active, String passive) {
		Map<String, String> map = new HashMap<>();
		map.put("active", active);
		map.put("passive", passive);
		sst.insert("followns.insert", map);
	}

	public void delete(String active, String passive) {
		Map<String, String> map = new HashMap<>();
		map.put("active", active);
		map.put("passive", passive);
		sst.delete("followns.delete", map);
	}

	public List<String> followList(String m_id) {
		return sst.selectList("followns.followList", m_id);
		
	}

}
