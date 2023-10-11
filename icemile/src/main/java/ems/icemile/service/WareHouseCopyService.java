package ems.icemile.service;

import java.util.List;

import ems.icemile.dto.StockDTO;

public interface WareHouseCopyService {

	// 원자재 재고 리스트
	List<StockDTO> getRawStockList();
	
}
