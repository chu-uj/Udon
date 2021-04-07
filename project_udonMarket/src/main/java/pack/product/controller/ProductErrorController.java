package pack.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductErrorController {
	
	@RequestMapping("ProductError")
	public String err() {
		return "error";
	}
}
