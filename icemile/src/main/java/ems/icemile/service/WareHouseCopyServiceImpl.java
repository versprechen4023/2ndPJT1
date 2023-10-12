package ems.icemile.service;

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
	}


	// 원자재 실수량 수정
	@Override
	public void updateRawStock(StockDTO stockDTO) {
		
		log.debug("WareHouseService updateRawStock()");
		
		wareHouseDAO.updateRawStock(stockDTO);
	}

	
	
	
	
	
	

}// class WareHouseCopyServiceImpl
