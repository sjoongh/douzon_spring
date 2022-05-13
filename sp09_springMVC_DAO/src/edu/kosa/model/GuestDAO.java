package edu.kosa.model;

import java.util.List;

public interface GuestDAO { // DB연결
	
	public List listGuest(); // selectAll
	public void insertGuest(GuestDTO dto); // insert
}
