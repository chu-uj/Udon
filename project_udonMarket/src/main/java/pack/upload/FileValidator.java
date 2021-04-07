package pack.upload;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

//유효한 파일이 있는지 걸러주는 클래스
@Service
public class FileValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return false;
	}

	@Override
	public void validate(Object uploadFile, Errors errors) {
		// 파일 유무 확인
		UploadFile file = (UploadFile) uploadFile;
		
		if(file.getFile().getSize() == 0) { //파일의 크기가 0이면
			errors.rejectValue("file", "", "업로드할 파일을 선택해주세요."); //reject사유를 errors객체에 담기
		}
	}

}
