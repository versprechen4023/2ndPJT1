package ems.icemile.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ems.icemile.dto.WareHouseDTO;
import ems.icemile.dto.WareHouseinsertDTO;

public interface WareHouseService {
	//창고 list 가져오기
	List<WareHouseDTO> gethouseList();
    
	// 창고 추가 시 code값 가져가기
	String getWhCode();
    
	//창고 코드 중복검사
	boolean searchwhcode(String wh_code);
    
	//창고 수정
	boolean whUpdate(WareHouseinsertDTO warehouseinsertDTO);
	
	//창고 추가
	boolean whInsert(WareHouseinsertDTO warehouseinsertDTO);

	//창고 삭제
	boolean whDelete(List<Map<String, String>> codeAndTypeList);
    
	//창고 검색
	List<WareHouseDTO> whSearch(HashMap<String, Object> json);
	
}
