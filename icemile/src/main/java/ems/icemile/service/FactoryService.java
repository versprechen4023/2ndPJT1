package ems.icemile.service;

import java.util.List;

import ems.icemile.dto.FacilityDTO;

public interface FactoryService {

	public List<FacilityDTO> getFacilityList();

	public void insertFacility(FacilityDTO facilityDTO);

	public void updateFacility(FacilityDTO facilityDTO);

	public void deleteFacility(FacilityDTO facilityDTO);

}
