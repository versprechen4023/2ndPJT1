package ems.icemile.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.FactoryDAO;
import ems.icemile.dto.FacilityDTO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FactoryServiceImpl implements FactoryService {
	
	@Inject // DAO 의존성 주입
	private FactoryDAO factoryDAO;
	
	
	@Override
	public List<FacilityDTO> getFacilityList() {

		log.debug("FactoryService getFacilityList()");
		
		return factoryDAO.getFacilityList();
	}// getFacilityList()


	@Override
	public void insertFacility(FacilityDTO facilityDTO) {
		
		log.debug("FactoryService insertFacility()");
		
		// 라인 코드 고유 번호 부여
		facilityDTO.setLine_code(Integer.toString(factoryDAO.getNewFacilityCode()));
		
		factoryDAO.insertFacility(facilityDTO);
	}// insertFacility()


	@Override
	public void updateFacility(FacilityDTO facilityDTO) {
		

		log.debug("FactoryService updateFacility()");
		
		factoryDAO.updateFacility(facilityDTO);
	}// updateFacility


	@Override
	public void deleteFacility(FacilityDTO facilityDTO) {

		log.debug("FactoryService deleteFacility()");
		
		factoryDAO.deleteFacility(facilityDTO);
	}// deleteFacility
	
	
	
	
	
	
	
	
	

}//FactoryServiceImpl
