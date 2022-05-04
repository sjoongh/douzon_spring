package org.first.mvc;

import java.util.logging.Logger;

import org.apache.log4j.spi.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.Controller;

@org.springframework.stereotype.Controller
public class HelloController {
	
	private static final Logger logger = LoggerFactory.getLogger(HelloController);
	
	@RequestMapping(value = "/hello", method= RequestMethod.GET)
	public String info(Model model) {
		
		logger.info("Hello.jsp페이지로 이동")
		return "hello";
	}

}
