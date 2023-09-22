package ems.icemile.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@PostMapping("/loginPro")
	public String loginPro(MemberDTO memberDTO) {
		
		log.debug("로그인프로");
		log.debug(memberDTO.toString());
		
//		boolean result = memberService.memberInsert(memberDTO);
//		if(result) {
//			log.debug("회원가입 성공!!!");
//		} else {
//			log.debug("회원가입 실패!!!");
//		}
		
		boolean result2 = memberService.userCheck(memberDTO);
		
		if(result2) {
			log.debug("로그인 성공!!!");
		} else {
			log.debug("로그인 실패!!!");
		}
		
		return "member/login";
	}
}
