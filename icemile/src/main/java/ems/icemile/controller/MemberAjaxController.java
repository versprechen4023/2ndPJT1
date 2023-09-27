package ems.icemile.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/emp_ajax/*")
public class MemberAjaxController {
	@PostMapping("delete")
	public String deleteMember(@RequestParam("emp_num") String emp_num) {
		
		log.debug("ajax값넘어오나"+emp_num);
		
		return "true";
	}
}
