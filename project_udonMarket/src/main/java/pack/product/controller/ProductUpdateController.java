package pack.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.product.model.ProductDaoInter;
import pack.product.model.ProductDto;

@Controller
public class ProductUpdateController {
	
	@Autowired
	private ProductDaoInter inter;
	
	@RequestMapping(value="productUpdate", method=RequestMethod.GET)
	public ModelAndView edit(@RequestParam("product_id") int product_id,
			@RequestParam("page") String page) {
		
		// 모델에서 수정할 자료 읽기
		ProductDto dto = inter.getProductDetail(product_id);
		
		ModelAndView view = new ModelAndView("productUpdate");
		view.addObject("data", dto);
		view.addObject("page", page);
		return view;
	}
	
	@RequestMapping(value="productUpdate", method=RequestMethod.POST)
	public ModelAndView editSubmit(ProductBean bean,
			@RequestParam("page") String page) {
		
		ModelAndView view = new ModelAndView();
			boolean b = inter.productUpdate(bean);
			if(b) {
				//view.setViewName("redirect:/list?page="+page);
				view.setViewName("redirect:/productDetail?product_id="+bean.getProduct_id()+"&page="+page);
			}else {
				view.setViewName("redirect:/error");
			}
			return view;
	}
}
