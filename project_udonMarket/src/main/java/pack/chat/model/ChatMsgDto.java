package pack.chat.model;

import java.util.Calendar;

import com.google.gson.Gson;

public class ChatMsgDto {
	private int msg_no;
	private String msg_sender;
	private String msg_receiver;
	private String msg_content;
	private String msg_send_time;
	private String msg_read_time;
	private String chat_id;
	private String seller_id;
	private String buyer_id;
	private String product_id;
	private String message_content;
	
	public int getMsg_no() {
		return msg_no;
	}
	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}
	public String getMsg_sender() {
		return msg_sender;
	}
	public void setMsg_sender(String msg_sender) {
		this.msg_sender = msg_sender;
	}
	public String getMsg_receiver() {
		return msg_receiver;
	}
	public void setMsg_receiver(String msg_receiver) {
		this.msg_receiver = msg_receiver;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public String getMsg_send_time() {
		return msg_send_time;
	}
	public void setMsg_send_time() {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int min = cal.get(Calendar.MINUTE);
		int sec = cal.get(Calendar.SECOND);
		this.msg_send_time = year + "-" + month + "-" + day 
				+ " " + hour + ":" + min + ":" + sec;
	}
	public String getMsg_read_time() {
		return msg_read_time;
	}
	public void setMsg_read_time(String msg_read_time) {
		this.msg_read_time = msg_read_time;
	}
	public String getChat_id() {
		return chat_id;
	}
	public void setChat_id(String chat_id) {
		this.chat_id = chat_id;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	
	public static ChatMsgDto convertMessage(String source) {
		ChatMsgDto message = new ChatMsgDto();
		Gson gson = new Gson();
		message = gson.fromJson(source,  ChatMsgDto.class);
		return message;
	}
	@Override
	public String toString() {
		return "ChatMsgDto [msg_no=" + msg_no + ", msg_sender=" + msg_sender + ", msg_receiver=" + msg_receiver
				+ ", msg_content=" + msg_content + ", msg_send_time=" + msg_send_time + ", msg_read_time="
				+ msg_read_time + ", chat_id=" + chat_id + ", seller_id=" + seller_id + ", buyer_id=" + buyer_id
				+ ", product_id=" + product_id + ", message_content=" + message_content + "]";
	}
}
