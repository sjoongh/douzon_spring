package board.view;

import java.util.List;

import board.controller.BoardDAO;
import board.model.BoardVO;

public class MainEntry {

	public static void main(String[] args) {
		
		BoardDAO dao = new BoardDAO();
		
		BoardVO vo = new BoardVO();
//		vo.setTitle("myBatis title");
//		vo.setWriter("김연아");
//		vo.setContent("myBatis content.....");
//		
//		dao.insertBoard(vo);
		
		vo.setSearchCondition("TITLE");
		vo.setSearchKeyword("22");
		List<BoardVO> boardList = dao.getBoardList(vo);
		
		for (BoardVO board : boardList) {
			System.out.println("--->" + board.toString());
		}
		
	}

}
