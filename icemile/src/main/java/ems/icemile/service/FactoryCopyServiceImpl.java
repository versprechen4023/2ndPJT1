package ems.icemile.service;

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
	
	@Override
	public List<RequirementDTO> getRequirementList(){
		log.debug("FactoryService getRequirementList");
		return factoryCopyDAO.getRequirementList();
	}

	@Override
	public void deleteRequirement(RequirementDTO requirementDTO) {
		log.debug("FactoryService deleteRequirement");
	    factoryCopyDAO.deleteRequirement(requirementDTO);
		
	}
	
	@Override
	public boolean insertRequirement(RequirementDTO requirementDTO) {
		log.debug("FactoryService insertRequirement");
		// 소요량 코드 자동부여 
		requirementDTO.setReq_code(Integer.toString(factoryCopyDAO.getNewReq_code()));
		return factoryCopyDAO.insertRequirement(requirementDTO);
	}
}
