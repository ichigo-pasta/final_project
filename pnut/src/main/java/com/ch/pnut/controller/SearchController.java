package com.ch.pnut.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		System.out.println("검색키워드: "+keyword);
		keyword = keyword.replaceAll(" +", " ");
		String[] arrayKw = keyword.split(" ");
		List<Peanuts> list = new ArrayList<>();
		switch(type) {
		case "hashtag":
			for (String kw : arrayKw) {
				if(!kw.startsWith("#")) kw = "#"+kw;
			}
		case "peanut":
			list = ps.search(arrayKw, amt);
			for(Peanuts pn:list) {
				pn.setContent(ps.setHashtag(pn.getContent()));
			}
			break;
		case "user":
			
		}
		model.addAttribute("list", list);
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		return "home/search";
	}
	
}
