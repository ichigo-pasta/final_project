package com.ch.pnut.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.metadata.Db2CallMetaDataProvider;
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
	public List<Peanuts> selectList(String m_id, int amt, List<String> followList, List<String> myBlock, List<String> block) {
		Map<String, Object> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("amt", amt);
		map.put("followList", followList);
		map.put("myBlock", myBlock);
		map.put("block", block);
		return sst.selectList("peanutsns.selectList", map);
	}
	public List<Peanuts> search(String[] arrayKw, int amt, List<String> myBlock, List<String> block) {
		Map<String, Object> map = new HashMap<>();
		map.put("arrayKw", arrayKw);
		map.put("amt", amt);		
		map.put("myBlock", myBlock);		
		map.put("block", block);
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
	public int insertBm(int peanut_no, String m_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("peanut_no", peanut_no);
		map.put("m_id", m_id);
		return sst.insert("bookmarkns.insertBm", map);
	}

	public void insertComment(Replies reply) {
		sst.insert("repliesns.insertComment", reply);
		
	}
	public void deleteBm(int num, String m_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("m_id", m_id);
		sst.delete("bookmarkns.deleteBm", map);

	}
	public Integer repCnt(int peanut_no) {
		return sst.selectOne("repliesns.repCnt", peanut_no);
	}
	public Integer renutCnt(int peanut_no) {
		return sst.selectOne("peanutsns.renutCnt", peanut_no);
	}
	public Integer bmCnt(int peanut_no) {
		return sst.selectOne("bookmarkns.bmCnt", peanut_no);
	}
	public List<Peanuts> selectBmList(String m_id, int amt) {
		Map<String, Object> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("amt", amt);
		return sst.selectList("peanutsns.selectBmList", map);
	}

	public List<Integer> selectRenut(String m_id) {
		return sst.selectList("peanutsns.selectRenut", m_id);
	}
	
	public int cancelRenut(int renut, String m_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("renut", renut);
		map.put("m_id", m_id);
		return sst.update("peanutsns.cancelRenut", map);

	}
	public int deletePd(Integer peanut_no) {
		return sst.update("peanutsns.deletePd", peanut_no);
	}
	public List<Peanuts> selectProfilePn(String m_id, Integer amt, String type) {
		Map<String, Object> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("amt", amt);
		map.put("type", type);
		return sst.selectList("peanutsns.selectProfilePn",map);
	}
	public Integer repsPno(int reply_no) {
		return sst.selectOne("repliesns.repsPno", reply_no);
	}
	public int deleteReply(Integer reply_no, String m_id) {
		Map<String, Object> map  = new HashMap<>();
		map.put("reply_no", reply_no);
		map.put("m_id", m_id);
		return sst.update("repliesns.deleteReply", map);
	}
}
