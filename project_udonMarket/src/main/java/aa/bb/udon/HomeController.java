package aa.bb.udon;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pack.product.model.ProductDaoInter;
import pack.product.model.ProductDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	@Autowired
	private ProductDaoInter Inter;

	private int totalCount; // 전체 레코드 수
	private int countPerPage = 8; // 한 페이지 당 행의 수
	private int pageCount; // 전체 페이지 수

	public ArrayList<ProductDto> getListData(ArrayList<ProductDto> list, int page) {
		ArrayList<ProductDto> result = new ArrayList<ProductDto>();
		int start = (page - 1) * countPerPage; // 첫 게시물
		int size = countPerPage <= list.size() - start ? countPerPage : list.size() - start;
		for (int i = 0; i < size; i++) {
			result.add(i, list.get(start + i));
		}

		return result;
	}

	public int getPageCount() { // get 페이지 수
		pageCount = totalCount / countPerPage;
		if (totalCount % countPerPage > 0)
			pageCount += 1;

		return pageCount;
	}
	
	@RequestMapping(value = {"/", "home"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		int page =1;
		totalCount = Inter.product_totalCnt();
		ArrayList<ProductDto> list = Inter.getProductList();
		ArrayList<ProductDto> result = getListData(list, page);
		model.addAttribute("data",result);
		model.addAttribute("pageCount",getPageCount());
		model.addAttribute("page",page);
		//model.addAttribute("data",list); // 페이징 없이 작업할 경우
		return "index";
	}
}
