package ems.icemile.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ems.icemile.dto.StockDTO;
import ems.icemile.service.WareHouseCopyService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/warehouse/*")
public class WareHouseCopyController {
	
	
	@Inject // 팩토리 서비스 의존성 주입
	private WareHouseCopyService warehouseService;
	
	
	// 가상주소: http://localhost:8080/home/warehouse/rawStock
	@GetMapping("/rawStock")
	public String rawStock(Model model) {
		
		// 원자재 재고 리스트
		log.debug("rawStock");
		
		// 설비 관리 리스트 객체 생성
		List<StockDTO> rawStock = warehouseService.getRawStockList();
		
		// 모델에 facilityList값 저장
		model.addAttribute("rawStock", rawStock);
		
		
		// 주소 변경 x
		return "warehouse/rawStock";
	}
	
	
	// 가상주소: http://localhost:8080/FunWeb/warehouse/updateRawStock
	@PostMapping("/updateRawStock")
	public String updateRawStock(StockDTO StockDTO) {
		// 원자재 실수량 수정
		log.debug("updateRawStock");
		
		// StockDTO 담아서 warehouseService에 updateRawStock 메서드 생성
		warehouseService.updateRawStock(StockDTO);
		
		// 주소 -> /factory/facility로 변경되면서 이동
		return "redirect:/warehouse/rawStock";
	}
	
	
	// 가상주소: http://localhost:8080/home/warehouse/productStock
	@GetMapping("/productStock")
	public String productStock(Model model) {
		
		// 원자재 재고 리스트
		log.debug("productStock");
		
		// 설비 관리 리스트 객체 생성
		List<StockDTO> productStock = warehouseService.getProdStockList();
		
		// 모델에 productStock값 저장
		model.addAttribute("productStock", productStock);
		
		
		// 주소 변경 x
		return "warehouse/prodStock";
	}
	
	
	// 가상주소: http://localhost:8080/FunWeb/warehouse/updateProdStock
	@PostMapping("/updateProdStock")
	public String updateProdStock(StockDTO StockDTO) {
		// 완제품 실수량 수정
		log.debug("updateProdStock");
		
		// StockDTO 담아서 warehouseService에 updateProdStock 메서드 생성
		warehouseService.updateProdStock(StockDTO);
		
		// 주소 -> /factory/facility로 변경되면서 이동
		return "redirect:/warehouse/productStock";
	}
	

	
	
	
	
	

}//class WareHouseCopyController
