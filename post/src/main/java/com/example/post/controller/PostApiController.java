package com.example.post.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class PostApiController {
	
	@PostMapping("/post")
	public void post(Map<String, Object> requestData) {
		requestData.entrySet().forEach(strObjectEntry -> {
			
		});
	}

}
