package ems.icemile.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ems.icemile.dto.FacilityDTO;

public interface FactoryDAO {
	
	// 설비(라인) 리스트
	public List<FacilityDTO> getFacilityList();
	
	// 설비(라인) 등록
	public void insertFacility(FacilityDTO facilityDTO);

	// 설비(라인) 코드 고유 번호 부여
	public int getNewFacilityCode();

	// 설비(라인) 수정
	public void updateFacility(FacilityDTO facilityDTO);

	// 설비(라인) 삭제
	public boolean deleteFacility(List<String> deleteList);

	// 설비(라인) 이름 중복검사
	public boolean searchLineName(String line_name);

	public List<FacilityDTO> facilitySearch(HashMap<String, Object> json);

	
	
	
	
}//FactoryDAO
