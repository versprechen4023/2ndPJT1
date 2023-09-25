package ems.icemile.controller;

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
	public String insertMember(MemberDTO memberDTO, @RequestParam(value ="file") MultipartFile file) {
		
		log.debug("값 잘 넘어오나 "+memberDTO.toString());
		
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
