package ems.icemile.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ems.icemile.service.MainService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
//임시로 주소 매핑
@RequestMapping("/pageTest/*")
public class PageMakeController {
	
	@Inject
	private MainService pageMakeService;


	@GetMapping("/emp")
	public String emp() {
		//사원 조회
		log.debug("emp");
		
		return "pageTest/emp";
	}	
	
	
	@GetMapping("/raw")
	public String raw() {
		//원자재 관리
		log.debug("raw");
		
		return "pageTest/raw";
	}
	
	
	@GetMapping("/product")
	public String product() {
		//완제품 관리
		log.debug("product");
		
		return "pageTest/product";
	}
	
	
	@GetMapping("/requirement")
	public String requirement() {
		//소요량 관리
		log.debug("requirement");
		
		return "pageTest/requirement";
	}
	
	
	@GetMapping("/warehouse")
	public String warehouse() {
		//창고 관리
		log.debug("warehouse");
		
		return "pageTest/warehouse";
	}
	
	
	@GetMapping("/rawOrder")
	public String rawOrder() {
		//발주 관리
		log.debug("rawOrder");
		
		return "pageTest/rawOrder";
	}
	
	
	@GetMapping("/inMaterial")
	public String inMaterial() {
		//입고 관리
		log.debug("inMaterial");
		
		return "pageTest/inMaterial";
	}
	
	@GetMapping("/buy")
	public String buy() {
		//매입처(거래처) 관리
		log.debug("buy");
		
		return "pageTest/buy";
	}
	
	
	@GetMapping("/branch")
	public String branch() {
		//지점 관리
		log.debug("branch");
		
		return "pageTest/branch";
	}
	
	
	@GetMapping("/workOrder")
	public String workOrder() {
		//작업 지시 관리
		log.debug("workOrder");
		
		return "pageTest/workOrder";
	}
	
	
	@GetMapping("/result")
	public String result() {
		//생산 실적 관리
		log.debug("result");
		
		return "pageTest/result";
	}
	
	
	@GetMapping("/facility")
	public String facility() {
		//생산 실적 관리
		log.debug("facility");
		
		return "pageTest/facility";
	}
	
	
	@GetMapping("/stock")
	public String stock() {
		//재고(물품) 관리
		log.debug("stock");
		
		return "pageTest/stock";
	}
	
	
	@GetMapping("/orders")
	public String orders() {
		//수주 관리
		log.debug("orders");
		
		return "pageTest/orders";
	}
	
	
	@GetMapping("/outMaterial")
	public String outMaterial() {
		//출고 관리
		log.debug("outMaterial");
		
		return "pageTest/outMaterial";
	}
	
	// 매입처(거래처) 등록 페이지
	@GetMapping("/buyAdd")
	public String buyAdd() {
	
		log.debug("매입처 등록 페이지");
		
		return "/Add/buyAdd";	
	}
	
	// 작업지시관리 등록 페이지
	@GetMapping("/workOrderAdd")
	public String workOrderAdd() {
	
		log.debug("작업지시관리 등록 페이지");
		
		return "/Add/workOrderAdd";
	}
	
	// 생산실정관리 등록 페이지
	@GetMapping("/resultAdd")
	public String resultAdd() {
	
		log.debug("생산실적관리 등록 페이지");
		
		return "/Add/resultAdd";
	}
	
	// 생산설비관리 등록 페이지
	@GetMapping("/facilityAdd")
	public String facilityAdd() {
	
		log.debug("생산설비관리 등록 페이지");
		
		return "/Add/facilityAdd";
	}
	
	// 원자재재고 등록 페이지
	@GetMapping("/rawStockAdd")
	public String rawStockAdd() {
	
		log.debug("원자재재고 등록 페이지");
		
		return "/Add/rawStockAdd";
	}
	
	// 원자재 추가 페이지
	@GetMapping("/rawmaterialAdd")
	public String rawmaterialAdd() {
	
		log.debug("원자재 추가 페이지");
		
		return "/Add/rawmaterialAdd";
	}
	
	// 완제품 추가 페이지
	@GetMapping("/productAdd")
	public String productAdd() {
	
		log.debug("완제품 추가 페이지");
		
		return "/Add/productAdd";
	}
	
	// 소요량 추가 페이지
	@GetMapping("/requirementAdd")
	public String requirementAdd() {
	
		log.debug("소요량 추가 페이지");
		
		return "/Add/requirementAdd";
	}
	
	// 창고 추가 페이지
	@GetMapping("/warehouseAdd")
	public String warehouseAdd() {
	
		log.debug("창고 추가 페이지");
		
		return "/Add/warehouseAdd";
	}
	
	
	
}

