package com.ch.pnut.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.pnut.service.MemberService;

@Controller
public class HomeController {
	@Autowired
	private MemberService ms;
	
	@RequestMapping("home/notice")
	public String notice() {
		return "home/notice";
	}
	@RequestMapping("home/message")
	public String message() {
		return "home/message";
	}
	@RequestMapping("home/bookmark")
	public String bookmark() {
		return "home/bookmark";
	}
	@RequestMapping("home/profile")
	public String profile() {
		return "home/profile";
	}
	@RequestMapping("home/writeForm")
	public String writeForm(HttpSession session, Model model) {
		String m_profile = ms.select((String) session.getAttribute("m_id")).getM_profile();
		model.addAttribute("m_profile", m_profile);
		return "home/writeForm";
	}	
}
