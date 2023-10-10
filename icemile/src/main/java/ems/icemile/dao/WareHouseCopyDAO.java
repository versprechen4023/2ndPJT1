package ems.icemile.dao;

import java.util.List;

import ems.icemile.dto.StockDTO;

public interface WareHouseCopyDAO {

	// 원자재 재고 리스트
	List<StockDTO> getRawStockList();

}
