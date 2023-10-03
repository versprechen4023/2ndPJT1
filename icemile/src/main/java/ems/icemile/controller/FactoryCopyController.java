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

import ems.icemile.dto.RequirementDTO;
import ems.icemile.service.FactoryCopyServiceImpl;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/factory/*")
public class FactoryCopyController {
	
	@Inject
	private FactoryCopyServiceImpl factoryCopyService;
	
	// 소요량 리스트
	@GetMapping("/requirement")
	public String requirementList(Model model) {

		log.debug("FactoryController requirement");
		
		List<RequirementDTO> requirementList = new ArrayList<RequirementDTO>();
		requirementList = factoryCopyService.getRequirementList();
		
		model.addAttribute("requirementList", requirementList);
		
		return "/factory/requirement";
	}// requirementList()
	
	// 소요량 목록 삭제
	@GetMapping("/deleteRequirement")
	public String deleteRequirement(RequirementDTO requirementDTO) {
		log.debug("FactoryController delete");
		factoryCopyService.deleteRequirement(requirementDTO);
		return "redirect:/factory/requirement";
	}// deleteRequirement()
	
	// 소요량 등록 페이지
	@GetMapping("/requirementAdd")
	public String requirementAdd() {
		log.debug("FactoryController requirementAdd");
		return "factory/requirementAdd";
	}// requirementAdd()
	
	// 소요량 등록 
	@PostMapping("/insertRequirement")
	public String insertRequirement(RequirementDTO requirementDTO) {
		log.debug("FactoryController insertRequirement");
		factoryCopyService.insertRequirement(requirementDTO);
		return "redirect:/factory/requirement";
	} // insertRequirement()
	
	// 소요량 수정 페이지
	@GetMapping("/requirementUpdate")
	public String requirementUpdate(HttpServletRequest request, Model model) {
		log.debug("FactoryController requirementUpdate");
		String req_code = request.getParameter("req_code");
		RequirementDTO requirementDTO = factoryCopyService.getRequirement(req_code);
		model.addAttribute("requirementDTO", requirementDTO);
		return "factory/requirementUpdate";
	}// requirementAdd()
	
	// 소요량 수정
	@PostMapping("/updateRequirement")
	public String updateRequirement(RequirementDTO requirementDTO) {
		log.debug("FactoryController updateRequirement");
		factoryCopyService.updateRequirement(requirementDTO);
		return "redirect:/factory/requirement";
	}
}
