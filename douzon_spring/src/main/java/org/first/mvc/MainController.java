package org.first.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MainController implements Controller {
	
//	@RequestMapping("/main")
//	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		return "/WEB-INF/jsp/main.jsp";
//	}

	@Override
	// model은 웹페이지 저장만 함
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String name = "강감찬";
		ModelAndView mav = new ModelAndView(); // view설정
		mav.addObject("name", name);
		mav.addObject("age", 33);
		mav.setViewName("main"); // 어느 viewpage로 보낼지 설정, servlet-context.xml에서 request 경로 지정
		return mav;
	}

}
