package ems.icemile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AjaxController {
	
	@ResponseBody
	@GetMapping("/myNumber")
	public int myNumber() {
		int i = 1;
		return i;
	}
	
	@ResponseBody
	@PostMapping("/myList")
	public int myList() {
		int i = 1;
		return i;
	}
	
	@ResponseBody
	@PostMapping("/myJson")
	public int myJson() {
		int i = 1;
		return i;
	}
}
