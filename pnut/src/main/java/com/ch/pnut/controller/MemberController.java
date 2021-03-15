package com.ch.pnut.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ch.pnut.model.Member;
import com.ch.pnut.model.Peanuts;
import com.ch.pnut.service.MemberService;
import com.ch.pnut.service.PeanutsService;

@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	@Autowired
	private PeanutsService ps;
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
	public String profile(String m_id, Model model, HttpSession session,
			Integer amt, String type) {
		if(type == null) type = "peanut";
		if(amt == null) amt = 20;
		Member member = ms.select(m_id);
		String my_id = (String) session.getAttribute("m_id");
		List<String> myFollowLt = ms.followList(my_id);
		boolean isFollow = myFollowLt.contains(m_id);
		List<String> followLt = ms.followList(m_id);
		int followLtSize = followLt.size();
		int followerLtSize = ms.followerList(m_id).size();
		List<Peanuts> list = ps.selectProfilePn(m_id, amt, type);  // 프로필 리넛 표시 리스트
		Member member2 = ms.select(my_id);
		String m_profile = member2.getM_profile();
		String m_nickname = member2.getM_nickname();
		model.addAttribute("m_nickname", m_nickname);
		model.addAttribute("member", member);
		model.addAttribute("isFollow", isFollow);
		model.addAttribute("followLtSize", followLtSize);
		model.addAttribute("followerLtSize", followerLtSize);
		model.addAttribute("m_profile", m_profile);
		model.addAttribute("list", list);
		model.addAttribute("my_id", my_id);
		model.addAttribute("type", type);
		return "home/profileForm";
	}
	@RequestMapping("home/profileUpdateForm")
	public String profileUpdateForm(String m_id, Model model, HttpSession session) {
		Member member = ms.select(m_id);
		String m_profile = member.getM_profile();
		String m_nickname = member.getM_nickname();
		model.addAttribute("m_nickname", m_nickname);
		model.addAttribute("member", member);
		model.addAttribute("m_profile", m_profile);
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

	@RequestMapping("home/followingList") 
	public String followingList(Model model, 
			HttpSession session, Integer amt) {
		if(amt == null) {
			amt = 20;
		}
		Member member = ms.select((String) session.getAttribute("m_id"));
		String m_profile = member.getM_profile();
		String m_nickname = member.getM_nickname();
		//
		String my_id = (String)session.getAttribute("m_id");  // 접속 ID
		List<String> myFollowList = ms.followList(my_id); // 내가 팔로우한 아이디 리스트
		List<String> followList = ms.followerList(my_id); // 나를 팔로우한 아이디 리스트 
		
		List<Member> list = new ArrayList<>(); 
		// 내가 팔로우한 멤버 리스트
		if (myFollowList.size() > 0) list = ms.followingList(myFollowList, amt); 
		for (Member mem : list) {
			mem.setM_intro(ps.setHashtag(mem.getM_intro(),"user")); // 자기소개 해시태그 
			if (followList.size() > 0) {
				if (followList.contains(mem.getM_id())) {
					mem.setFollowMe(true);
				}
			}
		}
		model.addAttribute("list", list);
		model.addAttribute("m_profile", m_profile);
		model.addAttribute("m_nickname", m_nickname);
		return "home/followingList"; 
	}

	@RequestMapping("home/followerList") 
	public String followerList(String m_id, Model model, 
			HttpSession session, Integer amt) { 
		if(amt == null) {
			amt = 20;
		}
		Member member = ms.select((String) session.getAttribute("m_id"));
		String m_profile = member.getM_profile();
		String m_nickname = member.getM_nickname();
		List<String> followerList = ms.followerList(m_id);
		List<Member> list = new ArrayList<>();
		if (followerList.size() > 0) list = ms.followedList(followerList, amt);
		model.addAttribute("list", list);
		model.addAttribute("m_profile", m_profile);
		model.addAttribute("m_nickname", m_nickname);
		return "home/followerList"; 
	}
	@RequestMapping(value = "follow", produces = "text/html;charset=utf-8")
	@ResponseBody
	public void follow(String m_id, HttpSession session) {
		String active = (String) session.getAttribute("m_id");
		String passive = m_id;
		ms.insert(active , passive);		
	}
	@RequestMapping(value = "unfollow", produces = "text/html;charset=utf-8")
	@ResponseBody
	public void unfollow(String m_id, HttpSession session) {
		String active = (String) session.getAttribute("m_id");
		String passive = m_id;
		ms.delete(active , passive);
	}
	
	@RequestMapping("block")
	public String block(String m_id, HttpSession session, Model model) {
		int result;
		String my_id = (String) session.getAttribute("m_id");
		System.out.println(my_id + ", "+ m_id);
		int isBlocked = ms.checkBlock(my_id, m_id);	// 내가 상대를 이미 차단중인지 체크
		if (isBlocked == 1) result = -1;	// result -1 : 이미 차단중 
		else {
			result = ms.insertBlock(my_id, m_id);	// result 0 : 차단 등록 실패, result 1 : 차단 성공
		}
		model.addAttribute("result", result);
		return "block";
	}
	@RequestMapping("home/blockList")
	public String blockList(String m_id, Model model, 
			HttpSession session, Integer amt) {
		if(amt == null) {
			amt = 20;
		}
		Member member = ms.select((String) session.getAttribute("m_id"));
		String m_profile = member.getM_profile();
		String m_nickname = member.getM_nickname();
		String my_id = (String)session.getAttribute("m_id");	// 접속 ID
		List<String> myBlockList = ms.myBlockList(my_id);			// 내가 차단한 아이디 리스트
		List<Member> list = new ArrayList<>(); 
		// 내가 차단한 아이디 리스트의 값이 있을 때 내가 차단한 멤버 리스트를 조회
		if (myBlockList.size() > 0) list = ms.myBlockingList(myBlockList, amt);  
//		for (Member mem : list) {
//			mem.setM_intro(ps.setHashtag(mem.getM_intro(),"user")); // 자기소개 해시태그 
//		}
		// 나를 차단중인 아이디를 알 수 있게 하는 것도 필요한가?
		model.addAttribute("list", list);
		model.addAttribute("m_profile", m_profile);
		model.addAttribute("m_nickname", m_nickname);
		return "home/blockList";
	}
	
	@RequestMapping("noticeLoad")
	@ResponseBody
	public int noticeLoad(HttpSession session) {
		int result = ms.noticeCount((String) session.getAttribute("m_id"));		
		return result;
	}
}