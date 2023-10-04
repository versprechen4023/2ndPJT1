package ems.icemile.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ems.icemile.service.WareHouseServiceImpl;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/warehouse_ajax/*")
public class WareHouseAjaxController {
	
	@Inject// 웨어하우스 서비스 의존성 주입
	private WareHouseServiceImpl wareHouseService;
	
	@GetMapping("searchWhcode")
	//이 부분은 Spring Framework에서 사용되는 어노테이션입니다.
	//Ajax 요청에서 "wh_code"이라는 파라미터를 받아서 이 메서드의 wh_code 매개변수에 할당합니다.
	public boolean searchProName(@RequestParam("wh_code")String wh_code) {
		
		log.debug("서치 웨어하우스 코드 AJAX 호출");
		
		return wareHouseService.searchwhcode(wh_code);
	}

}
