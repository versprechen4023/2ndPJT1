package ems.icemile.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ems.icemile.service.MainService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
//임시로 주소 매핑
@RequestMapping("/pageTest/*")
public class PageMakeController {
	
	@Inject
	private MainService pageMakeService;


	@GetMapping("/tables")
	public String tables() {
		//사원 조회
		log.debug("tables");
		
		return "pageTest/tables";
	}	
	
	
	@GetMapping("/raw")
	public String raw() {
		//원자재 관리
		log.debug("raw");
		
		return "pageTest/raw";
	}
	
	
	@GetMapping("/product")
	public String product() {
		//완제품 관리
		log.debug("product");
		
		return "pageTest/product";
	}
	
	
	@GetMapping("/requirement")
	public String requirement() {
		//소요량 관리
		log.debug("requirement");
		
		return "pageTest/requirement";
	}
	
	
	@GetMapping("/warehouse")
	public String warehouse() {
		//창고 관리
		log.debug("warehouse");
		
		return "pageTest/warehouse";
	}
	
	
	@GetMapping("/rawOrder")
	public String rawOrder() {
		//발주 관리
		log.debug("rawOrder");
		
		return "pageTest/rawOrder";
	}
	
	
	@GetMapping("/inMaterial")
	public String inMaterial() {
		//입고 관리
		log.debug("inMaterial");
		
		return "pageTest/inMaterial";
	}
	
	@GetMapping("/buy")
	public String buy() {
		//매입처(거래처) 관리
		log.debug("buy");
		
		return "pageTest/buy";
	}
	
	
	@GetMapping("/branch")
	public String branch() {
		//지점 관리
		log.debug("branch");
		
		return "pageTest/branch";
	}
	
	
	
}

