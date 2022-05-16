package com.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor // default constructor
@AllArgsConstructor // all member field constructor
public class MemberVO {
	
	private String id, name, pwd, email;
	private int age;
}
