package pack.product.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.product.model.ProductDaoInter;
import pack.wish.controller.WishBean;
import pack.wish.model.WishDaoInter;
import pack.wish.model.WishDto;

@Controller
public class ProductDetailController {
	@Autowired
	private ProductDaoInter productDaoInter;
	
	@Autowired
	private WishDaoInter wishDaoInter;
	
	@RequestMapping("productDetail")
	public ModelAndView detailProcess(@RequestParam("product_id") int product_id,
			@RequestParam("page") String page, HttpServletRequest request) {
		
		// 조회수 증가 작업 선행
		boolean b = productDaoInter.product_updateViews(product_id);
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		boolean existWish = false;
		WishBean bean = new WishBean(); 
		bean.setUser_id(user_id);
		bean.setProduct_id(product_id);
		
		ArrayList<WishDto> list = wishDaoInter.select_userProduct_wishlist(bean);
		System.out.println(list.size()+" "+user_id+" "+product_id);
		if(list.size() == 0) {
			existWish = false;
		}else {
			existWish = true;
		}
		
		// 상세보기 진행 후 jsp로 출력
		ModelAndView view = new ModelAndView("productDetail");
		view.addObject("data", productDaoInter.getProductDetail(product_id));
		view.addObject("page", page);
		view.addObject("existWish",existWish);

		return view;
	}
}
