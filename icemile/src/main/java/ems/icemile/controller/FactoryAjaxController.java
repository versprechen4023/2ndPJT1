package ems.icemile.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ems.icemile.service.FactoryService;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/factory_ajax/*")
public class FactoryAjaxController {
	
	@Inject // 팩토리 서비스 의존성 주입
	private FactoryService factoryService;
	
	
	@PostMapping("/deleteFacility")
	public String deleteFacility(@RequestParam("selectedLineCo") String[] selectedLineCo) {
		
		// 다중 삭제를 위한 리스트 형식의 맵 타입 배열 변수선언
		List<Map<String, String>> codeAndTypeList = new ArrayList<>();
		
		// DB에서 원자재와 완제품을 구분하기위해 맵형태 배열에 키값을 추가하고 조건문에 들어갈 품목번호를 입력한다
		for (String a : selectedLineCo) {
			
			// 맵 타입 배열 객체생성
		    Map<String, String> codeAndType = new HashMap<>();
		    
		    // 라인 코드를 삽입한다
		    codeAndType.put("line_code", a);

		    // 리스트 배열에 맵 배열을 삽입한다
		    codeAndTypeList.add(codeAndType);
		}
		
		return Boolean.toString(factoryService.deleteFacility(codeAndTypeList));
	}// facilityDelete
	
	
	@GetMapping("searchLineName")
	public boolean searchLineName(@RequestParam("line_name")String line_name) {
		
		log.debug("searchLineName AJAX 호출");
		
		return factoryService.searchLineName(line_name);
	}
	
	
	


}// class FactoryAjaxController
	
