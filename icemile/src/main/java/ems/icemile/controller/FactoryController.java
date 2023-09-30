package ems.icemile.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ems.icemile.dto.FacilityDTO;
import ems.icemile.service.FactoryService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/factory/*")
public class FactoryController {
	
	
	@Inject //팩토리 서비스 의존성 주입
	private FactoryService factoryService;
	
	
	//가상주소: http://localhost:8080/home/factory/facility
	@GetMapping("/facility")
	public String facility(Model model) {
		
		//설비 관리
		log.debug("facility");
		
		//설비 관리 리스트 객체 생성
		List<FacilityDTO> facilityList = factoryService.getFacilityList();
		
		//모델에 facilityList값 저장
		model.addAttribute("facilityList", facilityList);
		
		
		//주소 변경 x
		return "factory/facility";
	}
	
	
	
	
	
	
	
	
	
	

}//class FactoryController
