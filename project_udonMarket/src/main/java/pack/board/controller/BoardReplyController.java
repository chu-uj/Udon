package pack.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.board.model.BoardDaoInter;

@Controller
public class BoardReplyController {
	
	@Autowired
	private BoardDaoInter inter;
	
	@RequestMapping(value="boardReply", method=RequestMethod.GET)
	public ModelAndView reply(@RequestParam("board_no") int board_no,
			@RequestParam("page") String page) {
		ModelAndView view = new ModelAndView("boardReply");
		view.addObject("data", inter.getDetail(board_no)); // 원글의 데이터
		return view;
	}
	
	@RequestMapping(value="boardReply", method=RequestMethod.POST)
	public String replySubmit(BoardBean bean,
			@RequestParam("page") String page) {
		// order_number 갱신
		bean.setOrder_number(bean.getOrder_number() + 1);
		inter.updateOrder_number(bean); // 반환값 처리 필요.
		
		// 덧글 저장
		bean.setBoard_wrt_date(); // 작성일 set
		bean.setBoard_no(inter.currentNum() + 1); // 새로운 글의 번호
		bean.setIndent(bean.getIndent() + 1); // 들여쓰기
		
		if(inter.insertReply(bean)) {
			return "redirect:boardList?page="+page; // 추가 후 글 목록 보기			
		}else {
			return "redirect:boardError";
		}
		
	}
}
