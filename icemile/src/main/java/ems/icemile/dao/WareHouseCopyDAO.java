package ems.icemile.dao;

import java.util.List;

import ems.icemile.dto.StockDTO;

public interface WareHouseCopyDAO {

	// 원자재 재고 리스트
	List<StockDTO> getRawStockList();
	
	// 원자재 재고 삽입
	boolean insertRawStock(StockDTO stockDTO);
	
	// 재고 코드 생성
	int getNewStockCode();

	// 원자재 재고 삭제
	boolean deleteRawStock(String prod_code);

}
