package com.essence.erp.dto;

public class SecurityDto {
	private String c_reference, c_authority, c_code;
	private String authority;
	private String code;
	

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getC_reference() {
		return c_reference;
	}

	public void setC_reference(String c_reference) {
		this.c_reference = c_reference;
	}

	public String getC_authority() {
		return c_authority;
	}

	public void setC_authority(String c_authority) {
		this.c_authority = c_authority;
	}

	public String getC_code() {
		return c_code;
	}

	public void setC_code(String c_code) {
		this.c_code = c_code;
	}

	public SecurityDto(String c_reference, String c_authority, String c_code) {
		super();
		this.c_reference = c_reference;
		this.c_authority = c_authority;
		this.c_code = c_code;
	}

	public SecurityDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "SecurityDto [c_reference=" + c_reference + ", c_authority=" + c_authority + ", c_code=" + c_code + "]";
	}
	
}
