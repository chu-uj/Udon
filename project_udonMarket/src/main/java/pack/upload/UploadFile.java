package pack.upload;

import org.springframework.web.multipart.MultipartFile;

// 파일 업로드 DTO역할
public class UploadFile {
	private MultipartFile file;

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
}
