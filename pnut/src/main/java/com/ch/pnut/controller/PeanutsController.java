package com.ch.pnut.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ch.pnut.model.Peanuts;
import com.ch.pnut.model.Replies;
import com.ch.pnut.service.MemberService;
import com.ch.pnut.service.PeanutsService;

@Controller
public class PeanutsController {
	@Autowired
	private PeanutsService ps;
	@Autowired
	private MemberService ms;

	@RequestMapping("home/write")
	public String write(Peanuts peanut, Model model, HttpSession session, HttpServletRequest request)
			throws IOException {
		int fileCount = 0;
		if (peanut.getFile1().isEmpty()) {
			fileCount = 0;
		} else if (peanut.getFile2().isEmpty()) {
			fileCount = 1;
		} else if (peanut.getFile3().isEmpty()) {
			fileCount = 2;
		} else if (peanut.getFile4().isEmpty()) {
			fileCount = 3;
		} else {
			fileCount = 4;
		}

		if (fileCount != 0) {
			MultipartFile[] files = new MultipartFile[fileCount];
			String[] fileNames = new String[fileCount];
			switch (fileCount) {
			case 4:
				files[3] = peanut.getFile4();
				fileNames[3] = UUID.randomUUID() + "-" + files[3].getOriginalFilename();
				peanut.setPicture4(fileNames[3]);
			case 3:
				files[2] = peanut.getFile3();
				fileNames[2] = UUID.randomUUID() + "-" + files[2].getOriginalFilename();
				peanut.setPicture3(fileNames[2]);
			case 2:
				files[1] = peanut.getFile2();
				fileNames[1] = UUID.randomUUID() + "-" + files[1].getOriginalFilename();
				peanut.setPicture2(fileNames[1]);
			case 1:
				files[0] = peanut.getFile1();
				fileNames[0] = UUID.randomUUID() + "-" + files[0].getOriginalFilename();
				peanut.setPicture1(fileNames[0]);
			}
			String real = session.getServletContext().getRealPath("/resources/images");
			for (int i = 0; i < fileCount; i++) {
				FileOutputStream fos = new FileOutputStream(new File(real + "/" + fileNames[i]));
				fos.write(files[i].getBytes());
				fos.close();
			};
		} 
		String m_id = (String)session.getAttribute("m_id");
		peanut.setWriter(m_id);
		peanut.setIp(request.getRemoteAddr());
		int result = ps.insert(peanut);
		model.addAttribute("result", result);
		return "home/write";
	}

	@RequestMapping("home/timeline")
	public String timeline(Integer amt, Integer timeout, Model model) {
		if (amt == null) amt = 20;
		if (timeout == null) timeout = 0;
		model.addAttribute("amt", amt);
		model.addAttribute("timeout", timeout);
		return "home/timeline";
	}
	@RequestMapping("tlContents")	
	public String tlContents(Integer amt, Integer timeout, Model model, HttpSession session) {
		if (amt == null) amt = 20;
		if (timeout == null) timeout = 0;
		String m_id = (String) session.getAttribute("m_id");
		List<String> followList = ms.followList(m_id);	// 로그인 유저가 팔로우한 아이디 리스트
		List<Peanuts> list = ps.selectList(m_id, amt, followList);	// 로그인 유저, 팔로우유저 피넛 리스트 amt개 조회한 리스트
		int listSize = list.size();
		List<Integer> bmList = ps.selectBm(m_id);	// 로그인 유저가 북마크한 피넛번호 리스트		
		
		if (listSize > 0) {
			for (Peanuts peanut : list) {
				peanut.setContent(ps.setHashtag(peanut.getContent()));	// list 피넛 해시태그 처리
				if (peanut.getRenut() == null) {	// 리넛이 아닐 때
					peanut.setRepCnt(ps.repCnt(peanut.getPeanut_no()));
					peanut.setRenutCnt(ps.renutCnt(peanut.getPeanut_no()));
					peanut.setBmCnt(ps.bmCnt(peanut.getPeanut_no()));
					if (bmList.contains(peanut.getPeanut_no())) peanut.setBookmarked(true);
				} else {							// 리넛일 때
					peanut.setRepCnt(ps.repCnt(peanut.getRenut()));
					peanut.setRenutCnt(ps.renutCnt(peanut.getRenut()));
					peanut.setBmCnt(ps.bmCnt(peanut.getRenut()));
					if (bmList.contains(peanut.getRenut())) peanut.setBookmarked(true);
				}
			}
		}		

		model.addAttribute("list", list);
		model.addAttribute("m_id", m_id);
		model.addAttribute("timeout", timeout);
		return "tlContents";
	}
	
	@RequestMapping("setBm")
	@ResponseBody
	public void setBm(int peanut_no, HttpSession session) {
		String m_id = (String)session.getAttribute("m_id");
		int num;
		if (ps.selectDetail(peanut_no).getRenut() == null) {
			num = peanut_no;
		} else  num = ps.selectDetail(peanut_no).getRenut();
		ps.insertBm(num, m_id);
	}
	@RequestMapping("deleteBm")
	@ResponseBody
	public void deleteBm(int peanut_no, HttpSession session) {
		String m_id = (String)session.getAttribute("m_id");
		int num;
		if (ps.selectDetail(peanut_no).getRenut() == null) {
			num = peanut_no;
		} else  num = ps.selectDetail(peanut_no).getRenut();
		ps.deleteBm(num, m_id);
	}
	
	@RequestMapping("home/peanutDetail")
	public String peanutDetail(Integer peanut_no, Model model,
			HttpSession session, Integer amt) {
		if (peanut_no == null) {
			peanut_no = 0;
		}
		if (amt == null) {
			amt = 20;
		}
		String m_id = (String)session.getAttribute("m_id");
		String m_nickname = ms.select(m_id).getM_nickname();
		Integer renut = ps.isRenut(peanut_no);
		Peanuts peanut;
		if(renut == null) peanut = ps.selectDetail(peanut_no);			
		else peanut = ps.selectDetail(renut);
		model.addAttribute("peanut", peanut);
		model.addAttribute("m_nickname", m_nickname);
		List<Replies> list = ps.replyList(peanut_no, amt);
		model.addAttribute("list", list);
		return "home/peanutDetail";
	}
	@RequestMapping("home/reply")
	public String reply(Replies reply, Model model, HttpServletRequest request) {
		reply.setRef_level(0);
		reply.setIp(request.getRemoteAddr());
		ps.insertReply(reply);
		model.addAttribute("peanut_no", reply.getPeanut_no());
		return "home/reply";
	}
	@RequestMapping("home/comment")
	public String comment(Replies reply, Model model, HttpServletRequest request) {
		reply.setRef_level(1);
		reply.setIp(request.getRemoteAddr());
		ps.insertComment(reply);
		model.addAttribute("reply_no", reply.getReply_no());
		model.addAttribute("peanut_no", reply.getPeanut_no());
		return "home/comment";
	}
	
	@RequestMapping("/nolay/peanutList")
	public String peanutList() {
		return "nolay/peanutList";
	}
}
