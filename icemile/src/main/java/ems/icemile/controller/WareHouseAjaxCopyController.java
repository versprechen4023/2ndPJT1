package ems.icemile.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ems.icemile.dto.FacilityDTO;
import ems.icemile.dto.StockDTO;
import ems.icemile.service.WareHouseCopyService;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/warehouse_ajax/*")
public class WareHouseAjaxCopyController {

	@Inject // 웨어하우스 서비스 의존성 주입
	private WareHouseCopyService wareHouseService;
	
	// 원자재 재고 검색
	@PostMapping("/rawStockSearch")
	public List<StockDTO> rawStockSearch(@RequestBody HashMap<String, Object> json) {

		log.debug("WareHouseAjaxCopyController rawStockSearch");
		
		// 물품리스트를 가져오기위한 물품리스트 객체생성
		List<StockDTO> rawStockList = new ArrayList<StockDTO>();
		//결과값에 따라 물품 리스트를 가져온다
		rawStockList = wareHouseService.rawStockSearch(json);

		return rawStockList;
	}
	
	
	// 완제품 재고 검색
	@PostMapping("/prodStockSearch")
	public List<StockDTO> prodStockSearch(@RequestBody HashMap<String, Object> json) {

		log.debug("WareHouseAjaxCopyController prodStockSearch");
		
		// 물품리스트를 가져오기위한 물품리스트 객체생성
		List<StockDTO> prodStockList = new ArrayList<StockDTO>();
		//결과값에 따라 물품 리스트를 가져온다
		prodStockList = wareHouseService.prodStockSearch(json);

		return prodStockList;
	}

	

}// WareHouseAjaxCopyController
