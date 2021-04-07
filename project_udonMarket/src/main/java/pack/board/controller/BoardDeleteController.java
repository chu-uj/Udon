package pack.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.board.model.BoardDaoInter;
import pack.board.model.BoardDto;

@Controller
public class BoardDeleteController {
	@Autowired
	private BoardDaoInter inter;
	
	@RequestMapping("boardDelete")
	public ModelAndView del(@RequestParam("board_no") int board_no) {
		BoardDto dto = inter.getDetail(board_no);
		ModelAndView view = new ModelAndView();
		boolean b = inter.delete(board_no);
		if(b) {
			view.setViewName("deldone");
		}else {
			view.setViewName("boardDetail");
		}
		return view;
	}
}
