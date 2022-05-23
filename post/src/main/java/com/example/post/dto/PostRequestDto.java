package com.example.post.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PostRequestDto {
	private String account, email, address, password;
	
	@JsonProperty("phone_number")
	private String phoneNumber;
	
	@JsonProperty("OPT")
	private String OPT;
}
