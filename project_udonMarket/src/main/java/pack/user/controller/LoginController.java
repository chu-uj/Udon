package pack.user.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpEntity;
import org.apache.http.HttpHeaders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;

import pack.admin.model.AdminDaoInter;
import pack.admin.model.AdminDto;
import pack.user.model.UserDaoInter;
import pack.user.model.UserDto;

@Controller
public class LoginController {
	@Autowired
	private UserDaoInter userDaoInterinter;

	@Autowired
	private AdminDaoInter adminDaointer;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(HttpSession session) {
		if (session.getAttribute("id") == null) {
			return "login";
		} else {
			return "login";
		}
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String submitLogin(HttpSession session, @RequestParam("user_id") String user_id,
			@RequestParam("password") String password, HttpServletRequest request) {
	
		// 세션만들기
		UserDto userDto = userDaoInterinter.getLoginInfo(user_id);
		AdminDto adminDto = adminDaointer.getLoginInfo(user_id);
		
		if(userDto != null) {
			String rePassword = userDto.getPassword();
			if(rePassword.equals(password)) { 
        	 session.setAttribute("user_id", user_id);
				session.setAttribute("userDto", userDto);
				return "redirect:/home";
			}else {
				session.setAttribute("msg", "비밀번호를 확인해주세요");
				return "login";
			}
		}else if(adminDto != null){
			String rePasswd = adminDto.getPassword();
			if(rePasswd.equals(password)) {
				session.setAttribute("admin_id", user_id);
				
				return "adminIndex";	//관리자 전용 페이지로 이동
			}else {
				return "login";	//다시 로그인 창으로
			}
		}else {
			//아이디가 없다는 메시지 모달창 발생 필요. 다시 로그인 창으로 접속.
			//session.setAttribute("msg", "아이디를 잘못 입력하셨습니다.");
			return "login"; 
		}
		
	}
	
	
	@RequestMapping(value = "/kakaologin", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		JsonNode node = KakaoController.getAccessToken(code); // accessToken에 사용자의 로그인한 모든 정보가 들어있음
		JsonNode accessToken = node.get("access_token"); // 사용자의 정보
		JsonNode userInfo = KakaoController.getKakaoUserInfo(accessToken);
		String userid = null; //얘가 우리한테는 user_id 인데 형식이 다름
		String kname = null; 
		String kimage = null; // 유저정보 카카오에서 가져오기
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		userid = kakao_account.path("email").asText(); 
		//System.out.println(userid); 
		kname = properties.path("nickname").asText();
		kimage = properties.path("profile_image").asText();
		UserBean bean = new UserBean();
		bean.setUser_id(userid);
		bean.setUser_addr("카카오관리");
		bean.setUser_name(kname);
     	 bean.setPassword("123");
		session.setAttribute("userBean", bean);
		session.setAttribute("userid", userid);
		boolean b = userDaoInterinter.join_user(bean);
		session.setAttribute("kemail", userid);
		session.setAttribute("kname", kname);
		
		
		
		mav.setViewName("redirect:/login");
		return mav;
	}
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate(); 
		return "index";
	}
}
