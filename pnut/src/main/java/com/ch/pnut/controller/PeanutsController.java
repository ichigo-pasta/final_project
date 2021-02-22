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
import org.springframework.web.multipart.MultipartFile;

import com.ch.pnut.model.Member;
import com.ch.pnut.model.Peanuts;
import com.ch.pnut.service.PeanutsService;

@Controller
public class PeanutsController {
	@Autowired
	private PeanutsService ps;
	@RequestMapping("write")
	public String write(Peanuts peanut, Model model, HttpSession session) throws IOException {
//		System.out.println("dsf");
//		MultipartFile [] files = new MultipartFile[4];
//		files[0] = peanut.getFile1();
//		files[1] = peanut.getFile2();
//		files[2] = peanut.getFile3();
//		files[3] = peanut.getFile4();
//		String [] fileNames = new String[4];
//		for (int i = 0; i < 4; i++) {
//			fileNames[i] = UUID.randomUUID()+"-"+files[i].getOriginalFilename();
//		}
//		String real = session.getServletContext()
//			.getRealPath("/resources/images");
//		for (int i = 0; i < 4; i++) {
//			FileOutputStream fos = new FileOutputStream(
//					new File(real+"/"+fileNames[i]));
//			fos.write(files[i].getBytes());
//			fos.close();
//		};
//		// /resources/images 위치에 fileName이름으로 파일 저장
		
		return "home/timeline";
	}
}
