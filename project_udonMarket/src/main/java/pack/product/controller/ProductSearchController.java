package pack.product.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pack.product.model.ProductDaoInter;
import pack.product.model.ProductDto;

@Controller
public class ProductSearchController {
	
	@Autowired
	private ProductDaoInter inter;
	
	@RequestMapping("productSearch")
	public ModelAndView productSearch(SearchBean bean) {
		
		List<ProductDto> list = inter.getProductSearchByCategory(bean);
		ModelAndView view = new ModelAndView();
		view.addObject("data", list);
		view.setViewName("productList");
		//System.out.println(list.get(0).getProduct_id()+" "+list.get(0).getProduct_title());
		return view;
	}
}
