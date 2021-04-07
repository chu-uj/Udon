package pack.wish.model;

public class WishDto{
	private String wish_id;
	private String like_check;
	private String product_id;
	private String  user_id;
	
	public String getWish_id() {
		return wish_id;
	}
	public void setWish_id(String wish_id) {
		this.wish_id = wish_id;
	}
	public String getLike_check() {
		return like_check;
	}
	public void setLike_check(String like_check) {
		this.like_check = like_check;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}
