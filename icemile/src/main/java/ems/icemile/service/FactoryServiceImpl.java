package ems.icemile.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		String getCode = factoryDAO.getNewFacilityCode(facilityDTO);
		
		int codeNum = 0;
		
		// DB에 데이터가없다면 초기값(1)이되고
		if(getCode == null) {
			codeNum = 1;
		// 아니라면 +1을 더한다
		} else {
			codeNum = Integer.parseInt(getCode.replaceAll("[^0-9]", "")) + 1;
		}
				
		// 숫자를 4자리 문자열로 포맷팅하고, 앞에 0을 채우기
		String numStr = String.format("%04d", codeNum);

		// 고유 번호 저장
		facilityDTO.setLine_code(facilityDTO.getLine_code() + numStr);
		
		factoryDAO.insertFacility(facilityDTO);
	}// insertFacility()


	@Override
	public void updateFacility(FacilityDTO facilityDTO) {
		

		log.debug("FactoryService updateFacility()");
		
		factoryDAO.updateFacility(facilityDTO);
	}// updateFacility


	@Override
	public boolean deleteFacility(List<String> deleteList) {

		log.debug("FactoryService deleteFacility()");
		
		return factoryDAO.deleteFacility(deleteList);
	}// deleteFacility


	@Override
	public boolean searchLineName(String line_name) {
		
		log.debug("FactoryService searchLineName()");
		
		return factoryDAO.searchLineName(line_name);
	}//searchLineName
	
	
	@Override
	public List<FacilityDTO> facilitySearch(HashMap<String, Object> json) {
		
		log.debug("FactoryService facilitySearch()");
		
		return factoryDAO.facilitySearch(json);
	}// facilitySearch
	
	
	
	
	
	
	
	

}//FactoryServiceImpl
