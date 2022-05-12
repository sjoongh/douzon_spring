package kr.edu.kosa;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.log4j.spi.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class HomeController  implements Controller {  // Controller
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
//		logger.info("welcome hello.jsp");
		ModelAndView  mav = new ModelAndView();
//		
//		mav.addObject("nickname", "doyeon3333");  // data save
//		mav.setViewName("/views/hello.jsp");		// move view page
		
		mav.addObject("nickname", "박태환");  // data save
		mav.setViewName("hello");
		return mav;
	}

}