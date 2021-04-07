package pack.upload;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DownloadController {
	@RequestMapping("download")
	@ResponseBody
	public byte[] getDownloadProcess(HttpServletResponse response,
			@RequestParam String filename) throws IOException{
		System.out.println("filename : "+filename);
		File file = new File("/udon/resources/upload/" + filename);
		//File file = new File("C:\\Users\\wonh\\git\\Project\\project_udonMarket\\src\\main\\webapp\\resources\\upload\\" + filename);
		
		byte[] bytes = FileCopyUtils.copyToByteArray(file);
		
		String fn =  new String(file.getName().getBytes(), "utf-8"); // iso_8859_1, euc-kr
		response.setHeader("Content-Disposition", "attachment;filename=\""+fn+"\"");
		response.setContentLength(bytes.length);
		return bytes;
	}

}
