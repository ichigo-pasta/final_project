package com.ch.pnut.service;

import java.util.List;

import com.ch.pnut.model.Peanuts;

public interface PeanutsService {

	int insert(Peanuts peanut);

	List<Peanuts> selectList(String m_id, int amt);

}
