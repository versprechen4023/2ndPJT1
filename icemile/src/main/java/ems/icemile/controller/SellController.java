package ems.icemile.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
		log.debug("지점 등록 페이지");
		
		return "sell/branchReg";
		
	}

}
