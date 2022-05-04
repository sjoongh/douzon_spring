package com.edu;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.Controller;

@org.springframework.stereotype.Controller
public class InformationController { // @Controller을 읽고 메소드를 읽고 데이터반환
	
	@RequestMapping(value = "/info2", method= RequestMethod.GET)
	public String info(Model model) {
		model.addAttribute("address", "송파구 가락동");
		model.addAttribute("name", "이순신");
		model.addAttribute("age", 25);
		
		return "info";
	}
}
