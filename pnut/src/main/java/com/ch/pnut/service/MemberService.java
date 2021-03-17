package com.ch.pnut.service;

import java.util.List;

import com.ch.pnut.model.Member;
import com.ch.pnut.model.Notice;

public interface MemberService {

	Member select(String m_id);

	int insert(Member member);

	int update(Member member);

	int insert(String active, String passive);

	void delete(String active, String passive);

	List<String> followList(String m_id);

	List<Member> search(String[] arrayKw, int amt);

	List<String> followerList(String m_id);

	List<Member> followingList(List<String> followlist, Integer amt);

	List<Member> followedList(List<String> followerList, Integer amt);

	int checkBlock(String my_id, String m_id);

	int insertBlock(String my_id, String m_id);

	List<String> myBlockList(String m_id);

	List<String> blockList(String m_id);


	List<Member> myBlockingList(List<String> myBlockList, Integer amt);

	int noticeCount(String attribute);

	List<Notice> noticeList(String m_id);

	void noticeAllRead(String m_id);

	Notice selectNotice(Integer notice_no);

	int unblock(String my_id, String m_id);

	int deleteMember(String m_id);

}
