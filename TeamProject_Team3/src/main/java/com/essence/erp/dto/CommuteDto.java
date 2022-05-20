package com.essence.erp.dto;

import java.security.Timestamp;
import java.util.Date;

public class CommuteDto {
	   int commute_num;
	   String emp_num; 
	   String status; 
	   String year;
	   String month;
	   String day;
	   String hour ;
	   String minute; 
	   String second ;
	   Date tempo_day;
	   String start_date;
	   String end_date;
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public Date getTempo_day() {
		return tempo_day;
	}
	public void setTempo_day(Date tempo_day) {
		this.tempo_day = tempo_day;
	}
	public int getCommute_num() {
		return commute_num;
	}
	public void setCommute_num(int commute_num) {
		this.commute_num = commute_num;
	}
	public String getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(String emp_num) {
		this.emp_num = emp_num;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
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
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getHour() {
		return hour;
	}
	public void setHour(String hour) {
		this.hour = hour;
	}
	public String getMinute() {
		return minute;
	}
	public void setMinute(String minute) {
		this.minute = minute;
	}
	public String getSecond() {
		return second;
	}
	public void setSecond(String second) {
		this.second = second;
	}
	
	
}
