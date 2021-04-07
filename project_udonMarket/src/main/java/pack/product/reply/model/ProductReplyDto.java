package pack.product.reply.model;

import java.util.Calendar;

public class ProductReplyDto {
	private Integer reply_no, product_id;       
    private String user_id, reply_content, reply_date, reply_updatedate; 
  
	public Integer getReply_no() {
		return reply_no;
	}
	public void setReply_no(Integer reply_no) {
		this.reply_no = reply_no;
	}
	public Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date() {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int min = cal.get(Calendar.MINUTE);
		int sec = cal.get(Calendar.SECOND);
		this.reply_date = year + "-" + month + "-" + day 
				+ "  " + hour + ":" + min + ":" + sec;
	}
	public String getReply_updatedate() {
		return reply_updatedate;
	}
	public void setReply_updatedate() {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int min = cal.get(Calendar.MINUTE);
		int sec = cal.get(Calendar.SECOND);
		this.reply_updatedate = year + "-" + month + "-" + day 
				+ " " + hour + ":" + min + ":" + sec;
	}   
    
    
}
