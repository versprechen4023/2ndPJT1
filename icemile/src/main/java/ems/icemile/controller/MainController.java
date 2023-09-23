package ems.icemile.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ems.icemile.service.MainService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/main/*")
public class MainController {
	
	@Inject
	private MainService mainService;
	
	@GetMapping("/index")
	public String index() {
		
		log.debug("index");
		
		return "main/index";
	}

	@GetMapping("/tables")
	public String tables() {
		
		log.debug("tables");
		
		return "main/tables";
	}
	
	@GetMapping("/form")
	public String form() {
		
		log.debug("form");
		
		return "main/form";
	}	
}

