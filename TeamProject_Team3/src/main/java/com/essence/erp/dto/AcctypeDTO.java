package com.essence.erp.dto;

public class AcctypeDTO {
	private String type_code, type_name;

	public String getType_code() {
		return type_code;
	}

	public void setType_code(String type_code) {
		this.type_code = type_code;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public AcctypeDTO(String type_code, String type_name) {
		super();
		this.type_code = type_code;
		this.type_name = type_name;
	}

	public AcctypeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
