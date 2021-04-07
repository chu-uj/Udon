package pack.chat.model;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pack.chat.controller.ChatMsgBean;
import pack.chat.controller.ChatRoomBean;

public interface ChatAnnoInter {
	@Select("SELECT chat_id, user_id, product_id, user_nickname FROM chat_room")
	public List<ChatRoomDto> select_all_chatRoom();
	
	@Insert("INSERT INTO chat_room VALUES(#{chat_id}, #{seller_id}, #{product_id}, #{buyer_id})")
	public int insert_chatRoom(ChatRoomBean bean);
	
	@Select("SELECT * FROM chat_room WHERE seller_id = #{seller_id} and product_id = #{product_id} and buyer_id = #{buyer_id}")
	public ChatRoomDto select_ChatRoom(ChatRoomBean bean);
	
	@Select("SELECT * FROM chat_room WHERE chat_id = #{chat_id}")
	public ChatRoomDto select_chatRoom_chatId(String chat_id);
	
	@Insert("INSERT INTO chat_msg VALUES(#{msg_no}, #{msg_sender}, #{msg_receiver}, #{msg_content}, #{msg_send_time}, #{msg_read_time}, #{chat_id}, #{seller_id}, #{buyer_id}, #{product_id})")
	public int insert_chatMsg(ChatMsgDto dto);
	
	@Select("SELECT seller_id FROM chat_msg WHERE product_id = #{product_id} and buyer_id = #{buyer_id}")
	public List<ChatMsgDto> select_msg_userId(ChatRoomBean bean);
	
	//@Select("select user_profileImagePath from USER WHERE user_id = #{user_id}")
	//public String getProfile();
	
	@Select("SELECT user_name FROM user where user_id = #{user_id}")
	public String select_getName(String user_id);
	
	@Select("SELECT m.* , user_name FROM chat_msg m left outer join USER u on m.msg_sender = u.user_id WHERE chat_id = #{chat_id}")
	public List<ChatMsgDto> select_getMessageList(String chat_id);
	
	@Select("SELECT chat_id, seller_id, c.product_id, buyer_id, product_title, product_image FROM chat_room c, product p WHERE seller_id = #{seller_id} and c.product_id = p.product_id")
	public List<ChatRoomDto> select_getSellRoomList(String seller_id);
	
	@Select("SELECT chat_id, seller_id, c.product_id, buyer_id, product_title, product_image FROM chat_room c, product p WHERE buyer_id = #{buyer_id} and c.product_id = p.product_id")
	public List<ChatRoomDto> select_getBuyRoomList(String buyer_id);
	
	@Select("SELECT m.* , class_name, class_id , TUTOR_tutor_id FROM chat_msg m left outer join CLASS c on m.CLASS_class_id = c.class_id WHERE chat_id = #{chat_id} order by msg_id desc limit 1")
	public ChatMsgDto select_getRecentMessage(String chat_id);
	
	@Select("SELECT tutor_id FROM TUTOR WHERE USER_user_id = #{USER_user_id}")
	public String select_getTutorId(String str);
	
	@Update("UPDATE chat_msg SET msg_read_time = now() WEHRE buyer_id = #{buyer_id} AND product_id = #{product_id} AND msg_read_time = msg_send_time and msg_sender = buyer_id and seller_id = #{seller_id}")
	public int update_updateReadTime(ChatMsgBean bean);
	
	@Update("UPDATE chat_msg SET msg_read_time = now() WHERE buyer_id = #{buyer_id} AND product_id = #{product_id} AND msg_read_time = msg_sendTime and msg_sender = seller_id and seller_id = #{seller_id}")
	public int update_updateReadTimeTutor(ChatMsgBean bean);
	
	@Select("SELECT count(*) FROM chat_msg where seller_id = #{seller_id} and buyer_id = #{buyer_id} AND product_id = #{product_id} AND message_readTime = message_sendTime and message_sender = TUTOR_USER_user_id")
	public int select_getUnReadCount(ChatMsgBean bean);
	
	@Select("SELECT count(*) FROM chat_msg WHERE buyer_id =#{buyer_id} and CLASS_class_id = #{CLASS_class_id} AND msg_read_time = msg_send_time AND msg_sender = USER_user_id and USER_user_id = #{USER_user_id}")
	public int select_getUnReadCountTutor(ChatMsgBean bean);
	
	@Select("SELECT count(*) FROM chat_msg WHERE (buyer_id = #{buyer_id} and msg_read_time = msg_send_time and msg_sender != #{seller_id}) or (seller_id = #{seller_id} and msg_read_time = msg_send_time AND msg_sender != #{seller_id}")
	public int select_getAllCount(ChatMsgBean bean);
	
	@Select("SELECT max(chat_id) FROM chat_room")
	public String select_current_chatId();
	
	@Select("SELECT max(msg_no) FROM chat_msg")
	public String select_current_msgNo();
}
