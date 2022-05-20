package com.essence.erp.dto;

public class AccountDTO {

	int ac_seq, ac_imp, ac_exp;
	int sum_ac_imp, sum_ac_exp;
	String ac_date, ac_typename, ac_cont;

	public AccountDTO() {

	}

	public AccountDTO(int ac_seq, int ac_imp, int ac_exp, int sum_ac_imp, int sum_ac_exp, String ac_date,
			String ac_typename, String ac_cont) {
		this.ac_seq = ac_seq;
		this.ac_imp = ac_imp;
		this.ac_exp = ac_exp;
		this.sum_ac_imp = sum_ac_imp;
		this.sum_ac_exp = sum_ac_exp;
		this.ac_date = ac_date;
		this.ac_typename = ac_typename;
		this.ac_cont = ac_cont;
	}

	public int getAc_seq() {
		return ac_seq;
	}

	public void setAc_seq(int ac_seq) {
		this.ac_seq = ac_seq;
	}

	public int getAc_imp() {
		return ac_imp;
	}

	public void setAc_imp(int ac_imp) {
		this.ac_imp = ac_imp;
	}

	public int getAc_exp() {
		return ac_exp;
	}

	public void setAc_exp(int ac_exp) {
		this.ac_exp = ac_exp;
	}

	public int getSum_ac_imp() {
		return sum_ac_imp;
	}

	public void setSum_ac_imp(int sum_ac_imp) {
		this.sum_ac_imp = sum_ac_imp;
	}

	public int getSum_ac_exp() {
		return sum_ac_exp;
	}

	public void setSum_ac_exp(int sum_ac_exp) {
		this.sum_ac_exp = sum_ac_exp;
	}

	public String getAc_date() {
		return ac_date;
	}

	public void setAc_date(String ac_date) {
		this.ac_date = ac_date;
	}

	public String getAc_typename() {
		return ac_typename;
	}

	public void setAc_typename(String ac_typename) {
		this.ac_typename = ac_typename;
	}

	public String getAc_cont() {
		return ac_cont;
	}

	public void setAc_cont(String ac_cont) {
		this.ac_cont = ac_cont;
	}

}
