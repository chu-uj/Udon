package pack.admin.model;

import java.util.List;

import pack.product.model.ProductDto;

public interface AdminDaoInter {
	AdminDto getLoginInfo(String user_id);
	boolean deleteUser(String user_id);
	
	boolean deleteProduct(String product_id);
	
	//boolean deleteBlame(String blame_id);
	
	
	//new
	List<ProductDto> getWarnList(); 
	List<BanDto> getBanList();
	
	//ban
	public BanDto getMaxBoard();
	public boolean insertBan(BanBean bean);
	boolean deleteBan(String ban_id);
}


