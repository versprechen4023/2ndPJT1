package ems.icemile.dao;

import java.util.List;

import ems.icemile.dto.WareHouseDTO;

public interface WareHouseDAO {
	//창고 list 가져오기
	List<WareHouseDTO> getHouseList();
    
	//창고 추가 시 code값 가져가기
	String getWhcode();
    
	//창고 추가
	void houseInsert(WareHouseDTO warehouseDTO) throws Exception;
    
	//창고 코드 중복검사
	boolean searchwhcode(String wh_code);

}
