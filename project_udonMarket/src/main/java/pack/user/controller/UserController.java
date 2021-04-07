package pack.user.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import pack.upload.FileValidator;
import pack.upload.UploadFile;
import pack.user.model.MyPageDto;
import pack.user.model.UserDaoInter;
import pack.user.model.UserDto;

@Controller
public class UserController {
	@Autowired
	private UserDaoInter inter;
	
	@Autowired
	private FileValidator fileValidator;
	
	@RequestMapping(value = "userInsert", method = RequestMethod.GET)
	public String userJoin() {
		return "userInsert";
	}
	
	@RequestMapping(value = "userInsert", method = RequestMethod.POST)
	public String userInsertSubmit(UserBean bean) {
		
		boolean b = inter.join_user(bean);
		if(b) {
			return "redirect:/login";
		}else {
			return "redirect:/index.jsp";
		}

	}
	
	//produces는 혹시나 넘겨받을 때 깨짐방지
	@RequestMapping(value="idChk", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public int userIdCheck(@RequestParam("user_id") String user_id) {
		
		int result= inter.check_id(user_id);
	
		return result;
	}
	
	@RequestMapping("userlist")
	@ResponseBody
	public Map<String, Object> abc(){	
		List<Map<String, String>> dataList = new ArrayList<Map<String,String>>();
		
		Map<String, String> data = null;
		List<UserDto> userlist = inter.getUserList();
		
		for(UserDto l:userlist) {
			data = new HashMap<String, String>();
			data.put("user_id", l.getUser_id());
			data.put("password", l.getPassword());
			data.put("user_name", l.getUser_name());
			data.put("user_addr", l.getUser_addr());
			dataList.add(data);
		}
		Map<String, Object> userDatas = new HashMap<String, Object>(); 
		userDatas.put("datas", dataList);
	
		return userDatas;
	}
	@RequestMapping(value = "userDataUpdate", method = RequestMethod.GET)
	public ModelAndView userDataUpdateWrite(@RequestParam("user_id") String user_id) {
		List<MyPageDto>list = inter.getUserData(user_id);
		UserDto dto = inter.getLoginInfo(user_id);
		ModelAndView view = new ModelAndView("userDataUpdate");
		view.addObject("password", dto.getPassword());
		view.addObject("data", list);
		return view;
	}
	
	
	@RequestMapping(value = "userDataUpdate", method = RequestMethod.POST)
	public ModelAndView userDataUpdate(HttpServletRequest request, UserBean bean,
			@ModelAttribute("uploadFile")UploadFile uploadFile,
			BindingResult result) {
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		//업로드된 파일에 대한 에러 검사
		
		MultipartFile file = uploadFile.getFile();
		fileValidator.validate(uploadFile, result);
		
		String fileName = file.getOriginalFilename();// upload한 파일명
		if(result.hasErrors()) {
			return new ModelAndView("userDataUpdate");
		}
		try {
			inputStream= file.getInputStream();
			//아래 파일 경로는 절대경로
			File newFile = new File("C:\\study\\project_udon\\src\\main\\webapp\\resources\\profile\\"+fileName);
		
			if(!newFile.exists()) {
				newFile.createNewFile();
			}
			
			outputStream = new FileOutputStream(newFile);
			int read=0;
			byte[] bytes = new byte[1024];
			
			while((read = inputStream.read(bytes))!= -1) {
				outputStream.write(bytes,0,read);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				outputStream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		ModelAndView view = new ModelAndView();
		bean.setProfile_image(fileName);
		inter.userDataUpdate(bean);
		UserDto dto=inter.getLoginInfo(bean.getUser_id());
		view.setViewName("mypage2");
		view.addObject("user_id", dto.getUser_id());
		view.addObject("filename",fileName);
		return view;
	}
}
