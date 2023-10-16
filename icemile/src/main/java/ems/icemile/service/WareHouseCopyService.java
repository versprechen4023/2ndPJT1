package ems.icemile.service;

import java.util.HashMap;
import java.util.List;

import ems.icemile.dto.StockDTO;

public interface WareHouseCopyService {

	// 원자재 재고 리스트
	List<StockDTO> getRawStockList();

	// 원자재 실수량 수정
	public void updateRawStock(StockDTO stockDTO);

	// 원자재 재고 검색
	public List<StockDTO> rawStockSearch(HashMap<String, Object> json);

	// 완제품 재고 리스트
	public List<StockDTO> getProdStockList();

	public void updateProdStock(StockDTO stockDTO);

	public List<StockDTO> prodStockSearch(HashMap<String, Object> json);
	
}
