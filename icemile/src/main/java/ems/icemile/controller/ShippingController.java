package ems.icemile.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ems.icemile.annotation.Logistics;
import ems.icemile.dto.InMaterialDTO;

import ems.icemile.dto.outMaterialDTO;
import ems.icemile.service.ShippingServiceImpl;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/shipping/*")
public class ShippingController {
	
	@Inject
	private ShippingServiceImpl shippingService;
	
	// 입고 리스트
	@GetMapping("/inMaterial")
	public String inMaterialList(Model model) {

		log.debug("ShippingController inMaterialList");
		
		List<InMaterialDTO> inMaterialList = new ArrayList<InMaterialDTO>();
		inMaterialList = shippingService.getInMaterialList();
		
		model.addAttribute("inMaterialList", inMaterialList);
		
		return "/shipping/inMaterial";
	}// requirementList()
	
	
	// 입고 목록 삭제
	@Logistics
	@GetMapping("/deleteInMaterial")
	public String deleteInMaterial(InMaterialDTO inMaterialDTO) {
		log.debug("ShippingController deleteInMaterial");
		shippingService.deleteInMaterial(inMaterialDTO);
		return "redirect:/shipping/inMaterial";
	}// deleteRequirement()
   
	// 입고 등록 페이지
	@Logistics
	@GetMapping("/in_material_add")
	public String in_material_add() {
		
		log.debug("ShippingController in_material_add()");
		
		return "shipping/in_material_add";
	}// in_material_add
	
	// 입고 등록
	@Logistics
	@PostMapping("/inMaterialInsert")
	public String inMaterialInsert(InMaterialDTO inMaterialDTO) {
		log.debug("ShippingController inMaterialInsert");
		shippingService.inMaterialInsert(inMaterialDTO);
		return "redirect:/shipping/inMaterial";
	}// inMaterialInsert()
	
	// 입고 수정 페이지
	@Logistics
	@GetMapping("/inMaterialUpdate")
	public String inMaterialUpdate(HttpServletRequest request, Model model) {
		log.debug("ShippingController inMaterialUpdate");
		String in_code = request.getParameter("in_code");
		InMaterialDTO inMaterialDTO = shippingService.getInMaterial(in_code);
		model.addAttribute("inMaterialDTO", inMaterialDTO);
		return "shipping/inMaterialUpdate";
	}// requirementAdd()
	
	// 입고 수정
	@Logistics
	@PostMapping("/updateInMaterial")
	public String updateInMaterial(InMaterialDTO inMaterialDTO) {
		log.debug("ShippingController updateInMaterial");
		shippingService.updateInMaterial(inMaterialDTO);
		return "redirect:/shipping/inMaterial";
	}
	
	
	//////////////////////////////////////////출고////////////////////////////////////////////////
    @GetMapping("/outMaterial")
    public String out_material(Model model) {
    	//출고 관리
    	log.debug("shippingController outMaterial");
    	
    	List<outMaterialDTO> outMaterialList = new ArrayList<outMaterialDTO>();
    	outMaterialList = shippingService.getoutMaterialList();
		
    	//모델에 하우스DTO값 저장
	    model.addAttribute("outMaterialList",outMaterialList);
		
		return "shipping/outMaterial";
    	
    }
    
        
		
    
	

	
	
}
