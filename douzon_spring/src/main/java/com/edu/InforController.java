package com.edu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class InforController implements Controller { // servlet-context로부터 타고들어옴

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 본인 주소, 학과, 학교 출력 views/jsp에
		String name = "신중호";
		String data1 = "컴공입니다.";
		String data2 = "강원대입니다.";
		ModelAndView mav = new ModelAndView(); // view설정
		mav.addObject("depart", data1);
		mav.addObject("school", data2);
		mav.addObject("name", name);
		mav.setViewName("info"); // 어느 viewpage로 보낼지 설정, servlet-context.xml에서 request 경로 지정
		return mav;
	}

}
