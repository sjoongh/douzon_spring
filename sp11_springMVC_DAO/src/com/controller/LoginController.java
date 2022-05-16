package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.MemberDAO;

@Controller
public class LoginController {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String form() {
		return "loginForm"; // WEB-INF/views/ + loginForm + .jsp
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	// id와 pwd 값을 필수로 받아와야함 --> required=true
	public String submit( 
				@RequestParam(value="id", required=true) String id,
				@RequestParam(value="pwd", required=true) String pwd,
				HttpSession session // session 객체를 얻기 
				) throws Exception
	{
		String viewPage = null;
		boolean isMember = memberDAO.memberCheck(id, pwd);
		if (isMember) {
			session.setAttribute("USERID", id);
			viewPage = "loginSuccess";
		} else {
			viewPage = "loginForm";
		}
		return viewPage;
	}
}
