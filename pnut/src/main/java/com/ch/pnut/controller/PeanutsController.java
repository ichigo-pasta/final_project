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

import com.ch.pnut.model.Member;
import com.ch.pnut.service.PeanutsService;

@Controller
public class PeanutsController {
	@Autowired
	private PeanutsService ps;
//	@RequestMapping("upload")
//	public String upload(Member member, Model model, HttpSession session) throws IOException {
//		String fileName1 = member.getFile().getOriginalFilename();
//		// 파일명을 변경할 때 사용(안바꿔도 됨)
//		UUID uuid = UUID.randomUUID();
//		String fileName = uuid+"_"+fileName1;
//		//
//		String real = session.getServletContext()
//			.getRealPath("/resources/upload");
//		FileOutputStream fos = new FileOutputStream(
//			new File(real+"/"+fileName));
//		// /resources/upload위치에 fileName이름으로 파일 저장
//		fos.write(member.getFile().getBytes());
//		fos.close();
//		// mf.transferTo(new File("c:/java/"+fileName));
//		int fileSize = (int)member.getFile().getSize();
//		model.addAttribute("fileName", fileName);
//		model.addAttribute("fileSize", fileSize);
//		model.addAttribute("id", member.getM_id());
//		model.addAttribute("name", member.getM_name());
//		return "upload";
//	}
}
