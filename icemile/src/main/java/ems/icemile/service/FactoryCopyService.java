package ems.icemile.service;

import java.util.HashMap;
import java.util.List;

import ems.icemile.dto.RequirementDTO;

public interface FactoryCopyService {
	
	// 소요량 리스트
	public List<RequirementDTO> getRequirementList();
	
	// 소요량 삭제
	public void deleteRequirement(RequirementDTO requirementDTO);
	
	// 소요량 추가
	public boolean insertRequirement(RequirementDTO requirementDTO);
	
	// 소요량 수정
	public void updateRequirement(RequirementDTO requirementDTO);
	
	// 소요량 수정페이지
	public RequirementDTO getRequirement(String req_code);
	
	//검색
	public List<RequirementDTO> requirementSearch(HashMap<String, Object> json);
	
	
}
