package ems.icemile.controller;

import java.io.File;
import java.util.ArrayList;
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

import ems.icemile.dto.MemberDTO;
import ems.icemile.service.MemberServiceImpl;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/member_ajax/*")
public class MemberAjaxController {
	
	@Inject // 멤버 서비스 의존성 주입
	private MemberServiceImpl memberService;
	
	@PostMapping("delete")
	public String memberDelete(@RequestParam("emp_num") String emp_num) {
		
		log.debug("멤버 딜리트 AJAX 호출");
		
		// 콜백 함수에 결과값 리턴
		return Boolean.toString(memberService.memberDelete(emp_num));
	}
	
	@PostMapping("search")
	public List<MemberDTO> memberSearch(@RequestBody HashMap<String, Object> json) {
		
		log.debug("멤버 서치 AJAX 호출");
		
		// 멤버리스트를 가져오기위한 멤버리스트 객체생성
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		//결과값에 따라 멤버리스트를 가져온다
		memberList = memberService.memberSearch(json);
		
		// 콜백 함수에 결과값 리턴
		return memberList;
	}
	
	@PostMapping("/update")
	public String memberUpdate(MemberDTO memberDTO, @RequestParam(value ="file") MultipartFile file, HttpSession session) throws Exception {
		
		log.debug("값 잘 넘어오나 "+memberDTO.toString());
		
		// 프로필 사진 업로드 처리
		// 파일이 있다면 업로드 처리 시작
		if(file.getSize() > 0 ) {
	        
			// 업로드 경로 지정
			String uploadDir = "/resources/upload"; 
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			
			log.debug("실제 파일 업로드 주소 : "+saveDir);
			
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
//		return "hi";
	}
}
