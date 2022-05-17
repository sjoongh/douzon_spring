package board.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {

	private int seq, cnt;
	private String title, writer, content;
	private Date regDate;
	private String searchCondition;
	private String searchKeyword;
	
}
