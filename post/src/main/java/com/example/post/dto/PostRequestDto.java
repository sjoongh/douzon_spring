package com.example.post.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PostRequestDto {
	private String account, email, address, password;
	private String phoneNumber, OPT;
}
