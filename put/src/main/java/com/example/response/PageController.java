package com.example.response;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PageController {
	
	// @RequestMapping("/main") // GET
	@GetMapping("/main")
	public String main() {
		return "main.html";
	}
	
	@ResponseBody
	@GetMapping("/user")
	public User user() {
		User user = new User();
		user.setName("yuna");
		user.setAddress("연희동");
		
		return user;
	}
}
