package com.essence.erp.dto;

public class PaymentDTO {

	private int t_pay;
	private String c_no, c_name;

	public PaymentDTO() {

	}

	public PaymentDTO(int t_pay, String c_no, String c_name) {
		this.t_pay = t_pay;
		this.c_no = c_no;
		this.c_name = c_name;
	}

	public int getT_pay() {
		return t_pay;
	}

	public void setT_pay(int t_pay) {
		this.t_pay = t_pay;
	}

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

}
