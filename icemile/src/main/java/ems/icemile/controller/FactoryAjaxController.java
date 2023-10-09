package ems.icemile.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ems.icemile.dto.BuyDTO;
import ems.icemile.dto.ProductAllDTO;
import ems.icemile.dto.WorkOrderDTO;
import ems.icemile.service.FactoryCopy2ServiceImpl;
import ems.icemile.service.FactoryService;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/factory_ajax/*")
public class FactoryAjaxController {
	
	@Inject // 팩토리 서비스 의존성 주입
	private FactoryService factoryService;
	
	@Inject // Copy2는 workOrder 작업. 충돌 최소화를 위해 FactoryCopy2에 작업
	private FactoryCopy2ServiceImpl factoryCopy2Service;
	
	
	@PostMapping("/deleteFacility")
	public String deleteFacility(@RequestParam("selectedLineCo") String[] selectedLineCo) {
		
		// 마이바티스에서 반복처리를 위해 배열을 리스트 타입으로 변경
		List<String> deleteList = Arrays.asList(selectedLineCo);
		
		return Boolean.toString(factoryService.deleteFacility(deleteList));
	}// facilityDelete
	
	
	@GetMapping("searchLineName")
	public boolean searchLineName(@RequestParam("line_name")String line_name) {
		
		log.debug("searchLineName AJAX 호출");
		
		return factoryService.searchLineName(line_name);
	}
	
	
	@PostMapping("search")
	public List<ProductAllDTO> facilitySearch(@RequestBody HashMap<String, Object> json) {
		
		log.debug("FactoryAjaxController facilitySearch");
		
		// 물품리스트를 가져오기위한 물품리스트 객체생성
		List<ProductAllDTO> productList = new ArrayList<ProductAllDTO>();
		//결과값에 따라 물품 리스트를 가져온다
//		productList = productService.productSearch(json);
		
		// 콜백 함수에 결과값 리턴
		return productList;
	}
	
    @PostMapping("/workOrderAdd")
    public ResponseEntity<String> workOrderAdd(WorkOrderDTO workOrderDTO) {
        try {
            factoryCopy2Service.workOrderAdd(workOrderDTO);
            return new ResponseEntity<>("true", HttpStatus.OK); // 성공 시 "true" 반환
        } catch (Exception e) {
            log.error("Error during workOrderAdd: {}", e.getMessage());
            return new ResponseEntity<>("false", HttpStatus.INTERNAL_SERVER_ERROR); // 실패 시 "false" 반환
        }
    }
	
    @PostMapping("/workOrderUpdate")
    public ResponseEntity<String> workOrderUpdate (WorkOrderDTO workOrderDTO) {
        try {
            factoryCopy2Service.workOrderUpdate(workOrderDTO);
            return new ResponseEntity<>("true", HttpStatus.OK); // 성공 시 "true" 반환
        } catch (Exception e) {
            log.error("Error during workOrderUpdate: {}", e.getMessage());
            return new ResponseEntity<>("false", HttpStatus.INTERNAL_SERVER_ERROR); // 실패 시 "false" 반환
        }
    }
    
	@PostMapping("/workOrderDelete")
	public String workOrderDelete(@RequestParam("work_code") String work_code) {
		log.debug("작업 지시 삭제 AJAX 호출");
		
		return Boolean.toString(factoryCopy2Service.workOrderDelete(work_code));
		
	}
	
	@PostMapping("workOrderSearch")
	public List<WorkOrderDTO> workOrderSearch(@RequestBody HashMap<String, Object> json) {
		
		log.debug("작업 지시 서치 AJAX 호출");
		
		// 멤버리스트를 가져오기위한 멤버리스트 객체생성
		List<WorkOrderDTO> workOrderList = new ArrayList<WorkOrderDTO>();
		//결과값에 따라 멤버리스트를 가져온다
		workOrderList = factoryCopy2Service.workOrderSearch(json);
		
		// 콜백 함수에 결과값 리턴
		return workOrderList;
	
	}


}// class FactoryAjaxController
	
