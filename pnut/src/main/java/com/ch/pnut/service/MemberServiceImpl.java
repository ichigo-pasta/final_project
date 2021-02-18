package com.ch.pnut.service;

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
}
