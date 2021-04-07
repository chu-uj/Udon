package pack.product.reply.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pack.product.model.ProductDto;
import pack.product.reply.model.ProductReplyDto;
import pack.product.reply.model.ProductReplyInter;
 
 
@Controller
public class ProductReplyController {
    
    @Autowired
    private ProductReplyInter inter;
    
    // 댓글 입력
    @RequestMapping(value="productReplyInsert", method = RequestMethod.POST)
    public String insert(@ModelAttribute ProductReplyDto dto, HttpSession session){
        String user_id = (String) session.getAttribute("user_id");
        dto.setUser_id(user_id);
        dto.setReply_date();
        int newNum = inter.currentNum() + 1; // 새로 작성된 댓글의 번호
        dto.setReply_no(newNum);
        inter.insert(dto);
		return "productDetail";
    }
    
    @ResponseBody 
    @RequestMapping(value = "productReplyList", method=RequestMethod.GET)
    public List<ProductReplyDto> list(@RequestParam int product_id){
        List<ProductReplyDto> list = inter.list(product_id);
        return list;
    }
    
    @RequestMapping("productReplyDelete")
	public ModelAndView del(@RequestParam("reply_no") int reply_no,
			@RequestParam("product_id") int product_id,
			@RequestParam("page") String page,
			HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		HttpSession session = request.getSession();
		boolean b = inter.delete(reply_no);
		if(b) {
			System.out.println("삭제까지는 잘됨");
			view.setViewName("redirect:/productDetail?product_id="+product_id+"&page="+page);
		}else {
			view.setViewName("redirect:/error");
		}
		return view;
	}
	
}