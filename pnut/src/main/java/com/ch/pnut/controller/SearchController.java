package com.ch.pnut.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.pnut.model.Member;
import com.ch.pnut.model.Peanuts;
import com.ch.pnut.service.MemberService;
import com.ch.pnut.service.PeanutsService;

@Controller
public class SearchController {
	@Autowired
	private MemberService ms;
	@Autowired
	private PeanutsService ps;	
	@RequestMapping("home/search")
	public String search(String type, String keyword, Integer amt
			, Integer more, Model model, HttpSession session) {
		if(amt == null) amt = 20;
		if(more == null) more = 0;		
		Member member = ms.select((String) session.getAttribute("m_id"));
		String m_profile = member.getM_profile();
		String m_nickname = member.getM_nickname();
		String m_id = member.getM_id();
		List<String> myBlock = ms.myBlockList(m_id); 
		List<String> block = ms.blockList(m_id);
		List<Integer> bmList = ps.selectBm(m_id);	// 로그인 유저가 북마크한 피넛번호 리스트
		List<Integer> renutList = ps.selectRenut(m_id);	// 로그인 유저가 리넛한 피넛번호 리스트
		List<String> myFollowLt = ms.followList(m_id);  // 팔로우 리스트 조회
		keyword = keyword.replaceAll(" +", " ");
		String[] arrayKw = keyword.split(" ");
		int arrayLen = arrayKw.length;
		switch(type) {
		case "hashtag": 
			for (int i = 0; i < arrayLen; i++) {
				if(!arrayKw[i].startsWith("#")) arrayKw[i] = "#"+arrayKw[i];
			}
		case "peanut": 
			List<Peanuts> list = new ArrayList<>();
			if (arrayLen > 0) list = ps.search(arrayKw, amt+1, myBlock, block);
			if (list.size() > amt) {
				more = 1;
				list.remove(amt.intValue());
			}
			for(Peanuts pn:list) {
				pn.setContent(ps.setHashtag(pn.getContent(),"hashtag"));
				pn.setRepCnt(ps.repCnt(pn.getPeanut_no()));
				pn.setRenutCnt(ps.renutCnt(pn.getPeanut_no()));
				pn.setBmCnt(ps.bmCnt(pn.getPeanut_no()));
				if (bmList.contains(pn.getPeanut_no())) pn.setBookmarked(true);
				if (renutList.contains(pn.getPeanut_no())) pn.setRenuted(true);
				pn.setFollowPn(myFollowLt.contains(pn.getWriter()));
			}
			model.addAttribute("list", list);			
			break;
		case "user":
			List<Member> list2 = new ArrayList<>();
			if (arrayLen > 0) list2 = ms.search(arrayKw, amt+1);
			if (list2.size() > amt) {
				more = 1;
				list2.remove(amt.intValue());
			}
			for (Member mem : list2) {
				mem.setFollowMe(myFollowLt.contains(mem.getM_id()));
				mem.setM_intro(ps.setHashtag(mem.getM_intro(),"user")); // 자기소개 해시태그 
			}
			model.addAttribute("list2", list2);
		}
		model.addAttribute("m_profile", m_profile);
		model.addAttribute("m_nickname", m_nickname);
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		model.addAttribute("amt", amt);
		model.addAttribute("more", more);		
		return "home/search";
	}
}
