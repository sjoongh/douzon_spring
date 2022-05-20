package com.essence.erp.dto;

public class PatientDTO {

	private String c_no;
	private String c_name, c_gender, c_jumin1, c_jumin2, c_address, c_phone, c_doctor, c_mdate;
	public String getC_no() {
		return c_no;
	}
	public void setC_no(String c_no) {
		this.c_no = c_no;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_gender() {
		return c_gender;
	}
	public void setC_gender(String c_gender) {
		this.c_gender = c_gender;
	}
	public String getC_jumin1() {
		return c_jumin1;
	}
	public void setC_jumin1(String c_jumin1) {
		this.c_jumin1 = c_jumin1;
	}
	public String getC_jumin2() {
		return c_jumin2;
	}
	public void setC_jumin2(String c_jumin2) {
		this.c_jumin2 = c_jumin2;
	}
	public String getC_address() {
		return c_address;
	}
	public void setC_address(String c_address) {
		this.c_address = c_address;
	}
	public String getC_phone() {
		return c_phone;
	}
	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}
	public String getC_doctor() {
		return c_doctor;
	}
	public void setC_doctor(String c_doctor) {
		this.c_doctor = c_doctor;
	}
	public String getC_mdate() {
		return c_mdate;
	}
	public void setC_mdate(String c_mdate) {
		this.c_mdate = c_mdate;
	}
	public PatientDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PatientDTO(String c_no, String c_name, String c_gender, String c_jumin1, String c_jumin2, String c_address,
			String c_phone, String c_doctor, String c_mdate) {
		super();
		this.c_no = c_no;
		this.c_name = c_name;
		this.c_gender = c_gender;
		this.c_jumin1 = c_jumin1;
		this.c_jumin2 = c_jumin2;
		this.c_address = c_address;
		this.c_phone = c_phone;
		this.c_doctor = c_doctor;
		this.c_mdate = c_mdate;
	}

	
}
