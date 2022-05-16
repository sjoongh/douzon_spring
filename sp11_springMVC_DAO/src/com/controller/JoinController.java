package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.MemberDAO;

@Controller
public class JoinController {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String form() {
		
		return "joinForm";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String submit(
			@RequestParam(value="id", required=true) String id,
			@RequestParam(value="name", required=true) String name,
			@RequestParam(value="pwd", required=true) String pwd,
			@RequestParam(value="email", required=true) String email,
			@RequestParam(value="age", required=true) int age
			) throws Exception {
		String viewPage = null;
		boolean joinMember = memberDAO.memberInsert(id, name, pwd, email, age);
		
		if (joinMember) {
			viewPage = "joinSuccess";
		} else {
			viewPage = "joinForm";
		}
		
		return viewPage;
	}
}
