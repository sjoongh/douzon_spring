package com.essence.erp;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.essence.erp.dao.HospitalDao;

@Controller
public class HomeController {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home1(Locale locale, Model model) {
		HospitalDao dao = sqlSession.getMapper(HospitalDao.class);
		model.addAttribute("logo",dao.logo());

		return "login";
	}

	@RequestMapping("/login")
	public String login_fail(Locale locale, Model model) {

		return "login";
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String home4(Locale locale, Model model) {

		return "login";
	}

	@RequestMapping("/main")
	public String home(Locale locale, Model model, HttpServletRequest request) {
		HospitalDao dao = sqlSession.getMapper(HospitalDao.class);
		
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		session = request.getSession(true);

		// 로고 이미지
		session.setAttribute("logo", dao.logo());
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("username = " + user.getUsername());
		session.setAttribute("login_id", user.getUsername());
		
		return "main";
	}

}
