package pack.location.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import pack.location.controller.LocationBean;

@Repository
public class LocationDao {
	
	@Autowired
	@Qualifier("locationAnnoInter")
	private LocationAnnoInter inter;
	
	public boolean location_insert(LocationBean bean) {
		try {
			int result = inter.insert_location(bean);
			if(result > 0) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			System.out.println("location_insert err "+ e);
			return false;
		}
	}
	
	public boolean location_delete(String user_id) {
		try {
			int result = inter.delete_location(user_id);
			if(result > 0) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			System.out.println("location_delete err "+ e);
			return false;
		}
	}
	
	public int location_currentNum() {
		//insert시 번호 자동 증가를 위해 현재 레코드 중 가장 큰 번호 얻기.
		int num = inter.location_currentNum();
		if(num > 0) {
			return 0;
		}else {
			return num;
		}
	}
}
