package ems.icemile.dao;

import java.util.List;

import ems.icemile.dto.RequirementDTO;

public interface FactoryCopyDAO {
	
	// 소요량 리스트
	public List<RequirementDTO> getRequirementList();
	
	// 소요량 삭제
	public void deleteRequirement(RequirementDTO requirementDTO);
	
//	// 소요량 코드 자동 부여 
	public int getNewReq_code();
	
	// 소요량 등록
	public boolean insertRequirement(RequirementDTO requirementDTO);
}
