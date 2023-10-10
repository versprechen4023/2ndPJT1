package ems.icemile.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.FactoryCopyDAOImpl;
import ems.icemile.dto.RequirementDTO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FactoryCopyServiceImpl implements FactoryCopyService {
	
	@Inject
	private FactoryCopyDAOImpl factoryCopyDAO;
	
	// 소요량 리스트
	@Override
	public List<RequirementDTO> getRequirementList(){
		log.debug("FactoryService getRequirementList");
		return factoryCopyDAO.getRequirementList();
	}
	
	// 소요량 삭제
	@Override
	public void deleteRequirement(RequirementDTO requirementDTO) {
		log.debug("FactoryService deleteRequirement");
	    factoryCopyDAO.deleteRequirement(requirementDTO);
		
	}
	
	// 소요량 등록
	@Override
	public boolean insertRequirement(RequirementDTO requirementDTO) {
		log.debug("FactoryService insertRequirement");
		// 소요량 코드 자동부여 
//		requirementDTO.setReq_code(Integer.toString(factoryCopyDAO.getNewReq_code()));
		String getCode = factoryCopyDAO.getNewReq_code();
		int codeNum = 0;
		
		if(getCode==null) {
			codeNum = 1;
		}else {
			codeNum = Integer.parseInt(getCode.replaceAll("[^0-9]", ""))+1;
		}
		
		requirementDTO.setReq_code(Integer.toString(codeNum));
		return factoryCopyDAO.insertRequirement(requirementDTO);
	}
	
	// 소요량 수정 페이지 req_code 값 받아서. 
	@Override
	public RequirementDTO getRequirement(String req_code) {
		log.debug("FactoryService getRequirement");
		return factoryCopyDAO.getRequirement(req_code);
	}
	
	// 소요량 수정
	@Override
	public void updateRequirement(RequirementDTO requirementDTO) {
		log.debug("FactoryService updateRequirement");
		factoryCopyDAO.updateRequirement(requirementDTO);
	}
	
	@Override
	public List<RequirementDTO> requirementSearch(HashMap<String, Object> json) {
		log.debug("FactoryService requirementSearch");
		return factoryCopyDAO.requirementSearch(json);
	}
	
}
