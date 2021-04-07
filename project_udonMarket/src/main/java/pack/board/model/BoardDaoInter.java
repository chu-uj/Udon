package pack.board.model;

import java.util.ArrayList;

import pack.board.controller.BoardBean;
import pack.user.model.UserDto;

public interface BoardDaoInter {
	ArrayList<BoardDto> getList();
	ArrayList<BoardDto> getSearch(BoardBean bean);
	boolean insert(BoardBean bean);
	BoardDto getDetail(int board_no);
	boolean update(BoardBean bean);
	boolean delete(int board_no);
	
	int currentNum();
	int totalCnt();
	boolean updateViews(int board_no);
	String selectPass(String num);
	
	boolean updateOrder_number(BoardBean bean);
	boolean insertReply(BoardBean bean);
}
