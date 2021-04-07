package pack.product.controller;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.product.model.ProductComparator;
import pack.product.model.ProductDaoInter;
import pack.product.model.ProductDto;

@Controller
public class ProductListController {
	@Autowired
	private ProductDaoInter Inter;
	
	private int totalCount; // 전체 레코드 수
	private int countPerPage=8; // 한 페이지 당 행의 수
	private int pageCount; // 전체 페이지 수
	
	public ArrayList<ProductDto> getListData(ArrayList<ProductDto> list, int page){
		ArrayList<ProductDto> result = new ArrayList<ProductDto>();
		int start = (page - 1)*countPerPage; // 첫 게시물 
		int size = countPerPage <= list.size() - start ? countPerPage : list.size() - start;
		/*
		if(countPerPage <= list.size() - start) {
			size = countPerPage;
		}else {
			size = list.size() - start;
		}
		*/
		for(int i=0; i<size;i++) {
			result.add(i, list.get(start + i));
		}
		return result;
	}
	
	public int getPageCount() { // get 페이지 수
		pageCount = totalCount/countPerPage;
		if(totalCount%countPerPage > 0 ) pageCount+=1; 
		
		return pageCount;
	}
	
	@RequestMapping("productList")
	public Model process(Model model, HttpServletRequest request) {
		int page =0;
		try {
			page=Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			page = 1;
		}
		if(page <= 0) page = 1;
		totalCount = Inter.product_totalCnt();
		ArrayList<ProductDto> list = Inter.getProductList();
		ArrayList<ProductDto> result = getListData(list, page);
		model.addAttribute("data",result);
		model.addAttribute("pageCount",getPageCount());
		model.addAttribute("page",page);
		//model.addAttribute("data",list); // 페이징 없이 작업할 경우
		return model;
	}
	
	@RequestMapping("productListSort")
	public ModelAndView processSort(ModelAndView view, HttpServletRequest request,
			@RequestParam("order_by")String order_by) {
		int page =0;
		try {
			page=Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			page = 1;
		}
		if(page <= 0) page = 1;
		totalCount = Inter.product_totalCnt();
		//거래완료 안보기
		ArrayList<ProductDto> list = new ArrayList<ProductDto>();
		if(order_by.equals("selling")) {
			list = Inter.getSellingProductList();
			view.addObject("checked","checked");  //거래완료 안보기 체크
		}else {
			list = Inter.getProductList();
		}
		//정렬기준 처리
		ProductComparator com = new ProductComparator();
		com.order_by = order_by;
		Collections.sort(list,com);
		
		ArrayList<ProductDto> result = getListData(list, page);
		view.addObject("data",result);
		view.addObject("pageCount",getPageCount());
		view.addObject("page",page);
		view.setViewName("productList");
		
		return view;
	}
}
