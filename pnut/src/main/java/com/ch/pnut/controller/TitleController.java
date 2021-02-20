package com.ch.pnut.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TitleController {
	@RequestMapping("title/timeline")
	public String timeline() {
		return "title/timeline";
	}
	@RequestMapping("title/search")
	public String search() {
		return "title/search";
	}
	@RequestMapping("title/notice")
	public String notice() {
		return "title/notice";
	}
	@RequestMapping("title/message")
	public String message() {
		return "title/message";
	}
	@RequestMapping("title/bookmark")
	public String bookmark() {
		return "title/bookmark";
	}
	@RequestMapping("title/profile")
	public String profile() {
		return "title/profile";
	}
	@RequestMapping("title/write")
	public String write() {
		return "title/write";
	}
}
