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

import ems.icemile.dto.FacilityDTO;
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
	public String facility(Model model) {
		
		// 원자재 재고 리스트
		log.debug("rawStock");
		
		// 설비 관리 리스트 객체 생성
		List<StockDTO> rawStock = warehouseService.getRawStockList();
		
		// 모델에 facilityList값 저장
		model.addAttribute("rawStock", rawStock);
		
		
		// 주소 변경 x
		return "warehouse/rawStock";
	}
	

	
	
	
	
	

}//class WareHouseCopyController
