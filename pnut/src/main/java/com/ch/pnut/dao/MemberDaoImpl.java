package com.ch.pnut.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.pnut.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSessionTemplate sst;

	public Member select(String m_id) {
		return sst.selectOne("memberns.select", m_id);
	}

	public int insert(Member member) {
		return sst.insert("memberns.insert", member);
	}

}
