package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model.MemberDAO;
import com.model.MemberVO;

@Controller
public class MemberCheckController {
	
	@Autowired
	public MemberDAO memberDAO;
	
	@RequestMapping(value = "/check.do", method=RequestMethod.GET)
	public String form() {
		
		return "membercheckForm";
	}
	
	@RequestMapping(value = "/check.do", method=RequestMethod.POST)
	public ModelAndView submit(
			@RequestParam(value="id") String id
			) throws Exception {
		
		String viewPage = null;
		MemberVO vo = memberDAO.selectMemberById(id);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("memberok", vo);
		
		if (vo != null) {
			mav.setViewName("membercheckSuccess");
		} else {
			mav.setViewName("membercheckForm");
		}
				
		return mav;
	}
}
