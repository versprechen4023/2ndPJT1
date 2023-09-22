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
	
	@GetMapping("/something")
	public String something() {
		
		log.debug("something");
		
		return "redirect:/main/something";
	}
}
