package ems.icemile.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ems.icemile.dto.MemberDTO;
import ems.icemile.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	@GetMapping("/login")
	public String login() {
		
		log.debug("로그인페이지");
		
		return "member/login";
	}
	
	@PostMapping("/login")
	public String loginPro(MemberDTO memberDTO, HttpSession session, RedirectAttributes msg) {
		
		log.debug("로그인 유저 검증");
		log.debug(memberDTO.toString());
		
//		boolean result = memberService.memberInsert(memberDTO);
//		if(result) {
//			log.debug("회원가입 성공!!!");
//		} else {
//			log.debug("회원가입 실패!!!");
//		}
		
		if(memberService.userCheck(memberDTO)) {
			// 아이디랑 권한만 저장하면 될거같음 일단은
			log.debug("로그인 성공!!!");
			session.setAttribute("emp_num", memberDTO.getId());
			return "redirect:/main/index";
		} else {
			log.debug("로그인 실패!!!");
			msg.addFlashAttribute("msg", "사원번호 또는 비밀번호가 일치하지 않습니다");
			return "redirect:/member/login";
		}
		
	}
}
