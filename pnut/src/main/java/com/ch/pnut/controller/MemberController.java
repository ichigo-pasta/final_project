package com.ch.pnut.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ch.pnut.model.Member;
import com.ch.pnut.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	@RequestMapping("loginForm")
	public String loginForm() {
		return "loginForm";
	}
	@RequestMapping("joinForm")
	public String joinForm() {
		return "joinForm";
	}
	@RequestMapping(value = "idChk", produces = "text/html;charset=utf-8")  // jsp로 보냄
	@ResponseBody // jsp로 가지 않고 바로 본문을 전달
	public String idChk(String m_id) {
		String msg = "";
		Member member = ms.select(m_id);
		if (member == null) msg = "사용가능한 아이디입니다.";
		else msg = "이미 사용중인 아이디입니다. 다른 아이디를 입력해주세요";
		return msg;
	}
	@RequestMapping("join")
	public String join(Member member, Model model) {
		int result = 0;
		Member mem = ms.select(member.getM_id());
		if (mem == null) {
			result = ms.insert(member); 
		} else result = -1;
		model.addAttribute("result", result);
		return "join";
	}
	@RequestMapping("login")
	public String login(Member member, Model model,
			HttpSession session) {
		int result = 0;
		Member mem = ms.select(member.getM_id());
		if (mem == null || mem.getM_del().equals("y"))
			result = -1;  // 없는 아이디
		else if (mem.getM_pw().equals(member.getM_pw())) {
			result = 1;  // 성공
			session.setAttribute("m_id", member.getM_id());
		}
		model.addAttribute("result", result);
		return "login";
	}
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "logout";
	}
	@RequestMapping("home/profileForm")
	public String profile(String m_id, Model model) {
		Member member = ms.select(m_id);
		model.addAttribute("member", member);
		return "home/profileForm";
	}
	@RequestMapping("home/profileUpdateForm")
	public String profileUpdateForm(String m_id, Model model) {
		Member member = ms.select(m_id);
		model.addAttribute("member", member);
		return "home/profileUpdateForm";
	}
	@RequestMapping("home/updateProfile")
	public String updateProfile(Member member, Model model,
			HttpSession session) throws IOException {
		String real = session.getServletContext()
				.getRealPath("/resources/images");
		if (!member.getFile_b().isEmpty()) {
			MultipartFile fileB = member.getFile_b();
			String filenameB = UUID.randomUUID()+"-"+fileB.getOriginalFilename();
			member.setM_bg(filenameB);
			FileOutputStream fos = new FileOutputStream(
			new File(real+"/"+filenameB));
			fos.write(fileB.getBytes());
			fos.close();
		}
		if (!member.getFile_p().isEmpty()) {
			MultipartFile fileP = member.getFile_p();
			String filenameP = UUID.randomUUID()+"-"+fileP.getOriginalFilename();
			member.setM_profile(filenameP);
			FileOutputStream fos = new FileOutputStream(
			new File(real+"/"+filenameP));
			fos.write(fileP.getBytes());
			fos.close();
		} 
		int	result = ms.update(member);
		model.addAttribute("m_id", member.getM_id());
		model.addAttribute("result", result);
		return "home/updateProfile";
		
	}
}