package ems.icemile.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@PostMapping("/branchRegPro")
	public String branchRegPro(SellDTO sellDTO) {
		log.debug("지점 등록 넘기기");
		log.info(sellDTO.getBranch_code());		
		
		sellService.branchInsert(sellDTO);
		
		return "redirect:/sell/branch";
	}
	
	
	
	@GetMapping("/branch")
	public String branch(HttpSession session, Model model) {
		log.debug("지점 목록 페이지");
		// 디비에서 지점 목록 가져오기 
		List<SellDTO> branchList = sellService.getBranchList();
		// model에 가져온 데이터 담아서 branch.jsp 이동
		model.addAttribute("branchList",branchList);
		
		// 페이지 이동
		return "sell/branch";
		
	}
	
	@PostMapping("/branch")
	public String branchList(SellDTO sellDTO, MemberDTO memberDTO, HttpSession session, RedirectAttributes msg) {
		
		log.debug("지점 목록 페이지");
		log.debug(sellDTO.toString());
		
		// 영업팀이거나 부장일 경우만 페이지 볼 수있게 
		if(true) {
			log.debug("권한 있음");
			session.setAttribute("emp_role", memberDTO.getEmp_role());
			// 권한 저장 필요함 부서 = 영업팀 || role = 부장
			return "redirect:/sell/branch";
		}else {
			log.debug("권한 없음");
			msg.addFlashAttribute("msg", "영업 권한이 없습니다.");
			return "redirect:/member/login";
		}
	}

}
