package com.essence.erp.dto;

public class PrescriptionDTO {
	private String pre_code;
	private String pre_name;
	private String pre_day;
	private String pre_total;
	private String pre_way;
	public String getPre_code() {
		return pre_code;
	}
	public void setPre_code(String pre_code) {
		this.pre_code = pre_code;
	}
	public String getPre_name() {
		return pre_name;
	}
	public void setPre_name(String pre_name) {
		this.pre_name = pre_name;
	}
	public String getPre_day() {
		return pre_day;
	}
	public void setPre_day(String pre_day) {
		this.pre_day = pre_day;
	}
	public String getPre_total() {
		return pre_total;
	}
	public void setPre_total(String pre_total) {
		this.pre_total = pre_total;
	}
	public String getPre_way() {
		return pre_way;
	}
	public void setPre_way(String pre_way) {
		this.pre_way = pre_way;
	}
	public PrescriptionDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PrescriptionDTO(String pre_code, String pre_name, String pre_day, String pre_total, String pre_way) {
		super();
		this.pre_code = pre_code;
		this.pre_name = pre_name;
		this.pre_day = pre_day;
		this.pre_total = pre_total;
		this.pre_way = pre_way;
	}
	
	
}
