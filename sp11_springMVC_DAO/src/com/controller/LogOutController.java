package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogOutController {
	
	@RequestMapping("/logout.do")
	public String out(HttpSession session) {
		session.invalidate(); // 세션 정보 종료
		
		return "loginForm";
	}
}
