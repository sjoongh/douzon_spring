package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController // REST API 처리하는 컨트롤러로 등록이 된다
@RequestMapping("/api")
public class ApiController {
	
	@GetMapping("/hello")
	public String hello() {
		
		return "hello spring boot";
	}
}
