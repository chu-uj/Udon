package pack.chat.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import pack.chat.controller.ChatMsgBean;
import pack.chat.controller.ChatRoomBean;

@Repository
public class ChatDaoImpl implements ChatDaoInter{
	
	@Autowired
	@Qualifier("chatAnnoInter")
	private ChatAnnoInter inter;
	
	public List<ChatRoomDto> select_all_chatRoom(){
		return inter.select_all_chatRoom();
	}

	@Override
	public boolean createRoom(ChatRoomBean bean){
		int result= 0;
		try {
			result = inter.insert_chatRoom(bean);
			if(result>0) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			System.out.println("createRoom err "+e);
			return false;
		}
	}

	@Override
	public ChatRoomDto isRoom(ChatRoomBean bean){
		return inter.select_ChatRoom(bean);
	}

	@Override
	public boolean insertMessage(ChatMsgDto dto) throws Exception {
		int result= 0;
		try {
			result = inter.insert_chatMsg(dto);
			if(result>0) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			System.out.println("createRoom err "+e);
			return false;
		}
	}

	@Override
	public String getPartner(ChatRoomBean bean) throws Exception {
		List<ChatMsgDto> mvo = inter.select_msg_userId(bean);
		return mvo.get(0).getSeller_id();
	}
	
	@Override
	public String getProfile(String str) throws Exception {
		return null;//session.selectOne(namespace+".getProfile" , str);
	}
	
	@Override
	public String getName(String str) throws Exception {
		return inter.select_getName(str);
	}
	
	@Override
	public List<ChatMsgDto> getMessageList(String chat_id) throws Exception {
		return inter.select_getMessageList(chat_id);
	}

	@Override
	public List<ChatRoomDto> getSellRoomList(String seller_id){
		return inter.select_getSellRoomList(seller_id);
	}
	
	@Override
	public List<ChatRoomDto> getBuyRoomList(String buyer_id){
		return inter.select_getBuyRoomList(buyer_id);
	}

	@Override
	public ChatMsgDto getRecentMessage(String str) throws Exception {
		return inter.select_getRecentMessage(str);
	}
	
	@Override
	public String getTutorId(String str) throws Exception {
		return inter.select_getTutorId(str);
	}
	
	@Override
	public List<ChatRoomDto> getRoomListTutor(String str) throws Exception {
		return null;//inter.select_getRoomListTutor(str);
	}
	
	@Override
	public void updateReadTime(String product_id, String seller_id, String buyer_id) throws Exception {
		ChatMsgBean bean = new ChatMsgBean();
		bean.setProduct_id(product_id);
		bean.setSeller_id(seller_id);
		bean.setBuyer_id(buyer_id);
		/*
		 * HashMap<String, Object> map = new HashMap<String, Object> ();
		 * map.put("TUTOR_USER_user_id", TUTOR_USER_user_id); map.put("USER_user_id",
		 * user_id); map.put("CLASS_class_id", class_id);
		 */
		inter.update_updateReadTime(bean);
	}
	
	@Override
	public int getUnReadCount(String buyer_id, String product_id, String seller_id) throws Exception {
		ChatMsgBean bean = new ChatMsgBean();
		bean.setProduct_id(product_id);
		bean.setSeller_id(seller_id);
		bean.setBuyer_id(buyer_id);
		/*
		 * HashMap<String, Object> map = new HashMap<String, Object> ();
		 * map.put("TUTOR_USER_user_id", TUTOR_USER_user_id); map.put("USER_user_id",
		 * user_id); map.put("CLASS_class_id", class_id);
		 */
		return inter.select_getUnReadCount(bean);
	}
	
	@Override
	public int getAllCount(String str) {
		ChatMsgBean bean = new ChatMsgBean();
		bean.setSeller_id(str);
		bean.setBuyer_id(str);
		/*
		 * HashMap<String, Object> map = new HashMap<String, Object> ();
		 * map.put("USER_user_id", str); map.put("TUTOR_USER_user_id", str);
		 */
		if(inter.select_getAllCount(bean)>0) {
			return 0;
		}else {
			
			return inter.select_getAllCount(bean);
		}
	}
	
	@Override
	public void updateReadTimeTutor(String product_id , String seller_id , String buyer_id) throws Exception {
		ChatMsgBean bean = new ChatMsgBean();
		bean.setProduct_id(product_id);
		bean.setSeller_id(seller_id);
		bean.setBuyer_id(buyer_id);
		
		/*
		 * HashMap<String, Object> map = new HashMap<String, Object> ();
		 * map.put("TUTOR_USER_user_id", TUTOR_USER_user_id); map.put("USER_user_id",
		 * user_id); map.put("CLASS_class_id", class_id);
		 */
		inter.update_updateReadTimeTutor(bean);
	}
	
	@Override
	public int getUnReadCountTutor(String buyer_id, String product_id, String seller_id) throws Exception {
		ChatMsgBean bean = new ChatMsgBean();
		bean.setProduct_id(product_id);
		bean.setSeller_id(seller_id);
		bean.setBuyer_id(buyer_id);
		/*
		 * HashMap<String, Object> map = new HashMap<String, Object> (); 
		 * map.put("TUTOR_USER_user_id", TUTOR_USER_user_id); map.put("USER_user_id",
		 * user_id); map.put("CLASS_class_id", class_id);
		 */
		return inter.select_getUnReadCountTutor(bean);
	}

	@Override
	public int chatroom_currentNum() {
		if(inter.select_current_chatId()==null) {
			return 0;
		}else {
			return Integer.parseInt(inter.select_current_chatId());
		}
	}
	
	@Override
	public int chatmsg_currentNum() {
		if(inter.select_current_msgNo()==null) {
			return 0;
		}else {
			return Integer.parseInt(inter.select_current_msgNo());
		}
	}

	@Override
	public ChatRoomDto searchRoom(String chat_id) {
		return inter.select_chatRoom_chatId(chat_id);
	}
}