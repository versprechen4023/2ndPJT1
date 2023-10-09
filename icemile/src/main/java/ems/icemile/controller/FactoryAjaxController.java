package ems.icemile.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import ems.icemile.dto.FacilityDTO;
import ems.icemile.dto.RequirementDTO;
import ems.icemile.service.FactoryCopyServiceImpl;
import ems.icemile.service.FactoryService;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/factory_ajax/*")
public class FactoryAjaxController {
	
	@Inject // 팩토리 서비스 의존성 주입
	private FactoryService factoryService;
	
	@Inject 
	private FactoryCopyServiceImpl factoryCopyService;
	
	
	@PostMapping("/deleteFacility")
	public String deleteFacility(@RequestParam("selectedLineCo") String[] selectedLineCo) {
		
		// 마이바티스에서 반복처리를 위해 배열을 리스트 타입으로 변경
		List<String> deleteList = Arrays.asList(selectedLineCo);
		
		return Boolean.toString(factoryService.deleteFacility(deleteList));
	}// facilityDelete
	
	
	@GetMapping("searchLineName")
	public boolean searchLineName(@RequestParam("line_name")String line_name) {
		
		log.debug("searchLineName AJAX 호출");
		
		return factoryService.searchLineName(line_name);
	}
	
	
	@PostMapping("/facilitySearch")
	public List<FacilityDTO> facilitySearch(@RequestBody HashMap<String, Object> json) {
		
		log.debug("FactoryAjaxController facilitySearch");
		
		// 물품리스트를 가져오기위한 물품리스트 객체생성
		List<FacilityDTO> facilityList = new ArrayList<FacilityDTO>();
		//결과값에 따라 물품 리스트를 가져온다
		facilityList = factoryService.facilitySearch(json);
		
		// 콜백 함수에 결과값 리턴
		return facilityList;
	}
	
	@PostMapping("requirementSearch")
	public List<RequirementDTO> requirementSearch(@RequestBody HashMap<String, Object> json) {
		
		log.debug("FactoryAjaxController requirementSearch");
		
		// 물품리스트를 가져오기위한 물품리스트 객체생성
		List<RequirementDTO> requirementList = new ArrayList<RequirementDTO>();
		//결과값에 따라 물품 리스트를 가져온다
		requirementList = factoryCopyService.requirementSearch(json);
		
		// 콜백 함수에 결과값 리턴
		return requirementList;
	}

}// class FactoryAjaxController
	
