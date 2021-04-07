package pack.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pack.board.model.BoardDaoInter;
import pack.board.model.BoardDto;

@Controller
public class BoardListController {
	@Autowired
	private BoardDaoInter boardInter;
	
	private int tot; // 전체 레코드 수
	private int plist=10; // 한 페이지 당 행의 수
	private int pageCount; // 전체 페이지 수
	
	public ArrayList<BoardDto> getListData(ArrayList<BoardDto> list, int page){
		ArrayList<BoardDto> result = new ArrayList<BoardDto>();
		int start = (page - 1)*plist; // 첫 게시물 
		int size = plist <= list.size() - start ? plist : list.size() - start;
		/*
		if(plist <= list.size() - start) {
			size = plist;
		}else {
			size = list.size() - start;
		}
		*/
		for(int i=0; i<size;i++) {
			result.add(i, list.get(start + i));
		}
		
		return result;
	}
	
	public int getPageCount() { // get 페이지 수
		pageCount = tot/plist;
		if(tot%plist > 0 ) pageCount+=1; 
		
		return pageCount;
	}
	@RequestMapping("boardList")
	public Model process(Model model, HttpServletRequest request) {
		int page =0;
		try {
			page=Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			page = 1;
		}
		if(page <= 0) page = 1;
		
		tot = boardInter.totalCnt();
		ArrayList<BoardDto> list = boardInter.getList();
		ArrayList<BoardDto> result = getListData(list, page);
		model.addAttribute("data",result);
		model.addAttribute("pageCount",getPageCount());
		model.addAttribute("page",page);
		//model.addAttribute("data",list); // 페이징 없이 작업할 경우
		return model;
	}
}
