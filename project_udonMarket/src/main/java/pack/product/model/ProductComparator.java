package pack.product.model;

import java.util.Comparator;

public class ProductComparator implements Comparator<ProductDto>{

	public String order_by;
	
	@Override
	public int compare(ProductDto o1, ProductDto o2) {
		if(order_by.equals("views desc")) {
			if(o1.getViews() < o2.getViews()) {
				return 1;
			}return -1;
		}else if(order_by.equals("wish_id desc")){
			if(o1.getWish_id() < o2.getWish_id()) {
				return 1;
			}return -1;
		}else if(order_by.equals("product_price desc")){
			if(o1.getProduct_price() < o2.getProduct_price()) {
				return 1;
			}return -1;
		}else{
			if(o1.getProduct_price() > o2.getProduct_price()) {
				return 1;
			}return -1;
		}
		
	}
}
