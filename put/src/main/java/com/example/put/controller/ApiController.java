package com.example.put.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.response.User;

@RestController
@RequestMapping("/api")
public class ApiController {
	
	// TEXT
	@GetMapping("/text") // GET, http://localhost:8787/api/text?account=user100
	public String text(@RequestParam String account) {
		return account;
	}
	
	// JSON
	@PostMapping("/json")
	// req -> object mapper -> object -> method -> object mapper -> json -> response
	public User json(User user) {
		return user;
	}
}
