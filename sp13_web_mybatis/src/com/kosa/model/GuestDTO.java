package com.kosa.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GuestDTO { // Model

	private int num;
	private String name, email, home, contents;
	private Date regdate;
}
