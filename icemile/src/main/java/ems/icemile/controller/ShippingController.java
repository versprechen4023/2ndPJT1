package ems.icemile.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ems.icemile.dto.WareHouseDTO;
import ems.icemile.dto.outMaterialDTO;
import ems.icemile.service.ShippingServiceImpl;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/shipping/*")
public class ShippingController {
	
	@Inject
	private ShippingServiceImpl ShippingService;
   
	@GetMapping("/in_material_add")
	public String in_material_add() {
		
		log.debug("in_material_add");
		
		return "shipping/in_material_add";
	}
	
    @GetMapping("/outMaterial")
    public String out_material(Model model) {
    	//출고 관리
    	log.debug("shippingController outMaterial");
    	
    	List<outMaterialDTO> outMaterialList = new ArrayList<outMaterialDTO>();
    	outMaterialList = ShippingService.getoutMaterialList();
		
    	//모델에 하우스DTO값 저장
	    model.addAttribute("outMaterialList",outMaterialList);
		
		return "shipping/outMaterial";
    	
    }
    
        
		
    
	

	
	
}
