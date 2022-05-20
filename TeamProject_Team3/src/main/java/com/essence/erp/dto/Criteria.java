package com.essence.erp.dto;

public class Criteria {

	private int pageNum;
	private int pageSize;
	private int currentPage;

	public Criteria() {
		this.pageNum = 1;
		this.pageSize = 10;
	}

	public void setPageNum(int pageNum) {
		if (pageNum <= 0) {
			this.pageNum = 1;
			return;
		} // if

		this.pageNum = pageNum;
	}

	public int getPageStart() {
		currentPage = pageNum;
		return (currentPage * pageSize) - ((pageSize) - 1);
	}

	public int getPageEnd() {
		currentPage = pageNum;
		return (currentPage * pageSize);
	}

	public int getPageNum() {
		return pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public Criteria(int pageNum, int pageSize, int currentPage) {
		super();
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		this.currentPage = currentPage;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", pageSize=" + pageSize + ", currentPage=" + currentPage + "]";
	}
	
	
	
	
	
	//////////////////////////////////////////////////////
	
	private String array_variable;

	public String getArray_variable() {
		return array_variable;
	}

	public void setArray_variable(String array_variable) {
		this.array_variable = array_variable;
	}
	
	private String year, month;

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}
	
	

}
