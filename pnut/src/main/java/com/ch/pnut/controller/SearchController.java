package com.ch.pnut.controller;

import java.util.ArrayList;
import java.util.List;

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
	public String search(String type, String keyword, int amt, Model model) {
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
			list = ps.search(arrayKw, amt);
			for(Peanuts pn:list) {
				pn.setContent(ps.setHashtag(pn.getContent()));
			}
			model.addAttribute("list", list);
			break;
		case "user":
			List<Member> list2 = new ArrayList<>();
			list2 = ms.search(arrayKw, amt);
			model.addAttribute("list2", list2);
		}
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		return "home/search";
	}
	
}
