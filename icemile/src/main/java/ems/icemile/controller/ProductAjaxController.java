package ems.icemile.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ems.icemile.dto.ProductAllDTO;
import ems.icemile.dto.ProductInsertDTO;
import ems.icemile.service.ProductServiceImpl;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/product_ajax/*")
public class ProductAjaxController {
	
	@Inject // 프로덕트 서비스 의존성 주입
	private ProductServiceImpl productService;
	
	@PostMapping("/productInsert")
	public String productInsert(ProductInsertDTO ProductInsertDTO) {
		
		log.debug("값 잘 넘어오나"+ProductInsertDTO);
		
		return Boolean.toString(productService.productInsert(ProductInsertDTO));
	}
	
	@PostMapping("/productUpdate")
	public String productUpdate(ProductInsertDTO ProductInsertDTO) {
		
		log.debug("값 잘 넘어오나"+ProductInsertDTO);
		
		return Boolean.toString(productService.productUpdate(ProductInsertDTO));
	}
	
	@PostMapping("/productDelete")
	public String productDelete(@RequestParam("selectedProId") String[] selectedProId) {
		
		// 다중 삭제를 위한 리스트 형식의 맵 타입 배열 변수선언
		List<Map<String, String>> codeAndTypeList = new ArrayList<>();
		
		// DB에서 원자재와 완제품을 구분하기위해 맵형태 배열에 키값을 추가하고 조건문에 들어갈 품목번호를 입력한다
		for (String a : selectedProId) {
			
			// 맵 타입 배열 객체생성
		    Map<String, String> codeAndType = new HashMap<>();
		    
		    // 품목번호를 삽입한다
		    codeAndType.put("code", a);
		    // 원자재와 완제품을 구분하기위한 코드를 삽입한다 = R0001 = R(원자재)
		    codeAndType.put("type", a.substring(0,1));
		    // 리스트 배열에 맵 배열을 삽입한다
		    codeAndTypeList.add(codeAndType);
		}
		
		return Boolean.toString(productService.productDelete(codeAndTypeList));
	}
	
	@PostMapping("search")
	public List<ProductAllDTO> productSearch(@RequestBody HashMap<String, Object> json) {
		
		log.debug("프로덕트 서치 AJAX 호출");
		
		// 물품리스트를 가져오기위한 물품리스트 객체생성
		List<ProductAllDTO> productList = new ArrayList<ProductAllDTO>();
		//결과값에 따라 물품 리스트를 가져온다
		productList = productService.productSearch(json);
		
		// 콜백 함수에 결과값 리턴
		return productList;
	}
}
