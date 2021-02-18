package com.ch.pnut.service;

import com.ch.pnut.model.Member;

public interface MemberService {

	Member select(String m_id);

	int insert(Member member);
}
