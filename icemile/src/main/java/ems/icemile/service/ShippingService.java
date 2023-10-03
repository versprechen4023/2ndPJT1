package ems.icemile.service;

import java.util.List;

import ems.icemile.dto.InMaterialDTO;

public interface ShippingService {

	// 입고 리스트
	public List<InMaterialDTO> getInMaterialList();
	
	// 입고 삭제
	public void deleteInMaterial(InMaterialDTO inMaterialDTO);
	
	// 입고 등록
	public void inMaterialInsert(InMaterialDTO inMaterialDTO);
	
	// 입고 수정 페이지 in_code 값 받아서
	public InMaterialDTO getInMaterial(String in_code);
	
	// 입고 수정
	public void updateInMaterial(InMaterialDTO inMaterialDTO);

}
