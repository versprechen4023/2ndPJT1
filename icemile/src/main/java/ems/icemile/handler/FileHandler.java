package ems.icemile.handler;

import java.util.Arrays;
import java.util.List;

import org.apache.tika.Tika;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class FileHandler {
	
	public boolean handleFileUpload(MultipartFile file) throws Exception {
		
		// 결과값 반환할 불린 변수 선언
		boolean result = false; 
		
		// 파일명 확인용 변수선언
		String test = file.getOriginalFilename();
		
		if (test != null && file.getSize() > 0) {
	       
			// 확장자검증을 위한 마지막. 이후 값 추출
		    int findDot = test.lastIndexOf(".");
		    
		    // 확장자가 있다면 검증수행
		    if (findDot >= 0) {
		    	
		    	// 메타데이터 검증을 위한 바이트 배열 변환
		    	byte[] fileData = file.getBytes(); 
				
		    	// 아파치 티카 객체생성
		        Tika tika = new Tika();
		        // 메타데이터 타입 검증
		        String detectedMimeType = tika.detect(fileData);
		            
		        log.debug("메타데이터 타입 출력 : {}", detectedMimeType);
		        	
		    	// 대소문자 구분을위한 소문자 변환
		        String fileExtension = test.substring(findDot + 1).toLowerCase(); 

		        // 허용할 확장자
		        List<String> allow = Arrays.asList("jpg", "jpeg", "png", "gif");
		        
		        // 마메타입과 확장자검증
		        if (allow.contains(fileExtension) && detectedMimeType.startsWith("image/")) {
		            result = true;
		        } else {
		        	// 확장자 없다면 false 반환
		        	result = false;
		        }
		    } else {
		    	// 업로드 파일 없다면 false반환
		    	result = false;
		    }
		}
		
		return result;
	}
}
