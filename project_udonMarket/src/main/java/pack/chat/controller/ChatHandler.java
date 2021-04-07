package pack.chat.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import pack.chat.model.ChatDaoImpl;
import pack.chat.model.ChatMsgDto;
import pack.chat.model.ChatRoomDto;
import pack.user.model.UserDto;

public class ChatHandler extends TextWebSocketHandler {
	
	@Inject
	private ChatDaoImpl dao;
	
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
	private List<WebSocketSession> connectedUsers;

	public ChatHandler() {
	      connectedUsers = new ArrayList<WebSocketSession>();
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log(session.getId() + " 연결 됨!!");
		users.put(session.getId(), session); // 연결시 key - id / value - session으로 저장한다.
		connectedUsers.add(session);         // session을 추가한다.
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log(session.getId() + " 연결 종료됨");
		connectedUsers.remove(session); // 연결 종료시 해당 session를 제거한다.
		users.remove(session.getId()); // key id의 값을 제거.
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(message.getPayload());
		//DB 구현
		ChatMsgDto chatMsgDto = ChatMsgDto.convertMessage(message.getPayload());
		int msg_no = dao.chatmsg_currentNum();
		chatMsgDto.setMsg_no(msg_no);
		chatMsgDto.setMsg_send_time();
		
		System.out.println("1 : " + chatMsgDto.toString());
		//buyer = 자신
		ChatRoomBean chatRoomBean  = new ChatRoomBean();
		chatRoomBean.setProduct_id(chatMsgDto.getProduct_id());
	    chatRoomBean.setSeller_id(chatMsgDto.getSeller_id());
	    chatRoomBean.setBuyer_id(chatMsgDto.getBuyer_id());
	    /*
	    ChatRoomDto croom =null;
	    croom = dao.isRoom(chatRoomBean);
	    chatMsgDto.setChat_id(croom.getChat_id());
	    if(croom.getSeller_id().equals(chatMsgDto.getMsg_sender())) {
	    	chatMsgDto.setMsg_receiver(chatRoomBean.getBuyer_id());
	    }else {
	    	chatMsgDto.setMsg_receiver(chatRoomBean.getSeller_id());
	    }
	    */
	    Map<String, Object> map = null;
	    for (WebSocketSession websocketSession : connectedUsers) {
	    	map = websocketSession.getAttributes();
	    	System.out.println(map);
	    	//UserDto userDto = (UserDto) map.get("userDto");
	    	//받는사람
	    	Gson gson = new Gson();
	    	String msgJson = gson.toJson(chatMsgDto);
	    	websocketSession.sendMessage(new TextMessage(msgJson));
	    }
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}
}