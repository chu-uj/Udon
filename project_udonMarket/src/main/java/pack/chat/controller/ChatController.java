package pack.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.chat.model.ChatDaoImpl;
import pack.chat.model.ChatRoomDto;
import pack.user.model.UserDto;

@Controller
public class ChatController {
	
	@Autowired
	private ChatDaoImpl dao; 
	
	@RequestMapping("chat")
	public ModelAndView chatControl(ChatRoomBean bean) {
		// 채팅방 검색
		ChatRoomDto dto = dao.isRoom(bean);
		
	    if(!bean.getSeller_id().equals(bean.getBuyer_id())) {
	    	if(dto == null ) {
	    		// 채팅방 생성.
	    		int newNum = dao.chatroom_currentNum() + 1; // 새로 작성된 글의 번호
	    		bean.setChat_id(Integer.toString(newNum));
	    		System.out.println(bean.getBuyer_id()+" "+bean.getChat_id()+" "+bean.getProduct_id()+" "+bean.getSeller_id());
	    		boolean result = dao.createRoom(bean);
	    		return new ModelAndView("chat","data", bean);
	    	}else {
	    		return new ModelAndView("chat","data", dto);
	    	}
	    }else {
	    	return new ModelAndView("chat/chatError");
	    }
	}
	
	@RequestMapping("chatRoom")
	public ModelAndView chatroom(@RequestParam("user_id") String user_id, HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		// 로그인 상태가 아닐경우 로그인 후 오라고 팝업창 발생 및 로그인 페이지로 이동
		HttpSession session = request.getSession(); 
		UserDto userDto =  (UserDto)session.getAttribute("userDto");
		if(userDto ==null) {
			session.setAttribute("msg", "로그인 후 진행이 가능합니다.");
			view.setViewName("login");
			return view; 
		}
		////////////////////////////////////////////////////
		System.out.println(user_id);
		ArrayList<ChatRoomDto> sellRoomList = (ArrayList)dao.getSellRoomList(user_id);
		ArrayList<ChatRoomDto> buyRoomList = (ArrayList)dao.getBuyRoomList(user_id);
		view.setViewName("/chat/chatroom");
		view.addObject("sell", sellRoomList);
		view.addObject("buy", buyRoomList);
		return view;
	}
	
	@RequestMapping("chatRoomEnter")
	public ModelAndView chatRoomEnter(@RequestParam("chat_id") String chat_id) {
		ModelAndView view = new ModelAndView();
		System.out.println(chat_id);
		ChatRoomDto dto = dao.searchRoom(chat_id);
		view.setViewName("/chat");
		view.addObject("data", dto);
		return view;
	}
}
