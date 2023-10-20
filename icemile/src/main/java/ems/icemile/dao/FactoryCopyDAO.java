package ems.icemile.dao;

import java.util.HashMap;
import java.util.List;

import ems.icemile.dto.RequirementDTO;

public interface FactoryCopyDAO {
	
	// 소요량 리스트
	public List<RequirementDTO> getRequirementList();
	
	// 소요량 삭제
	public void deleteRequirement(RequirementDTO requirementDTO);
	
//	// 소요량 코드 자동 부여 
//	public int getNewReq_code();
	public String getNewReq_code();
	
	// 소요량 등록
	public boolean insertRequirement(RequirementDTO requirementDTO);
	
	// 소요량 수정 페이지
	public RequirementDTO getRequirement(String req_code);
		
	// 소요량 수정
	public void updateRequirement(RequirementDTO requirementDTO);
	
	// 검색
	public List<RequirementDTO> requirementSearch(HashMap<String, Object> json);

	public boolean checkRawCode(String prod_code, String raw_code);

}
