package com.ch.pnut.service;

import java.util.List;

import com.ch.pnut.model.Member;

public interface MemberService {

	Member select(String m_id);

	int insert(Member member);

	int update(Member member);

	void insert(String active, String passive);

	void delete(String active, String passive);

	List<String> followList(String m_id);

	List<Member> search(String[] arrayKw, int amt);

	List<String> followerList(String m_id);

	List<Member> followingList(List<String> followlist, Integer amt);

	List<Member> followedList(List<String> followerList, Integer amt);

}
