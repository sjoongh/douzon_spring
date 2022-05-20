package com.essence.erp.dto;

public class TreatmentDTO {
		
	private String t_code;
	private String t_name;
	private String t_content;
	private int t_pay;
	private String t_date;
	
	public String getT_code() {
		return t_code;
	}
	public void setT_code(String t_code) {
		this.t_code = t_code;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getT_content() {
		return t_content;
	}
	public void setT_content(String t_content) {
		this.t_content = t_content;
	}
	public int getT_pay() {
		return t_pay;
	}
	public void setT_pay(int t_pay) {
		this.t_pay = t_pay;
	}
	public String getT_date() {
		return t_date;
	}
	public void setT_date(String t_date) {
		this.t_date = t_date;
	}
	public TreatmentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TreatmentDTO(String t_code, String t_name, String t_content, int t_pay, String t_date) {
		super();
		this.t_code = t_code;
		this.t_name = t_name;
		this.t_content = t_content;
		this.t_pay = t_pay;
		this.t_date = t_date;
	}
	

}
