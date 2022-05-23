package com.example.post.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.post.dto.PostRequestDto;

@RestController
@RequestMapping("/api")
public class PostApiController {
	
	@PostMapping("/post")
	public void post(Map<String, Object> requestData) {
//		requestData.entrySet().forEach(strObjectEntry -> {
//			
//		}
//		);
	
	requestData.forEach((key, value) -> {
		System.out.println(key);
	});
	}
	
	@PostMapping("/post-object")
	public void postObject(@RequestBody PostRequestDto requestData) {
		System.out.println(requestData);
	}

}
