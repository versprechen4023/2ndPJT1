package ems.icemile.service;

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

}
