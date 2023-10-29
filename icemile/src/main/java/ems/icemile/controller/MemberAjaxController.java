package ems.icemile.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import ems.icemile.annotation.Departments;
import ems.icemile.dto.MemberDTO;
import ems.icemile.service.MemberServiceImpl;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/member_ajax/*")
public class MemberAjaxController {
	
	@Inject // 멤버 서비스 의존성 주입
	private MemberServiceImpl memberService;
	
	// 관리자 권한제어를 위한 어노테이션 선언
	@Departments
	@PostMapping("delete")
	public String memberDelete(@RequestParam("emp_num") String emp_num) {
		
		log.debug("멤버 딜리트 AJAX 호출");
		
		// 콜백 함수에 결과값 리턴
		return Boolean.toString(memberService.memberDelete(emp_num));
	} // end memberIDelete
	
	
	@PostMapping("search")
	public List<MemberDTO> memberSearch(@RequestBody HashMap<String, Object> json) {
		
		log.debug("멤버 서치 AJAX 호출");
		
		// 멤버리스트를 가져오기위한 멤버리스트 객체생성
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		//결과값에 따라 멤버리스트를 가져온다
		memberList = memberService.memberSearch(json);
		
		// 콜백 함수에 결과값 리턴
		return memberList;
	} // end memberSearch
	
	// 관리자 권한제어를 위한 어노테이션 선언
	@Departments
	@PostMapping("/insert")
	public String memberInsert(MemberDTO memberDTO, @RequestParam(value ="file") MultipartFile file, HttpSession session) throws Exception {
		
		log.debug("값 잘 넘어오나 {}",memberDTO.toString());
		
		String test = file.getOriginalFilename();
		
		boolean isOkay = false;
		
		if (test != null && file.getSize() > 0) {
		    int findDot = test.lastIndexOf(".");
		    
		    if (findDot >= 0) {
		    	
		    	// 대소문자 검증
		        String fileExtension = test.substring(findDot + 1).toLowerCase(); 

		        // 허용할 확장자
		        List<String> allow = Arrays.asList("jpg", "jpeg", "png", "gif");

		        if (allow.contains(fileExtension)) {
		            isOkay = true;
		        } else {
		        	isOkay = false;
		        }
		    } else {
		    	isOkay = false;
		    }
		}
		
		// 프로필 사진 업로드 처리
		// 파일이 있다면 업로드 처리 시작
		if(isOkay) {
	        
			// 업로드 경로 지정
			String uploadDir = "/resources/upload"; 
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			
			log.debug("실제 파일 업로드 주소 : {} ",saveDir);
			
			// 폴더가 없다면 생성
			File uploadFolder = new File(saveDir);
	        if (!uploadFolder.exists()) {
	            uploadFolder.mkdirs();
	        }
			
			// 사진 이름 얻어오기 중복되지않기 위해 랜덤값 부여 나중에 _전으로 잘라서 표기하면됨
			String photo = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
			// 멤버 DTO에 등록
			memberDTO.setProfilepic(photo);
			
			// 파일 저장 실행
			file.transferTo(new File(saveDir + File.separator + photo));
		}
		
		return Boolean.toString(memberService.memberInsert(memberDTO));
	} // end memberInsert
	
	// 관리자 권한제어를 위한 어노테이션 선언
	@Departments
	@PostMapping("/update")
	public String memberUpdate(MemberDTO memberDTO, @RequestParam(value ="file") MultipartFile file, HttpSession session) throws Exception {
		
		log.debug("값 잘 넘어오나 {}",memberDTO.toString());
		
		String test = file.getOriginalFilename();
		
		boolean isOkay = false;
		
		if (test != null && file.getSize() > 0) {
		    int findDot = test.lastIndexOf(".");
		    
		    if (findDot >= 0) {
		    	
		    	// 대소문자 검증
		        String fileExtension = test.substring(findDot + 1).toLowerCase(); 

		        // 허용할 확장자
		        List<String> allow = Arrays.asList("jpg", "jpeg", "png", "gif");

		        if (allow.contains(fileExtension)) {
		            isOkay = true;
		        } else {
		        	isOkay = false;
		        }
		    } else {
		    	isOkay = false;
		    }
		}
		
		// 프로필 사진 업로드 처리
		// 파일이 있다면 업로드 처리 시작
		if(isOkay) {
	        
			// 업로드 경로 지정
			String uploadDir = "/resources/upload"; 
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			
			log.debug("실제 파일 업로드 주소 : {} ",saveDir);
			
			// 폴더가 없다면 생성
			File uploadFolder = new File(saveDir);
	        if (!uploadFolder.exists()) {
	            uploadFolder.mkdirs();
	        }
			
			// 사진 이름 얻어오기 중복되지않기 위해 랜덤값 부여 나중에 _전으로 잘라서 표기하면됨
			String photo = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
			// 멤버 DTO에 등록
			memberDTO.setProfilepic(photo);
			
			// 파일 저장 실행
			file.transferTo(new File(saveDir + File.separator + photo));
		}
		
		return Boolean.toString(memberService.memberUpdate(memberDTO));
	} // end memberUpdate
	
	@PostMapping("/userUpdate")
	public String userUpdate(MemberDTO memberDTO, @RequestParam(value ="file") MultipartFile file, HttpSession session) throws Exception {
		
		log.debug("값 잘 넘어오나 {}",memberDTO.toString());
		
		String test = file.getOriginalFilename();
		
		boolean isOkay = false;
		
		if (test != null && file.getSize() > 0) {
		    int findDot = test.lastIndexOf(".");
		    
		    if (findDot >= 0) {
		    	
		    	// 대소문자 검증
		        String fileExtension = test.substring(findDot + 1).toLowerCase(); 

		        // 허용할 확장자
		        List<String> allow = Arrays.asList("jpg", "jpeg", "png", "gif");

		        if (allow.contains(fileExtension)) {
		            isOkay = true;
		        } else {
		        	isOkay = false;
		        }
		    } else {
		    	isOkay = false;
		    }
		}
		
		// 프로필 사진 업로드 처리
		// 파일이 있다면 업로드 처리 시작
		if(isOkay) {
	        
			// 업로드 경로 지정
			String uploadDir = "/resources/upload"; 
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			
			log.debug("실제 파일 업로드 주소 : {} ",saveDir);
			
			// 폴더가 없다면 생성
			File uploadFolder = new File(saveDir);
	        if (!uploadFolder.exists()) {
	            uploadFolder.mkdirs();
	        }
			
			// 사진 이름 얻어오기 중복되지않기 위해 랜덤값 부여 나중에 _전으로 잘라서 표기하면됨
			String photo = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
			// 멤버 DTO에 등록
			memberDTO.setProfilepic(photo);
			
			// 파일 저장 실행
			file.transferTo(new File(saveDir + File.separator + photo));
		}
		
		return Boolean.toString(memberService.userUpdate(memberDTO));
	} // end memberUpdate
	
	@PostMapping("updatePassword")
	public String updatePassword(MemberDTO memberDTO, @RequestParam("emp_newPw1") String new_password, HttpSession session) {
		
		log.debug("업데이트 패스워드 AJAX 호출");

		// 세션에서 비밀번호를 변경할 사번을 가져온다
		memberDTO.setEmp_num((String)session.getAttribute("emp_num"));
		
		// 비밀번호 일치 여부를 검증한다
		memberDTO = memberService.userCheck(memberDTO);
		
		// 비밀번호가 일치한다면 비밀번호 변경을 수행하고 콜백함수에 결과값을 리턴한다
		if(memberDTO != null) {
			memberDTO.setEmp_pw(new_password);
			return Boolean.toString(memberService.updatePassword(memberDTO));
		} else {
			return "false";
		}
		
	} // end updatePassword
	
	@GetMapping("searchEmail")
	public String searchEmail(@RequestParam("email") String email) {
		
		log.debug("{} 값 확인", email);
		
		return Boolean.toString(memberService.searchEmail(email));
	} // end searchEmail
	
	@GetMapping("searchPhone")
	public String searchPhone(@RequestParam("phone_num") String phone_num) {
		
		log.debug("{} 값 확인", phone_num);
		
		return Boolean.toString(memberService.searchPhone(phone_num));
	} // end searchPhone
	
	// 관리자 권한제어를 위한 어노테이션 선언
	@Departments
	@PostMapping("reset")
	public String memberReset(@RequestParam("emp_num") String emp_num) {
		// 사용자의 비밀번호를 생일로 초기화하는 메서드
		log.debug("멤버 리셋 AJAX 호출");
		
		// 콜백 함수에 결과값 리턴
		return Boolean.toString(memberService.memberReset(emp_num));
	} // end memberReset
}
