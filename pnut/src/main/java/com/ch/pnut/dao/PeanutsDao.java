package com.ch.pnut.dao;

import java.util.List;

import com.ch.pnut.model.Peanuts;
import com.ch.pnut.model.Replies;

public interface PeanutsDao {

	int insert(Peanuts peanut);

	List<Peanuts> selectList(String m_id, int amt, List<String> followList);

	List<Peanuts> search(String[] arrayKw, int amt);

	Peanuts selectDetail(int peanut_no);

	Integer isRenut(int peanut_no);

	void insertReply(Replies reply);

	List<Replies> replyList(Integer peanut_no, Integer amt);

	List<Integer> selectBm(String m_id);

	void insertBm(int peanut_no, String m_id);


	void insertComment(Replies reply);

	void deleteBm(int num, String m_id);


	Integer repCnt(int peanut_no);

	Integer renutCnt(int peanut_no);

	Integer bmCnt(int peanut_no);

	List<Peanuts> selectBmList(String m_id, int amt);

	void deletePd(int peanut_no);

	List<Integer> selectRenut(String m_id);

	void cancelRenut(int renut, String m_id);


}
