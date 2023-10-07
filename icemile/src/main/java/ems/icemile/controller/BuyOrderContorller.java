package ems.icemile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/buyOrder/*")
public class BuyOrderContorller {
	
	@GetMapping("/rawOrderList")
	public String rawOrderList() {
		
		log.debug("발주 페이지");
		
		return "buyOrder/rawOrderList";
	}
}
