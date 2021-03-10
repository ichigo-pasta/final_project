package com.ch.pnut.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.pnut.dao.PeanutsDao;
import com.ch.pnut.model.Peanuts;
import com.ch.pnut.model.Replies;

@Service
public class PeanutsServiceImpl implements PeanutsService {
	@Autowired
	private PeanutsDao pd;

	public int insert(Peanuts peanut) {
		return pd.insert(peanut);
	}
	public List<Peanuts> selectList(String m_id, int amt, List<String> followList) {
		return pd.selectList(m_id, amt, followList);
	}
	public List<Peanuts> search(String[] arrayKw, int amt) {
		return pd.search(arrayKw, amt);
	}
	public String setHashtag(String content) {
		content = content.replace("<", "&lt;").replace(">", "&gt;");
		content = content.replace("\r\n", "<br>");
		String[] splitContent = content.split(" ");
		int len = splitContent.length;
		
		List<String> temp = new ArrayList<>();
		int tempSize;
		for (int i = 0; i < len; i++) {
			if (splitContent[i].startsWith("#") || splitContent[i].contains("<br>#")) {
				temp = Arrays.asList(splitContent[i].split("<br>"));
				tempSize = temp.size();
				for(int j=0; j<tempSize; j++) {
					if(temp.get(j).startsWith("#")) {
						temp.set(j, makeSearchBtn(temp.get(j)));
					}
				}							
				splitContent[i] = String.join("<br>", temp.toArray(new String[temp.size()]));
			}			
		}
		String hashtagedContent = String.join(" ", splitContent);
		return hashtagedContent;
	}
	public String makeSearchBtn(String str) {
		return "<a href=\"javascript:search('hashtag', '" + str + "');\">" + str + "</a>";
	}
	public Peanuts selectDetail(int peanut_no) {
		return pd.selectDetail(peanut_no);
	}
	public Integer isRenut(int peanut_no) {
		return pd.isRenut(peanut_no);
	}
	public void insertReply(Replies reply) {
		pd.insertReply(reply);
	}
	public List<Replies> replyList(Integer peanut_no, Integer amt) {
		return pd.replyList(peanut_no, amt);
	}
	public List<Integer> selectBm(String m_id) {
		return pd.selectBm(m_id);
	}
	public void insertBm(int peanut_no, String m_id) {
		pd.insertBm(peanut_no, m_id);
	}

	public void insertComment(Replies reply) {
		pd.insertComment(reply);
	}
	@Override
	public void deleteBm(int num, String m_id) {
		pd.deleteBm(num, m_id);

	}
	@Override
	public Integer repCnt(int peanut_no) {
		return pd.repCnt(peanut_no);
	}
	@Override
	public Integer renutCnt(int peanut_no) {
		return pd.renutCnt(peanut_no);
	}
	@Override
	public Integer bmCnt(int peanut_no) {
		return pd.bmCnt(peanut_no);
	}

	public List<Peanuts> selectBmList(String m_id, int amt) {
		return pd.selectBmList(m_id, amt);

	public List<Peanuts> distinctList(List<Peanuts> list) {
		Peanuts temp;
		List<Integer> chk = new ArrayList<>();
		int num;
		Iterator<Peanuts> itr = list.iterator();
		while(itr.hasNext()) {
			temp = itr.next();
			if(temp.getRenut() == null) {
				num = temp.getPeanut_no();
			} else num = temp.getRenut();
			if(!chk.contains(num)) {
				chk.add(num);
			} else {
				itr.remove();
			}
		}
		return list;

	}
}
