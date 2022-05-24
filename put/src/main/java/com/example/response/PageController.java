package com.example.response;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PageController {
	
	// @RequestMapping("/main") // GET
	@GetMapping("/main")
	public String main() {
		return "main.html";
	}
}
