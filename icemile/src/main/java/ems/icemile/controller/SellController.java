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
	
	@GetMapping("/branchReg")
	public String branchReg() {
		log.debug("컨트롤러| 지점 등록 페이지");
		
		return "sell/branchReg";
	}
	
	
	@GetMapping("/branchList")
	public String branch( Model model) {
		log.debug("컨트롤러| 지점 목록 페이지");
		
		// 디비에서 지점 목록 가져오기 
		List<SellDTO> branchList = sellService.getBranchList();
		
		// model에 가져온 데이터 담아서 branch.jsp 이동
		model.addAttribute("branchList",branchList);
		
		// 페이지 이동
		return "sell/branchList";
		
	}
	
	@GetMapping("/branchUpdate")
	public String branchUpdate(@RequestParam("branch_code") String branch_code, Model model) {
		log.debug("컨트롤러| 지점 수정 페이지");
		
		// 디비에서 등록된 지점 정보 가져오기
		SellDTO sellDTO  = sellService.getbranchInfo(branch_code);
		
		// model에 DTO값 저장
		model.addAttribute("sellDTO", sellDTO);
		
		return "sell/branchUpdate";
	}
	
	
	
}
