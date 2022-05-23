package com.example.demo.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/get")
public class GetApiController {
	
	@GetMapping(path="/hello") // path="/hello", method=RequestMethod.GET
	public String getHello() {
		return "get hello";
	}
	
	@RequestMapping(path="/hi", method=RequestMethod.GET)
	public String hi() {
		return "hi";
	}
	
//	@GetMapping("/pathVariable") // 주소줄에 대문자 쓰면 안됨
	@GetMapping("/path-variable/{name}")
//	public String pathVariable(String name) {
	public String pathVariable(@PathVariable(name="id") String pathId) {
		System.out.println(pathId);
		return pathId;
	}
	
	@GetMapping(path="query-param")
	public String queryParam(Map<String, String> queryParam) {
		
		StringBuilder sb = new StringBuilder();
		queryParam.entrySet().forEach(entry -> {
			System.out.println(entry.getKey());
			System.out.println(entry.getValue());
			
			sb.append(entry.getKey() + " = " + entry.getValue() + "\n");
		});
		return sb.toString();
	}
	
	@GetMapping(path="query-param02")
	public String queryParam02(
			@RequestParam String name,
			@RequestParam String email,
			@RequestParam int age) {
		
		return null;
	}
}
