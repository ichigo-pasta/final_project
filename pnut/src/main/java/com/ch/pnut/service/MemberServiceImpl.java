package com.ch.pnut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.pnut.dao.MemberDao;
import com.ch.pnut.model.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao md;

	public Member select(String m_id) {
		return md.select(m_id);
	}
	public int insert(Member member) {
		return md.insert(member);
	}
	public int update(Member member) {
		return md.update(member);
	}
	public void insert(String active, String passive) {
		md.insert(active, passive);
	}
	public void delete(String active, String passive) {
		md.delete(active, passive);
	}
	public List<String> followList(String m_id) {
		return md.followList(m_id);
	}
	public List<Member> search(String[] arrayKw, int amt) {
		return md.search(arrayKw, amt);
	}
	public List<String> followerList(String m_id) {
		return md.followerList(m_id);
	}
	public List<Member> followingList(List<String> followlist, Integer amt) {
		return md.followingList(followlist, amt);
	}
	public List<Member> followedList(List<String> followerList, Integer amt) {
		return md.followedList(followerList, amt);
	}
	public int checkBlock(String my_id, String m_id) {
		return md.checkBlock(my_id, m_id);
	}
	public int insertBlock(String my_id, String m_id) {
		return md.insertBlock(my_id, m_id);
	}
	public List<String> myBlockList(String m_id) {
		return md.myBlockList(m_id);
	}
	public List<String> blockList(String m_id) {
		return md.blockList(m_id);
	}
	public List<Member> myBlockingList(List<String> myBlockList, Integer amt) {
		return md.myBlockingList(myBlockList, amt);
	}	
}
