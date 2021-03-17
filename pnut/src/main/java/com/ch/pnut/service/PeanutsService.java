package com.ch.pnut.service;

import java.util.List;

import com.ch.pnut.model.Peanuts;
import com.ch.pnut.model.Replies;

public interface PeanutsService {

	int insert(Peanuts peanut);

	List<Peanuts> selectList(String m_id, int amt, List<String> followList, List<String> myBlock, List<String> block);

	List<Peanuts> search(String[] arrayKw, int amt, List<String> myBlock, List<String> block);

	String setHashtag(String content, String type);

	Peanuts selectDetail(int peanut_no);

	Integer isRenut(int peanut_no);

	void insertReply(Replies reply);

	List<Replies> replyList(Integer peanut_no, Integer amt);

	List<Integer> selectBm(String m_id);

	int insertBm(int peanut_no, String m_id);

	void insertComment(Replies reply);

	void deleteBm(int num, String m_id);

	Integer repCnt(int peanut_no);

	Integer renutCnt(int peanut_no);

	Integer bmCnt(int peanut_no);
	
	List<Peanuts> distinctList(List<Peanuts> list);

	List<Peanuts> selectBmList(String m_id, int amt);

	List<Integer> selectRenut(String m_id);

	int cancelRenut(int renut, String m_id);

	int deletePd(Integer peanut_no);

	List<Peanuts> selectProfilePn(String m_id, Integer amt, String type);

	Integer repsPno(int reply_no);
}
