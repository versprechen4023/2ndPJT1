package ems.icemile.dao;

import java.util.List;

import ems.icemile.dto.InMaterialDTO;

public interface ShippingDAO {
	
	// 입고 리스트
	public List<InMaterialDTO> getInMaterialList();
	
	// 입고 목록 삭제
	public void deleteInMaterial(InMaterialDTO inMaterialDTO);
	
	// 입고 등록
	public void inMaterialInsert(InMaterialDTO inMaterialDTO);
	
	// in_code 값 받아서
	public InMaterialDTO getInMaterial(String in_code);
	
	// 입고 수정
	public void updateInMaterial(InMaterialDTO inMaterialDTO);

}
