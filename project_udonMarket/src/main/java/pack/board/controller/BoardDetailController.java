package pack.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.board.model.BoardDaoInter;

@Controller
public class BoardDetailController {
	@Autowired
	private BoardDaoInter inter;
	
	@RequestMapping("boardDetail")
	public ModelAndView detailProcess(@RequestParam("board_no") int board_no,
			@RequestParam("page") String page) {
		
		// 조회수 증가 작업 선행
		boolean b = inter.updateViews(board_no);
		
		// 상세보기 진행 후 jsp로 출력
		ModelAndView view = new ModelAndView("boardDetail");
		view.addObject("data", inter.getDetail(board_no));
		view.addObject("page", page);
		return view;
		
	}
}
