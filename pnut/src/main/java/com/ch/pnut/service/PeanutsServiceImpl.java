package com.ch.pnut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.pnut.dao.PeanutsDao;
import com.ch.pnut.model.Peanuts;

@Service
public class PeanutsServiceImpl implements PeanutsService {
	@Autowired
	private PeanutsDao pd;

	public int insert(Peanuts peanut) {
		return pd.insert(peanut);
	}
	public List<Peanuts> selectList(String id, int amt) {
		return pd.selectList(id, amt);
	}
}
