package pack.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pack.board.model.BoardDto;
import pack.user.model.MyPageDto;
import pack.user.model.UserDaoInter;
import pack.user.model.UserDto;


@Controller
public class UserInfoController {
	
	@Autowired
	private UserDaoInter inter;
	
	private int tot1; // 유저상품 레코드 수
	private int tot2; // 유저게시판 레코드 수
	private int plist=4; // 한 페이지 당 행의 수
	private int pageCount1; // user 상품 페이지 수
	private int pageCount2; // user 게시판 페이지 수
	public ArrayList<MyPageDto> getListData(ArrayList<MyPageDto> list, int page){
		ArrayList<MyPageDto> result = new ArrayList<MyPageDto>();
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
	
	public int getPageCount1() { // get 상품페이지 수
		pageCount1 = tot1/plist;
		if(tot1%plist > 0 ) pageCount1+=1; 
		
		return pageCount1;
	}
	public int getPageCount2() { // get 게시판페이지 수
		pageCount2 = tot2/plist;
		if(tot2%plist > 0 ) pageCount2+=1; 
		
		return pageCount2;
	}
	
	@RequestMapping(value = "userInfo", method = RequestMethod.GET)
	public String mypageMain(HttpSession session,HttpServletRequest request,@RequestParam("user_id")String user_id,
			@RequestParam("page")int page) {
		// 로그인 상태가 아닐경우 로그인 후 오라고 팝업창 발생 및 로그인 페이지로 이동
		//HttpSession session = request.getSession(); 
		UserDto userDto =  (UserDto)session.getAttribute("userDto");
		if(userDto ==null) {
			session.setAttribute("msg", "로그인 후 진행이 가능합니다.");
			return "login"; 
		}
		////////////////////////////////////////////////////
		if(user_id.equals("")) {
			request.setAttribute("user_id", "1");
			return "login";
		}else {
			session.setAttribute("user_id", user_id);
			return "mypage2";
		}
	}
	
	//ajax로 상품정보 넘기기
	@RequestMapping(value = "userProductInfo", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> myPage1(@RequestParam("user_id")String user_id) {
			ArrayList<MyPageDto> list = (ArrayList)inter.getUserInfo(user_id);
			//System.out.println(list.get(0).getProduct_title());
			ArrayList<Map<String, String>> datalist = new ArrayList<Map<String,String>>();
			Map<String, String> datas= null;
			for(MyPageDto m:list) {
				datas = new HashMap<String, String>();
				datas.put("product_id", m.getProduct_id());
				datas.put("category_name", m.getCategory_name());
				datas.put("product_title", m.getProduct_title());
				datas.put("product_image", m.getProduct_image());
				datalist.add(datas);
			}
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("datas", datalist);
			return  result;
	}
	//ajax로 게시물 넘기기
	@RequestMapping(value = "userBoardInfo", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object>myPage2(@RequestParam("user_id")String user_id) {
		ArrayList<MyPageDto> list = (ArrayList)inter.getUserBoard(user_id);
		//System.out.println(list.get(0).getProduct_title());
		ArrayList<Map<String, String>> datalist = new ArrayList<Map<String,String>>();
		Map<String, String> datas= null;
		for(MyPageDto m:list) {
			datas = new HashMap<String, String>();
			datas.put("board_no", m.getBoard_no());
			datas.put("board_title", m.getBoard_title());
			datas.put("board_wrt_date", m.getBoard_wrt_date());
			datas.put("views", m.getViews());
			datalist.add(datas);
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("datas", datalist);
		return  result;
	}
	//ajax로 유저정보넘기기
		@RequestMapping(value = "myInfo", method = RequestMethod.GET)
		@ResponseBody
		public Map<String, Object>myPage3(@RequestParam("user_id")String user_id) {
			ArrayList<MyPageDto> list = (ArrayList)inter.getUserData(user_id);
			MyPageDto dto = inter.userBoardCount(user_id); //유저의 게시물 등록 수 얻기
			int boardNum = Integer.parseInt(dto.getBoardCountNum());//유저가 등록한 게시물 수
			String userGrade = ""; //게시물 수를 기준으로 정의할 유저 등급
			ArrayList<Map<String, String>> datalist = new ArrayList<Map<String,String>>();
			Map<String, String> datas= null;
			for(MyPageDto m:list) {
				datas = new HashMap<String, String>();
				datas.put("user_id", m.getUser_id());
				datas.put("user_name", m.getUser_name());
				datas.put("profile_image", m.getProfile_image());
				datas.put("user_addr", m.getUser_addr());
				datalist.add(datas);
			}
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("datas", datalist);
			if(boardNum>=0 && boardNum<=10) {
				userGrade = "우린이";
			}else if(boardNum>=11&&boardNum<=50){
				userGrade = "우른";
			}else if(boardNum>=51) {
				userGrade = "우조상님";
			}
			result.put("userGrade", userGrade);
			return  result;
		}
}
