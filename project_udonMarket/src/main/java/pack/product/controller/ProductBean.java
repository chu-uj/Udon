package pack.product.controller;

import java.util.Calendar;

public class ProductBean {
	private String user_id,product_title,write_date,update_date,product_image,product_content;
	private int product_id,category_id,product_price,product_status,views;
	private String searchName_Product, searchValue_Product;
	
	public void setWrite_date() {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int min = cal.get(Calendar.MINUTE);
		int sec = cal.get(Calendar.SECOND);
		this.write_date = year + "-" + month + "-" + day 
				+ " " + hour + ":" + min + ":" + sec;
	}

	public String getSearchName_Product() {
		return searchName_Product;
	}

	public void setSearchName_Product(String searchName_Product) {
		this.searchName_Product = searchName_Product;
	}

	public String getSearchValue_Product() {
		return searchValue_Product;
	}

	public void setSearchValue_Product(String searchValue_Product) {
		this.searchValue_Product = searchValue_Product;
	}
	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getProduct_title() {
		return product_title;
	}

	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public String getUpdate_date() {
		return update_date;
	}
	
	
	public void setUpdate_date() {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int min = cal.get(Calendar.MINUTE);
		int sec = cal.get(Calendar.SECOND);
		this.update_date = year + "-" + month + "-" + day 
				+ " " + hour + ":" + min + ":" + sec;
	}
	
	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

	public String getProduct_content() {
		return product_content;
	}

	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getProduct_status() {
		return product_status;
	}

	public void setProduct_status(int product_status) {
		this.product_status = product_status;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}


	
}
