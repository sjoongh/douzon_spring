package com.essence.erp.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class NoticeDTO {

	private int n_id, n_hit;
	private String n_name, n_title, n_content, n_filesrc;
	private Date n_date;

	public NoticeDTO() {

	}

	public NoticeDTO(int n_id, int n_hit, String n_name, String n_title, String n_content) {
		this.n_id = n_id;
		this.n_hit = n_hit;
		this.n_name = n_name;
		this.n_title = n_title;
		this.n_content = n_content;
	}

	public int getN_id() {
		return n_id;
	}

	public void setN_id(int n_id) {
		this.n_id = n_id;
	}

	public int getN_hit() {
		return n_hit;
	}

	public void setN_hit(int n_hit) {
		this.n_hit = n_hit;
	}

	public String getN_name() {
		return n_name;
	}

	public void setN_name(String n_name) {
		this.n_name = n_name;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getN_filesrc() {
		return n_filesrc;
	}

	public void setN_filesrc(String n_filesrc) {
		this.n_filesrc = n_filesrc;
	}

	public Date getN_date() {
		return n_date;
	}

	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}

	private List<CommonsMultipartFile> files;

	public List<CommonsMultipartFile> getFiles() {

		return files;
	}

	public void setFiles(List<CommonsMultipartFile> files) {

		this.files = files;
	}

}
