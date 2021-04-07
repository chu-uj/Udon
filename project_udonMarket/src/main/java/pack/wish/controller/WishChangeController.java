package pack.wish.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pack.wish.model.WishDaoInter;
import pack.wish.model.WishDto;

@Controller
public class WishChangeController {
	
	@Autowired
	private WishDaoInter wishDaoInter;
	
	@RequestMapping(value="wishChange", method=RequestMethod.GET)
	public String wishAdd(@RequestParam("product_id") int product_id,
			@RequestParam("page") String page,
			HttpServletRequest request) {
		/////////////////////////////////////////////////////////////////////////////////
		// 찜하기 기능
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		boolean existWish = false;
		WishBean bean = new WishBean(); 
		bean.setUser_id(user_id);
		bean.setProduct_id(product_id);
		ArrayList<WishDto> list = wishDaoInter.select_userProduct_wishlist(bean);
		if(list.size() > 0) { // wish list가 있으면 삭제(toggle)
			wishDaoInter.delete_wishlist(bean); // delete 실패시 처리 필요 
		}else { // 없으면 생성
			int newNum = wishDaoInter.select_currentNum_wishlist() +1; // 새로 작성된 글의 번호
			bean.setWish_id(newNum);
			wishDaoInter.insert_wishlist(bean); // insert 실패시 처리 필요
		}
		///////////////////////////////////////////////////////////////////////////////
		
		return "redirect:/productDetail?product_id="+product_id+"&page="+page; // 디테일 페이지로 이동.
	}
	
	@RequestMapping(value="listWishChange", method=RequestMethod.GET)
	public String wishAddList(@RequestParam("product_id") int product_id,
			@RequestParam("page") String page,
			HttpServletRequest request) {
		/////////////////////////////////////////////////////////////////////////////////
		// 찜하기 기능
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		boolean existWish = false;
		WishBean bean = new WishBean(); 
		bean.setUser_id(user_id);
		bean.setProduct_id(product_id);
		ArrayList<WishDto> list = wishDaoInter.select_userProduct_wishlist(bean);
		if(list.size() > 0) { // wish list가 있으면 삭제(toggle)
			wishDaoInter.delete_wishlist(bean); // delete 실패시 처리 필요 
		}else { // 없으면 생성
			int newNum = wishDaoInter.select_currentNum_wishlist() +1; // 새로 작성된 글의 번호
			bean.setWish_id(newNum);
			wishDaoInter.insert_wishlist(bean); // insert 실패시 처리 필요
		}
		///////////////////////////////////////////////////////////////////////////////
		
		return "redirect:/productList?page="+page; // 디테일 페이지로 이동.
	}
}
