package ems.icemile.service;

import ems.icemile.dto.InMaterialDTO;
import ems.icemile.dto.MemberDTO;
import ems.icemile.dto.WareHouseDTO;
import ems.icemile.dto.WorkOrderDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ems.icemile.dto.outMaterialDTO;
import ems.icemile.dto.outMaterialInsertDTO;

public interface ShippingService {
    
	
	//outMaterial List 가져오기
	List<outMaterialDTO> getoutMaterialList();
    
    // 출고 코드 중복검사
	boolean searchOutCode(String out_code);
    
    // 출고 수정
	boolean mtUpdate(outMaterialInsertDTO outmaterialInsertDTO);
    
	//출고 추가
	boolean mtInsert(outMaterialInsertDTO outmaterialInsertDTO);
    
	//출고 삭제
	boolean mtDelete(List<Map<String, String>> codeAndBranchList);
    
	//출고 검색
	List<outMaterialDTO> mtSearch(HashMap<String, Object> json);

	// 입고 리스트
	public List<InMaterialDTO> getInMaterialList();
	
	// 입고 삭제
	public void deleteInMaterial(InMaterialDTO inMaterialDTO);
	
	// 입고 등록
	public boolean inMaterialInsert(InMaterialDTO inMaterialDTO);
	
	// 입고 수정 페이지 in_code 값 받아서
	public InMaterialDTO getInMaterial(String in_code);
	
	// 입고 수정
	public void updateInMaterial(InMaterialDTO inMaterialDTO);
	
	// 입고 검색
	public List<InMaterialDTO> inMateSearch(HashMap<String, Object> json);
    
	// modal
	public WareHouseDTO searchModalwh(String wh_code);
    
	
	//OSmodal
	public WorkOrderDTO searchOSModal(String order_code);
	
   
	//EPmodal
	public MemberDTO searchEPModal(String emp_num);
    

}
