package com.ch.pnut.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.pnut.model.Peanuts;
import com.ch.pnut.model.Replies;

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
	public List<Peanuts> search(String[] arrayKw, int amt) {
		Map<String, Object> map = new HashMap<>();
		map.put("arrayKw", arrayKw);
		map.put("amt", amt);
		return sst.selectList("peanutsns.search", map);
	}
	public Peanuts selectDetail(int peanut_no) {
		return sst.selectOne("peanutsns.selectDetail", peanut_no);
	}
	public Integer isRenut(int peanut_no) {
		return sst.selectOne("peanutsns.isRenut", peanut_no);
	}
	public void insertReply(Replies reply) {
		sst.insert("repliesns.insertReply", reply);
	}
	public List<Replies> replyList(Integer peanut_no, Integer amt) {
		Map<String, Integer> map = new HashMap<>();
		map.put("peanut_no", peanut_no);
		map.put("amt", amt);
		return sst.selectList("repliesns.replyList", map);
	}
	public List<Integer> selectBm(String m_id) {
		return sst.selectList("bookmarkns.selectBm", m_id);
	}
	public void insertBm(int peanut_no, String m_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("peanut_no", peanut_no);
		map.put("m_id", m_id);
		sst.insert("bookmarkns.insertBm", map);
	}

	public void insertComment(Replies reply) {
		sst.insert("repliesns.insertComment", reply);


	public void deleteBm(int num, String m_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("m_id", m_id);
		sst.delete("bookmarkns.deleteBm", map);

	}
	
}
