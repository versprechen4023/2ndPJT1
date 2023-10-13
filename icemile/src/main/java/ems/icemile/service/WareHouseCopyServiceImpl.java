package ems.icemile.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.WareHouseCopyDAO;
import ems.icemile.dto.StockDTO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class WareHouseCopyServiceImpl implements WareHouseCopyService {

	@Inject // DAO 의존성 주입
	private WareHouseCopyDAO wareHouseDAO;

	
	// 원자재 재고 리스트
	@Override
	public List<StockDTO> getRawStockList() {

		log.debug("WareHouseService getRawStockList()");
		
		return wareHouseDAO.getRawStockList();
	}// getRawStockList


	// 원자재 실수량 수정
	@Override
	public void updateRawStock(StockDTO stockDTO) {
		
		log.debug("WareHouseService updateRawStock()");
		
		wareHouseDAO.updateRawStock(stockDTO);
	}// updateRawStock


	// 원자재 재고 검색
	@Override
	public List<StockDTO> rawStockSearch(HashMap<String, Object> json) {
		
		log.debug("WareHouseService rawStockSearch()");
		
		return wareHouseDAO.rawStockSearch(json);
	}//rawStockSearch


	// 완제품 재고 리스트
	@Override
	public List<StockDTO> getProdStockList() {
		
		log.debug("WareHouseService getRawStockList()");
		
		return wareHouseDAO.getProdStockList();
	}// getProdStockList


	// 완제품 실수령 수정
	@Override
	public void updateProdStock(StockDTO stockDTO) {
		
		log.debug("WareHouseService updateProdStock()");
		
		wareHouseDAO.updateProdStock(stockDTO);
	}


	// 완제품 재고 검색
	@Override
	public List<StockDTO> prodStockSearch(HashMap<String, Object> json) {
		
		log.debug("WareHouseService prodStockSearch()");
		
		return wareHouseDAO.prodStockSearch(json);
	}

	
	
	
	
	
	

}// class WareHouseCopyServiceImpl
