package com.ch.pnut.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("home/timeline")
	public String timeline() {
		return "home/timeline";
	}
}
