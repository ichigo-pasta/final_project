package com.ch.pnut.dao;

import java.util.List;

import com.ch.pnut.model.Peanuts;

public interface PeanutsDao {

	int insert(Peanuts peanut);

	List<Peanuts> selectList(String id, int amt);

}
