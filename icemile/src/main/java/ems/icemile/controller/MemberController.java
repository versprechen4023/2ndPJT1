package ems.icemile.controller;

import java.io.File;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ems.icemile.dto.MemberDTO;
import ems.icemile.service.MemberServiceImpl;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject
	private MemberServiceImpl memberService;
	
	@GetMapping("/login")
	public String login() {
		
		log.debug("로그인페이지");
		
		return "member/login";
	}
	
	@PostMapping("/login")
	public String loginPro(MemberDTO memberDTO, HttpSession session, RedirectAttributes msg) {
		
		log.debug("로그인 유저 검증");
		log.debug(memberDTO.toString());
		
		if(memberService.userCheck(memberDTO)) {
			// 아이디랑 권한만 저장하면 될거같음 일단은
			log.debug("로그인 성공!!!");
			session.setAttribute("emp_num", memberDTO.getEmp_num());
			session.setAttribute("emp_role", memberDTO.getEmp_role());
			return "redirect:/main/index";
		} else {
			log.debug("로그인 실패!!!");
			msg.addFlashAttribute("msg", "사원번호 또는 비밀번호가 일치하지 않습니다");
			return "redirect:/member/login";
		}
		
	}
	
	@GetMapping("/insert")
	public String insertMember() {
		
		log.debug("사용자 추가 페이지");
		
		return "member/insert";
	}
	
	@PostMapping("/insert")
	public String insertMember(MemberDTO memberDTO, @RequestParam(value ="file") MultipartFile file, HttpSession session) throws Exception {
		
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
		
		if(memberService.memberInsert(memberDTO)) {
			log.debug("사용자 추가 성공!!!");
		} else {
			log.debug("사용자 추가 실패!!!");
		}
		
		return "redirect:/member/insert";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		log.debug("로그아웃 함");
		session.invalidate();
		return "redirect:/member/login";
	}
	
	@GetMapping("/ajax")
	public String ajax() {
		log.debug("멤버 AJAX 진입");
		
		return "redirect:/member/login";
	}
}
