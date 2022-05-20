package com.essence.erp.dto;

import java.util.Date;

public class ReceptionDTO {

	private int ck;
	private String r_no, c_no, c_name, res_date, res_time;
	private Date rec_date;

	public ReceptionDTO() {

	}

	public ReceptionDTO(int ck, String r_no, String c_no, String c_name, String res_date, String res_time) {
		this.ck = ck;
		this.r_no = r_no;
		this.c_no = c_no;
		this.c_name = c_name;
		this.res_date = res_date;
		this.res_time = res_time;
	}

	public int getCk() {
		return ck;
	}

	public void setCk(int ck) {
		this.ck = ck;
	}

	public String getR_no() {
		return r_no;
	}

	public void setR_no(String r_no) {
		this.r_no = r_no;
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

	public String getRes_date() {
		return res_date;
	}

	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}

	public String getRes_time() {
		return res_time;
	}

	public void setRes_time(String res_time) {
		this.res_time = res_time;
	}

	public Date getRec_date() {
		return rec_date;
	}

	public void setRec_date(Date rec_date) {
		this.rec_date = rec_date;
	}

}
