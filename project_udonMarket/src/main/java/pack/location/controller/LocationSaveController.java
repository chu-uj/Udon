package pack.location.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pack.location.model.LocationDao;
import pack.user.model.UserDto;

@Controller
public class LocationSaveController {
	
	@Autowired
	private LocationDao locationDao; 
	
	@RequestMapping("locationSave")
	public String location(LocationBean bean, HttpServletRequest request) {
		// bean에 data 저장
		HttpSession session = request.getSession();
		UserDto userDto = (UserDto)session.getAttribute("userDto");
		String user_id = "";
		if(userDto !=null) {
			user_id = userDto.getUser_id();
			bean.setUser_id(user_id);
		}
		bean.setGPS_set_date();
		int newNum = locationDao.location_currentNum() + 1;
		bean.setAddr_no(Integer.toString(newNum));
		// user_id와 동일한 기존의 주소는 삭제한다.
		boolean deleteResult = locationDao.location_delete(user_id);
		System.out.println(deleteResult);
		
		// 위치정보 저장
		boolean result = locationDao.location_insert(bean);
		if(result) {
			// 기존 위치정보는 삭제하여야 한다.
			session.setAttribute("msg", "위치정보 저장에 성공하셨습니다.");
		}else {
			session.setAttribute("msg", "위치정보 저장에 실패하였습니다. 잠시 후 다시 시도해 주세요.");
		}
		return "location";
	}
}
