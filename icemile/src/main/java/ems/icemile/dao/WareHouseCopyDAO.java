package ems.icemile.dao;

import java.util.HashMap;
import java.util.List;

import ems.icemile.dto.InMaterialDTO;
import ems.icemile.dto.ResultDTO;
import ems.icemile.dto.StockDTO;

public interface WareHouseCopyDAO {

	// 원자재 재고 리스트
	public List<StockDTO> getRawStockList();
	
	// 원자재 재고 삽입
	public boolean insertRawStock(StockDTO stockDTO);
	
	// 재고 코드 생성
	public String getNewStockCode();

	// 원자재 실수량 수정
	public void updateRawStock(StockDTO stockDTO);
	
	// 원자재 수량 수정
	public void updateRawAmount(InMaterialDTO inMaterialDTO);

	// 원자재 검색
	public List<StockDTO> rawStockSearch(HashMap<String, Object> json);

	// 완제품 재고 리스트
	public List<StockDTO> getProdStockList();

	// 완제품 실수량 수정
	public void updateProdStock(StockDTO stockDTO);
	
	// 완제품 수량 수정
	public boolean updateProdAmount(ResultDTO resultDTO);
	
	// 완제품 검색
	public List<StockDTO> prodStockSearch(HashMap<String, Object> json);


}
