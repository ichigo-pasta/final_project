package com.ch.pnut.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.pnut.model.Member;
import com.ch.pnut.model.Notice;
import com.ch.pnut.service.MemberService;

@Controller
public class HomeController {
	@Autowired
	private MemberService ms;
	
	@RequestMapping("home/notice")
	public String notice(HttpSession session, Model model) {
		String m_id = (String) session.getAttribute("m_id");
		Member member = ms.select(m_id);
		String m_profile = member.getM_profile();
		String m_nickname = member.getM_nickname();
		List<Notice> list = ms.noticeList(m_id);		
		model.addAttribute("m_profile", m_profile);
		model.addAttribute("m_nickname", m_nickname);
		model.addAttribute("list", list);
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
	@RequestMapping("noticeAllRead")
	@ResponseBody
	public void noticeAllRead(HttpSession session) {
		String m_id = (String) session.getAttribute("m_id");
		ms.noticeAllRead(m_id);
	}
}
