package pack.product.model;

import java.util.ArrayList;
import java.util.List;

import pack.product.controller.ProductBean;
import pack.product.controller.SearchBean;

public interface ProductDaoInter {
	ArrayList<ProductDto> getProductList();
	ArrayList<ProductDto> getSellingProductList();
	ArrayList<ProductDto> getProductSearch(ProductBean bean);
	boolean productInsert(ProductBean bean);
	ProductDto getProductDetail(int product_id);
	boolean productUpdate(ProductBean bean);
	boolean productDelete(int product_id);
	List<ProductDto> getProductSearchByCategory(SearchBean bean);
	
	int product_currentNum();
	int product_totalCnt();
	boolean product_updateViews(int product_id);
}
