package kr.edu.kosa;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class HomeController  implements Controller {  // Controller

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		ModelAndView  mav = new ModelAndView();
		
		mav.addObject("nickname", "kingsmile");  // data save
		mav.setViewName("/views/hello.jsp");		// move view page
		
		return mav;
	}

}