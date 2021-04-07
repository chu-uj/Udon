package pack.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.product.model.ProductDaoInter;
import pack.product.model.ProductDto;

@Controller
public class ProductDeleteController {
	@Autowired
	private ProductDaoInter productDaointer;
	
	@RequestMapping("productDelete")
	public ModelAndView del(@RequestParam("product_id") int product_id) {
		ProductDto dto = productDaointer.getProductDetail(product_id);
		ModelAndView view = new ModelAndView();
		boolean b = productDaointer.productDelete(product_id);
		if(b) {
			view.setViewName("deldone");
		}else {
			view.setViewName("redirect:/error");
		}
		return view;
	}
}
