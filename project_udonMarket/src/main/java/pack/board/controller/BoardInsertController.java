
package pack.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pack.board.model.BoardDaoInter;

@Controller
public class BoardInsertController {
	
	@Autowired
	private BoardDaoInter boardInter;
	
	@RequestMapping(value="boardInsert", method = RequestMethod.GET)
	public String insert() {
		return "boardInsform";
	}
	
	@RequestMapping(value="boardInsert", method = RequestMethod.POST)
	public String submit(BoardBean bean) {
		bean.setBoard_wrt_date();
		int newNum = boardInter.currentNum() + 1; // 새로 작성된 글의 번호
		bean.setBoard_no(newNum);
		bean.setGroup_number(newNum);
		
		boolean b= boardInter.insert(bean);
		if(b) {
			return "redirect:/boardList?page=1";
		}else {
			return "redirect:/boardError";
		}
	}
}
