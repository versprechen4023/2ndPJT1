package ems.icemile.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ems.icemile.dto.MemberDTO;
import ems.icemile.dto.SellDTO;
import ems.icemile.service.MemberServiceImpl;
import ems.icemile.service.SellServiceImpl;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/sell/*")
public class SellController {
	
	@Inject
	private SellServiceImpl sellService;
	@Inject
	private MemberServiceImpl memberService;
	
	@GetMapping("/branchReg")
	public String branchReg() {
	
		log.debug("지점 등록 페이지");
		
		return "sell/branchReg";
		
	}
	
//	@PostMapping("/branch")
//	public String branchList(SellDTO sellDTO, MemberDTO memberDTO, HttpSession session, RedirectAttributes msg) {
//		
//		log.debug("지점 목록 페이지");
//		log.debug(sellDTO.toString());
//		
//		// 영업팀이거나 부장일 경우만 페이지 볼 수있게 
//		if(memberService.userCheck(memberDTO)) {
//		session.setAttribute("emp_role", memberDTO.getRole());
//		return "";
//		}
//	}

}
