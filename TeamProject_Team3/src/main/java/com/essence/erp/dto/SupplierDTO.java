package com.essence.erp.dto;

public class SupplierDTO {

	private String su_taxid, su_name, su_ceo, su_fndt, su_addr, su_phone, su_item, su_mgr;

	public SupplierDTO() {

	}

	public SupplierDTO(String su_taxid, String su_name, String su_ceo, String su_addr, String su_phone, String su_item,
			String su_mgr) {
		this.su_taxid = su_taxid;
		this.su_name = su_name;
		this.su_ceo = su_ceo;
		this.su_addr = su_addr;
		this.su_phone = su_phone;
		this.su_item = su_item;
		this.su_mgr = su_mgr;
	}

	public String getSu_taxid() {
		return su_taxid;
	}

	public void setSu_taxid(String su_taxid) {
		this.su_taxid = su_taxid;
	}

	public String getSu_name() {
		return su_name;
	}

	public void setSu_name(String su_name) {
		this.su_name = su_name;
	}

	public String getSu_ceo() {
		return su_ceo;
	}

	public void setSu_ceo(String su_ceo) {
		this.su_ceo = su_ceo;
	}

	public String getSu_fndt() {
		return su_fndt;
	}

	public void setSu_fndt(String su_fndt) {
		this.su_fndt = su_fndt;
	}

	public String getSu_addr() {
		return su_addr;
	}

	public void setSu_addr(String su_addr) {
		this.su_addr = su_addr;
	}

	public String getSu_phone() {
		return su_phone;
	}

	public void setSu_phone(String su_phone) {
		this.su_phone = su_phone;
	}

	public String getSu_item() {
		return su_item;
	}

	public void setSu_item(String su_item) {
		this.su_item = su_item;
	}

	public String getSu_mgr() {
		return su_mgr;
	}

	public void setSu_mgr(String su_mgr) {
		this.su_mgr = su_mgr;
	}

}
