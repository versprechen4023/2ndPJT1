package ems.icemile.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		log.info(sellDTO.toString());		
		
		sellService.branchInsert(sellDTO);
		
		return "redirect:/sell/branchList";
	}
	
	@GetMapping("/branchUpdate")
	public String branchUpdate(String branch_code, Model model) {
		
		log.debug("지점 수정 페이지");
		
		// 디비에서 지점 정보 가져오기
		SellDTO sellDTO = sellService.getBranchInfo(branch_code);
		
		//model에 가져온 데이터 담아서 branchUpdate이동
		model.addAttribute("sellDTO", sellDTO);
		return "sell/branchUpdate";
	}


	
	@GetMapping("/branchList")
	public String branch( Model model) {
		log.debug("지점 목록 페이지");
		
		// 디비에서 지점 목록 가져오기 
		List<SellDTO> branchList = sellService.getBranchList();
		
		// model에 가져온 데이터 담아서 branch.jsp 이동
		model.addAttribute("branchList",branchList);
		
		// 페이지 이동
		return "sell/branchList";
		
	}
}
