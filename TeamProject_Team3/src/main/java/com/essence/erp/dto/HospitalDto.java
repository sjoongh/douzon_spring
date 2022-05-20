package com.essence.erp.dto;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class HospitalDto {
	
	private String h_name, h_master, h_master_tel, h_tel, h_map, h_lnum;
	private String h_name1, h_logo;
	private int u_num;

	public int getU_num() {
		return u_num;
	}

	public void setU_num(int u_num) {
		this.u_num = u_num;
	}

	public String getH_logo() {
		return h_logo;
	}

	public void setH_logo(String h_logo) {
		this.h_logo = h_logo;
	}

	public String getH_name1() {
		return h_name1;
	}

	public void setH_name1(String h_name1) {
		this.h_name1 = h_name1;
	}

	public HospitalDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HospitalDto(String h_name, String h_master, String h_master_tel, String h_tel, String h_map, String h_lnum) {
		super();
		this.h_name = h_name;
		this.h_master = h_master;
		this.h_master_tel = h_master_tel;
		this.h_tel = h_tel;
		this.h_map = h_map;
		this.h_lnum = h_lnum;
	}

	public String getH_name() {
		return h_name;
	}

	public void setH_name(String h_name) {
		this.h_name = h_name;
	}

	public String getH_master() {
		return h_master;
	}

	public void setH_master(String h_master) {
		this.h_master = h_master;
	}

	public String getH_master_tel() {
		return h_master_tel;
	}

	public void setH_master_tel(String h_master_tel) {
		this.h_master_tel = h_master_tel;
	}

	public String getH_tel() {
		return h_tel;
	}

	public void setH_tel(String h_tel) {
		this.h_tel = h_tel;
	}

	public String getH_map() {
		return h_map;
	}

	public void setH_map(String h_map) {
		this.h_map = h_map;
	}

	public String getH_lnum() {
		return h_lnum;
	}

	public void setH_lnum(String h_lnum) {
		this.h_lnum = h_lnum;
	}
	 //멀티 파일 업로드///////////////////////////////
		private List<CommonsMultipartFile> files;
			
		public List<CommonsMultipartFile> getFiles() {
			return files;
		}
		public void setFiles(List<CommonsMultipartFile> files) {
			this.files = files;
		}
		////////////////////////////////////////////////
}
