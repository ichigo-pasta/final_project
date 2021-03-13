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

	public List<Member> search(String[] arrayKw, int amt) {
		Map<String, Object> map = new HashMap<>();
		map.put("arrayKw", arrayKw);
		map.put("amt", amt);
		return sst.selectList("memberns.search", map);
	}

	public List<String> followerList(String m_id) {
		return sst.selectList("followns.followerList", m_id);
	}

	public List<Member> followingList(List<String> followlist, Integer amt) {
		Map<String, Object> map = new HashMap<>();
		map.put("followlist", followlist);
		map.put("amt", amt);		
		return sst.selectList("memberns.followingList", map);
	}

	public List<Member> followedList(List<String> followerList, Integer amt) {
		Map<String, Object> map = new HashMap<>();
		map.put("followerList", followerList);
		map.put("amt", amt);
		return sst.selectList("memberns.followedList", map);
	}

	@Override
	public int checkBlock(String my_id, String m_id) {
		Map<String, String> map = new HashMap<>();
		map.put("my_id", my_id);
		map.put("m_id", m_id);
		return sst.selectOne("blockns.checkBlock", map);
	}

	@Override
	public int insertBlock(String my_id, String m_id) {
		Map<String, String> map = new HashMap<>();
		map.put("my_id", my_id);
		map.put("m_id", m_id);
		return sst.insert("blockns.insertBlock", map);
	}

}
