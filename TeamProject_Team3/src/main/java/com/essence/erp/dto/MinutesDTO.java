package com.essence.erp.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class MinutesDTO {

	private int m_id, m_hit;
	private String m_name, m_title, m_content, m_filesrc;
	private Date m_date;

	public MinutesDTO() {

	}

	public MinutesDTO(int m_id, int m_hit, String m_name, String m_title, String m_content) {
		this.m_id = m_id;
		this.m_hit = m_hit;
		this.m_name = m_name;
		this.m_title = m_title;
		this.m_content = m_content;
	}

	public int getM_id() {
		return m_id;
	}

	public void setM_id(int m_id) {
		this.m_id = m_id;
	}

	public int getM_hit() {
		return m_hit;
	}

	public void setM_hit(int m_hit) {
		this.m_hit = m_hit;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_title() {
		return m_title;
	}

	public void setM_title(String m_title) {
		this.m_title = m_title;
	}

	public String getM_content() {
		return m_content;
	}

	public void setM_content(String m_content) {
		this.m_content = m_content;
	}

	public String getM_filesrc() {
		return m_filesrc;
	}

	public void setM_filesrc(String m_filesrc) {
		this.m_filesrc = m_filesrc;
	}

	public Date getM_date() {
		return m_date;
	}

	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}

	private List<CommonsMultipartFile> files;

	public List<CommonsMultipartFile> getFiles() {
		
		return files;
	}

	public void setFiles(List<CommonsMultipartFile> files) {
		
		this.files = files;
	}

}
