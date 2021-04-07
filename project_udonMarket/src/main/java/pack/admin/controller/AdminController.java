package pack.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pack.admin.model.AdminDaoInter;
import pack.admin.model.BanBean;
import pack.admin.model.BanDto;
import pack.blame.model.BlameBean;
import pack.blame.model.BlameDao;
import pack.blame.model.BlameDto;
import pack.product.model.ProductDto;

@Controller
public class AdminController {

	@Autowired
	private AdminDaoInter inter;
	
	@Autowired
	private BlameDao bdao;
	
	@RequestMapping(value = "deleteUser")
	public String deleteProcess(@RequestParam("user_id")String user_id){
		//System.out.println("삭제가 된건가?");
		if(inter.deleteUser(user_id)) {
			return "redirect:/adminIndex";
		}else {
			return "error";
		}

	}
	
	@RequestMapping(value = "deleteProduct")
	public String deleteProces(@RequestParam("product_id")String product_id){
		//System.out.println("삭제가 된건가?");
		if(inter.deleteProduct(product_id)) {
			
			return "redirect:/adminIndex";
		}else {
			return "error";
		}

	}
	/*
	@RequestMapping(value = "deleteBlame")
	public String deleteProce(@RequestParam("blame_id")String blame_id){
		//System.out.println("삭제가 된건가?");
		if(inter.deleteBlame(blame_id)) {
			
			return "redirect:/adminIndex.jsp";
		}else {
			return "error";
		}
	}
	*/
	
	
	@RequestMapping("warninglist")
	@ResponseBody
	public Map<String, Object> warn(){	
		List<Map<String, String>> dataList = new ArrayList<Map<String,String>>();
		
		//System.out.println("확인 한번더");
		Map<String, String> data = null;
		List<ProductDto> userlist = inter.getWarnList();
		
		for(ProductDto p:userlist) {
			data = new HashMap<String, String>();
			data.put("user_id", p.getUser_id());
			data.put("product_id", String.valueOf(p.getProduct_id()));
			data.put("product_title", p.getProduct_title());
			data.put("product_content", p.getProduct_content());
			dataList.add(data);
		}
		Map<String, Object> userDatas = new HashMap<String, Object>(); 
		userDatas.put("wdatas", dataList);
	
		return userDatas;
	}
	
	@RequestMapping("blameAdminList")
	@ResponseBody
	public Map<String, Object> blameAdminList() {// admin창에서 신고 리스트 보기
		List<Map<String, String>> dataList = new ArrayList<Map<String,String>>();
		Map<String, String> data = null;
		List<BlameDto> blamelist = bdao.getBlameList();
		
		for(BlameDto b:blamelist) {
			data = new HashMap<String, String>();
			data.put("blame_id", b.getBlame_id());
			data.put("product_id", b.getProduct_id());
			data.put("blame_reason", b.getDeclaration_reason());
			data.put("blame_detail", b.getDeclaration_detail());
			data.put("blame_date", b.getBlame_date());
			dataList.add(data);
		}
		Map<String, Object> blameDatas = new HashMap<String, Object>(); 
		blameDatas.put("bdatas", dataList);
		
		return blameDatas;
	}
	
	// admin로그인 후 오른쪽 상단 마이페이지 클릭시 adminIndex로
	@RequestMapping(value = "admin")
	public String adminProcess(){

		return "redirect:/adminIndex.jsp";
	}
	
	//admin ban list
	@RequestMapping("banlist")
	@ResponseBody
	public Map<String, Object> banlist() {// admin창에서 신고 리스트 보기
		List<Map<String, String>> dataList = new ArrayList<Map<String,String>>();
		Map<String, String> data = null;
		List<BanDto> banlist = inter.getBanList();
		
		for(BanDto b:banlist) {
			data = new HashMap<String, String>();
			data.put("ban_id", b.getBan_id());
			data.put("ban_word", b.getBan_word());
			dataList.add(data);
		}
		Map<String, Object> banDatas = new HashMap<String, Object>(); 
		banDatas.put("bandatas", dataList);
		
		return banDatas;
	}
	
	//ban 키워드 추가
	@RequestMapping(value = "banInsert", method = RequestMethod.POST)// 신고 입력 처리
	public String banInsert(BanBean bean, HttpServletRequest request) {
		//System.out.println("확인");
		BanDto dto = inter.getMaxBoard();
		String boardNum = String.valueOf(Integer.parseInt(dto.getCurrentBoard())+1);
		//System.out.println(boardNum);
		bean.setBan_id(boardNum);
		boolean success = inter.insertBan(bean);
		if(success) {
			return "redirect:/adminIndex.jsp";
		}else {
			return "redirect:/adminIndex.jsp";
		}
	}
	
	//ban_word 삭제
	@RequestMapping(value = "deleteBan")
	public String deleteBanProcess(@RequestParam("ban_id")String ban_id){
		//System.out.println("삭제가 된건가?");
		if(inter.deleteBan(ban_id)) {
			return "redirect:/adminIndex.jsp";
		}else {
			return "error";
		}

	}
	
}
