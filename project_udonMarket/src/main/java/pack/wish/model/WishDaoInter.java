package pack.wish.model;

import java.util.ArrayList;

import pack.wish.controller.WishBean;

public interface WishDaoInter {
	ArrayList<String> select_all_wishlist(String user_id);
	ArrayList<WishDto> select_userProduct_wishlist(WishBean bean);
	int wishlist_totalCnt(String user_id);
	boolean delete_wishlist(WishBean bean);
	boolean insert_wishlist(WishBean bean);
	int select_currentNum_wishlist();
}
