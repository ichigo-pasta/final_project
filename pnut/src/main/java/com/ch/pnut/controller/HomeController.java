package com.ch.pnut.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.pnut.model.Member;
import com.ch.pnut.service.MemberService;

@Controller
public class HomeController {
	@Autowired
	private MemberService ms;
	
	@RequestMapping("home/notice")
	public String notice(HttpSession session, Model model) {
		Member member = ms.select((String) session.getAttribute("m_id"));
		String m_profile = member.getM_profile();
		String m_nickname = member.getM_nickname();
		model.addAttribute("m_profile", m_profile);
		model.addAttribute("m_nickname", m_nickname);
		return "home/notice";
	}
	@RequestMapping("home/message")
	public String message(HttpSession session, Model model) {
		Member member = ms.select((String) session.getAttribute("m_id"));
		String m_profile = member.getM_profile();
		String m_nickname = member.getM_nickname();
		model.addAttribute("m_profile", m_profile);
		model.addAttribute("m_nickname", m_nickname);
		return "home/message";
	}
	@RequestMapping("home/profile")
	public String profile(HttpSession session, Model model) {
		Member member = ms.select((String) session.getAttribute("m_id"));
		String m_profile = member.getM_profile();
		String m_nickname = member.getM_nickname();
		model.addAttribute("m_profile", m_profile);
		model.addAttribute("m_nickname", m_nickname);
		return "home/profile";
	}
	@RequestMapping("home/writeForm")
	public String writeForm(HttpSession session, Model model) {
		Member member = ms.select((String) session.getAttribute("m_id"));
		String m_profile = member.getM_profile();
		String m_nickname = member.getM_nickname();
		model.addAttribute("m_profile", m_profile);
		model.addAttribute("m_nickname", m_nickname);
		return "home/writeForm";
	}	
}
