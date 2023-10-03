package ems.icemile.dao;

import java.util.List;

import ems.icemile.dto.FacilityDTO;

public interface FactoryDAO {

	public List<FacilityDTO> getFacilityList();

	public void insertFacility(FacilityDTO facilityDTO);

	public int getNewFacilityCode();

	
	
	
	
}//FactoryDAO
