package com.ch.pnut.dao;

import com.ch.pnut.model.Member;

public interface MemberDao {

	Member select(String m_id);
	
	int insert(Member member);
}
