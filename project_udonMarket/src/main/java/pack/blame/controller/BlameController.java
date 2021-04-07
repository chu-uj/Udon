package pack.blame.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.blame.model.BlameBean;
import pack.blame.model.BlameDao;
import pack.blame.model.BlameDto;

@Controller
public class BlameController {
	
	@Autowired
	private BlameDao dao;
	
	@RequestMapping(value = "blame", method = RequestMethod.GET)//신고 입력 페이지로
	public String blameinput() {
		return "blame";
	}
	@RequestMapping(value = "blame", method = RequestMethod.POST)// 신고 입력 처리
	public String blameInsert(BlameBean bean, HttpServletRequest request) {
		BlameDto dto = dao.getMaxBoard();
		String boardNum = String.valueOf(Integer.parseInt(dto.getCurrentBoard())+1);
		bean.setBlame_id(boardNum);
		boolean success = dao.insertBlame(bean);
		
		if(success) {
			return "redirect:/home?loginCheck=1";
		}else {
			return "blame";
		}
	}
	@RequestMapping("blamelist")
	public ModelAndView blameList(@RequestParam("page") String page) {// 신고 리스트 보기
		List<BlameDto> list1 = dao.getBlameList();
		List<BlameDto> list = dao.blamePageList(page);
		ModelAndView view = new ModelAndView();
		view.addObject("list", list);
		int totalPageNum = (int) Math.ceil(list1.size()/10.0);
		//System.out.println(list1.size()/10.0);
		view.addObject("totalPage", totalPageNum);
		view.addObject("page", page);
		view.setViewName("blamelist");
		
		return view;
	}
	@RequestMapping("blameSearch")
	public ModelAndView searchBlame(@RequestParam("page") String page,
			BlameBean bean) {
		ModelAndView view = new ModelAndView();
		List<BlameDto> list = dao.search(bean,page);
		if(list==null) {
			view.addObject("page", page);
			view.setViewName("blamelist");
			return view;
		}else {
			System.out.println(list.size());
			view.addObject("list", list);
			view.addObject("page", page);
			view.setViewName("blameSearchList");
			return view;
		}
	}
	@RequestMapping("blameDetail")
	public ModelAndView blameDetail(@RequestParam("blame_id") String blame_id,
			@RequestParam("page") String page) {//신고 정보 보기
		BlameDto dto = dao.blameOne(blame_id);
		ModelAndView view = new ModelAndView();
		view.setViewName("blameDetail");
		view.addObject("page", page);
		view.addObject("data", dto);
		return view;
	}
	
	@RequestMapping(value = "blameUpdate", method = RequestMethod.GET)
	public ModelAndView blameUpdate(@RequestParam("blame_id") String blame_id,
			@RequestParam("page") String page) {
		BlameDto dto = dao.blameOne(blame_id);
		ModelAndView view = new ModelAndView();
		view.addObject("data", dto);
		view.addObject("page", page);
		view.setViewName("blameUpdateForm");
		return view;
	}
	@RequestMapping(value = "blameUpdate", method = RequestMethod.POST)
	public String blameUpdateResult(BlameBean bean, @RequestParam("page") String page) {
		boolean success = dao.updateBlame(bean);
		
		if(success) {
			return "redirect:/blamelist?page="+page;
		}else {
			return "updateform";
		}
	}
	@RequestMapping("blameDelete")
	public String blameDelete(@RequestParam("blame_id")String blame_id, @RequestParam("page") String page) {
		boolean success = dao.deleteBlame(blame_id);
		if(success) {
			return "redirect:/blamelist?page="+page;
		}else {
			return "blameDetail";
		}
	}
}
