package pack.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.board.model.BoardDaoInter;
import pack.board.model.BoardDto;

@Controller
public class BoardUpdateController {
	
	@Autowired
	private BoardDaoInter inter;
	
	@RequestMapping(value="boardUpdate", method=RequestMethod.GET)
	public ModelAndView edit(@RequestParam("board_no") int board_no,
			@RequestParam("page") String page) {
		
		// 모델에서 수정할 자료 읽기
		BoardDto dto = inter.getDetail(board_no);
		
		ModelAndView view = new ModelAndView("boardUpdate");
		view.addObject("data", dto);
		view.addObject("page", page);
		return view;
	}
	
	@RequestMapping(value="boardUpdate", method=RequestMethod.POST)
	public ModelAndView editSubmit(BoardBean bean,
			@RequestParam("page") String page) {
		
		ModelAndView view = new ModelAndView();
			boolean b = inter.update(bean);
			if(b) {
				//view.setViewName("redirect:/list?page="+page);
				view.setViewName("redirect:/boardDetail?board_no="+bean.getBoard_no()+"&page="+page);
			}else {
				view.setViewName("redirect:/boardError");
			}
			return view;
	}
}
