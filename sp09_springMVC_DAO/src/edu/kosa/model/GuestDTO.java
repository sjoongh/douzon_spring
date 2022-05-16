package edu.kosa.model;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//@Getter
//@Setter
//@ToString
@AllArgsConstructor
@NoArgsConstructor
@Data // setter, getter, tostring ...
@Component
public class GuestDTO { // Model
	
	private int num;
	private String name, email, home, contents;
	
}
