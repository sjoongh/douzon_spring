package com.essence.erp.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class BizReportDTO {

	private int b_id, b_hit, b_group, b_step, b_indent;
	private String b_name, b_title, b_content, b_filesrc;
	private Date b_date;

	public BizReportDTO() {

	}

	public BizReportDTO(int b_id, int b_hit, int b_group, int b_step, int b_indent, String b_name, String b_title,
			String b_content) {
		this.b_id = b_id;
		this.b_hit = b_hit;
		this.b_group = b_group;
		this.b_step = b_step;
		this.b_indent = b_indent;
		this.b_name = b_name;
		this.b_title = b_title;
		this.b_content = b_content;
	}

	public int getB_id() {
		return b_id;
	}

	public void setB_id(int b_id) {
		this.b_id = b_id;
	}

	public int getB_hit() {
		return b_hit;
	}

	public void setB_hit(int b_hit) {
		this.b_hit = b_hit;
	}

	public int getB_group() {
		return b_group;
	}

	public void setB_group(int b_group) {
		this.b_group = b_group;
	}

	public int getB_step() {
		return b_step;
	}

	public void setB_step(int b_step) {
		this.b_step = b_step;
	}

	public int getB_indent() {
		return b_indent;
	}

	public void setB_indent(int b_indent) {
		this.b_indent = b_indent;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_filesrc() {
		return b_filesrc;
	}

	public void setB_filesrc(String b_filesrc) {
		this.b_filesrc = b_filesrc;
	}

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	private List<CommonsMultipartFile> files;

	public List<CommonsMultipartFile> getFiles() {
		
		return files;
	}

	public void setFiles(List<CommonsMultipartFile> files) {
		
		this.files = files;
	}

}
