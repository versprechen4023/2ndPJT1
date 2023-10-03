package ems.icemile.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	
	// 가상주소: http://localhost:8080/FunWeb/factory/addPro
		@PostMapping("/addPro")
		public String addPro(FacilityDTO facilityDTO) {
			log.debug("FactoryController addPro()");
			
			//facilityDTO 담아서 factoryService에 insertFacility 메서드 생성
			factoryService.insertFacility(facilityDTO);
			
			//주소 -> /factory/facility로 변경되면서 이동
			return "redirect:/factory/facility";
		}
	
	
	
	
	
	
	
	
	

}//class FactoryController
