package ems.icemile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/shipping/*")
public class ShippingController {
   
	@GetMapping("/in_material_add")
	public String in_material_add() {
		
		log.debug("in_material_add");
		
		return "shipping/in_material_add";
	}
	
	@GetMapping("/out_material_add")
	public String out_material_add() {
		
		log.debug("out_material_add");
		
		return "shipping/out_material_add";
	}
	
	
}
