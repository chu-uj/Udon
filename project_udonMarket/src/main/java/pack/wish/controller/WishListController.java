package pack.wish.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pack.product.model.ProductDaoInter;
import pack.product.model.ProductDto;
import pack.user.model.UserDto;
import pack.wish.model.WishDaoInter;

@Controller
public class WishListController {
	
	@Autowired
	private WishDaoInter wishDaoInter;
	@Autowired
	private ProductDaoInter productDaoInter;
	
	private int totalCount; // 전체 레코드 수
	private int countPerPage=10; // 한 페이지 당 행의 수
	private int pageCount; // 전체 페이지 수
	
	public ArrayList<ProductDto> getListData(ArrayList<ProductDto> list, int page){
		ArrayList<ProductDto> result = new ArrayList<ProductDto>();
		int start = (page - 1)*countPerPage; // 첫 게시물 
		int size = 0;
		
		if(countPerPage <= (list.size() - start)) {
			size = countPerPage;
		}else {
			size = list.size() - start;
		}
		
		for(int i=0; i<size;i++) {
			result.add(i, list.get(start + i));
		}
		return result;
	}
	
	public int getPageCount_wishlist() { // get 페이지 수
		pageCount = totalCount/countPerPage;
		if(totalCount%countPerPage > 0 ) pageCount+=1; 
		
		return pageCount;
	}
	
	@RequestMapping("wishList")
	public ModelAndView wishController(/* Model model, */HttpServletRequest request) {
		ModelAndView model = new ModelAndView(); 
		
		
		// 로그인 상태가 아닐경우 로그인 후 오라고 팝업창 발생 및 로그인 페이지로 이동
		HttpSession session = request.getSession(); 
		UserDto userDto =  (UserDto)session.getAttribute("userDto");
		if(userDto ==null) {
			session.setAttribute("msg", "로그인 후 진행이 가능합니다.");
			model.setViewName("login");
			return model; 
		}
		////////////////////////////////////////////////////
		model.setViewName("wishList");
		int page = 0;
		try {
			page=Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			page = 1;
		}
		if(page <= 0) page = 1;
		
		String user_id = request.getParameter("user_id");

		//totalCount = wishDaoInter.wishlist_totalCnt(user_id);
		ArrayList<String> wishList =wishDaoInter.select_all_wishlist(user_id);// 접속 아이디의 wish List의 product_id ArrayList를 받아온다.
		totalCount = wishList.size();
		
		ArrayList<ProductDto> productList = new ArrayList<ProductDto>(); 
		//product 테이블에서 product_id ArrayList와 같은 데이터를 가져온다.
		for(String product_id : wishList) {
			ProductDto productDto = productDaoInter.getProductDetail(Integer.parseInt(product_id));
			productList.add(productDto);
		}
		
		ArrayList<ProductDto> result = getListData(productList, page);
		model.addObject("data", result);
		model.addObject("pageCount",getPageCount_wishlist());
		model.addObject("page",page);
		
		return model;
	}
}
