package com.ch.pnut.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ch.pnut.model.Member;
import com.ch.pnut.model.Peanuts;
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
	public String timeline(int amt, Model model, HttpSession session ) {
		String m_id = (String)session.getAttribute("m_id");
		List<String> followList = ms.followList(m_id);
		List<Peanuts> list = ps.selectList(m_id, amt, followList);
		int listLen = list.size();
		if (listLen > 0) {
			for(int i=0; i<listLen; i++) {
				Peanuts p = list.get(i);
				String content = p.getContent();				
				p.setContent(setHashtag(content));				
				list.set(i, p);
			}
		}
		model.addAttribute("list", list);
		model.addAttribute("m_id", m_id);
		return "home/timeline";
	}

	private String setHashtag(String content) {
		String[] splitContent = content.split(" |\n");
		int len = splitContent.length;
		String hashtagedContent = "";
		for (int i = 0; i < len; i++) {
			if (splitContent[i].startsWith("#")) {
				splitContent[i] = "<a href='#'>" + splitContent[i] + "</a>";
			}
			if (splitContent[i].contains("\r")) {
				hashtagedContent += splitContent[i];
			} else if (i != len - 1) {
				hashtagedContent += splitContent[i] + " ";
			} else {
				hashtagedContent += splitContent[i];
			}
		}
		return hashtagedContent;
	}

	@RequestMapping("/nolay/peanutList")
	public String peanutList() {

		return "nolay/peanutList";
	}
}
