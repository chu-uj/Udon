package pack.chat.model;

import java.util.List;

import pack.chat.controller.ChatRoomBean;

public interface ChatDaoInter {
	boolean createRoom(ChatRoomBean bean)throws Exception;
	ChatRoomDto isRoom(ChatRoomBean bean)throws Exception;
	ChatRoomDto searchRoom(String chat_id);
	boolean insertMessage(ChatMsgDto dto)throws Exception;
	String getPartner(ChatRoomBean bean)throws Exception;
	String getProfile(String str)throws Exception;
	String getName(String str)throws Exception;
	List<ChatMsgDto> getMessageList(String str)throws Exception;
	List<ChatRoomDto> getSellRoomList(String str)throws Exception;
	List<ChatRoomDto> getBuyRoomList(String str)throws Exception;
	ChatMsgDto getRecentMessage(String str)throws Exception;
	//String isGetMessageList(String str)throws Exception;
	
	String getTutorId(String str)throws Exception;
	List<ChatRoomDto> getRoomListTutor(String str)throws Exception;
	void updateReadTime(String class_id , String user_id , String buyer_id)throws Exception;
	void updateReadTimeTutor(String class_id , String user_id , String buyer_id)throws Exception;
	
	int getUnReadCount(String buyer_id, String class_id, String user_id)throws Exception;
	int getUnReadCountTutor(String buyer_id, String class_id, String user_id)throws Exception;
	
	int getAllCount(String str);
	
	int chatroom_currentNum();
	int chatmsg_currentNum();
	
}
