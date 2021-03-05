package com.ch.pnut.dao;

import java.util.List;

import com.ch.pnut.model.Peanuts;

public interface PeanutsDao {

	int insert(Peanuts peanut);

	List<Peanuts> selectList(String m_id, int amt, List<String> followList);

	List<Peanuts> search(String[] arrayKw, int amt);

	Peanuts selectDetail(int peanut_no);

	Integer isRenut(int peanut_no);

}
