package ems.icemile.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ems.icemile.service.HeadServiceImpl;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/head_ajax/*")
public class HeadAjaxController {
	
	@Inject // 팩토리 서비스 의존성 주입
	private HeadServiceImpl headService;
	



}// class 
	
