package ems.icemile.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ems.icemile.service.HeadServiceImpl;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/head/*")
public class HeadController {
	
	@Inject
	private HeadServiceImpl headService;
	
	@GetMapping("/resultList")
	public String result() {
		log.debug("컨트롤러| 지점 등록 페이지");

		return "head/resultList";
	}
	
}// class
