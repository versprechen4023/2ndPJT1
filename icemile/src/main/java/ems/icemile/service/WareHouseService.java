package ems.icemile.service;

import java.util.List;

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
	
}
