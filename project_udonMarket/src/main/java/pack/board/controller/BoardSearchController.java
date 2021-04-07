package pack.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pack.board.model.BoardDaoInter;
import pack.board.model.BoardDto;

@Controller
public class BoardSearchController {
	
	@Autowired
	private BoardDaoInter inter;
	
	@RequestMapping("boardSearch")
	public ModelAndView searchProcess(BoardBean bean) {
		ArrayList<BoardDto> list = inter.getSearch(bean); 
		ModelAndView view = new ModelAndView("boardList", "data", list);
		view.addObject("page","1");
		return view;
	}
}
