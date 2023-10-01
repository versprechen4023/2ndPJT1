package ems.icemile.service;

import java.util.List;

import ems.icemile.dto.RequirementDTO;

public interface FactoryCopyService {
	
	// 소요량 리스트
	public List<RequirementDTO> getRequirementList();
	
	// 소요량 삭제
	public void deleteRequirement(RequirementDTO requirementDTO);
	
	// 소요량 추가
	public boolean insertRequirement(RequirementDTO requirementDTO);
	
}