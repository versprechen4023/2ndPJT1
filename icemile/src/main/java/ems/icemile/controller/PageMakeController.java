package ems.icemile.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ems.icemile.service.MainService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/pageTest/*")
public class PageMakeController {
	
	@Inject
	private MainService pageMakeService;


	@GetMapping("/tables")
	public String tables() {
		
		log.debug("tables");
		
		return "pageTest/tables";
	}	
	
	
	@GetMapping("/raw")
	public String raw() {
		
		log.debug("raw");
		
		return "pageTest/raw";
	}
	
	
	@GetMapping("/product")
	public String product() {
		
		log.debug("product");
		
		return "pageTest/product";
	}
	
	@GetMapping("/requirement")
	public String requirement() {
		
		log.debug("requirement");
		
		return "pageTest/requirement";
	}
	
	
	
	
}

