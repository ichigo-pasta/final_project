package com.ch.pnut.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("home/search")
	public String search() {
		return "home/search";
	}
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
	public String writeForm() {
		return "home/writeForm";
	}	
}
