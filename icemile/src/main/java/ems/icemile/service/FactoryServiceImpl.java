package ems.icemile.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.FactoryDAO;
import ems.icemile.dao.FactoryDAOImpl;
import ems.icemile.dto.FacilityDTO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FactoryServiceImpl implements FactoryService {
	
	@Inject //DAO 의존성 주입
	private FactoryDAOImpl factoryDAO;
	
	
	@Override
	public List<FacilityDTO> getFacilityList() {
		
		log.debug("FactoryService getFacilityList()");
		
		return null;
	}
	
	
	
	
	
	

}//FactoryServiceImpl
