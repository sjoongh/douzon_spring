package com.essence.erp.dto;

public class InvoiceDTO {

	private int in_seq, st_qty, in_price;
	private String st_code, st_name, st_std, st_model, st_man, st_vendor, st_unit, in_date;

	public InvoiceDTO() {

	}

	public InvoiceDTO(int in_seq, int st_qty, int in_price, String st_code, String st_name, String st_std,
			String st_model, String st_man, String st_vendor, String st_unit, String in_date) {
		this.in_seq = in_seq;
		this.st_qty = st_qty;
		this.in_price = in_price;
		this.st_code = st_code;
		this.st_name = st_name;
		this.st_std = st_std;
		this.st_model = st_model;
		this.st_man = st_man;
		this.st_vendor = st_vendor;
		this.st_unit = st_unit;
		this.in_date = in_date;
	}

	public int getIn_seq() {
		return in_seq;
	}

	public void setIn_seq(int in_seq) {
		this.in_seq = in_seq;
	}

	public int getSt_qty() {
		return st_qty;
	}

	public void setSt_qty(int st_qty) {
		this.st_qty = st_qty;
	}

	public int getIn_price() {
		return in_price;
	}

	public void setIn_price(int in_price) {
		this.in_price = in_price;
	}

	public String getSt_code() {
		return st_code;
	}

	public void setSt_code(String st_code) {
		this.st_code = st_code;
	}

	public String getSt_name() {
		return st_name;
	}

	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}

	public String getSt_std() {
		return st_std;
	}

	public void setSt_std(String st_std) {
		this.st_std = st_std;
	}

	public String getSt_model() {
		return st_model;
	}

	public void setSt_model(String st_model) {
		this.st_model = st_model;
	}

	public String getSt_man() {
		return st_man;
	}

	public void setSt_man(String st_man) {
		this.st_man = st_man;
	}

	public String getSt_vendor() {
		return st_vendor;
	}

	public void setSt_vendor(String st_vendor) {
		this.st_vendor = st_vendor;
	}

	public String getSt_unit() {
		return st_unit;
	}

	public void setSt_unit(String st_unit) {
		this.st_unit = st_unit;
	}

	public String getIn_date() {
		return in_date;
	}

	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}

}
