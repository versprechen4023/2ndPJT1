package ems.icemile.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
		
		List<Map<String, String>> codeAndTypeList = new ArrayList<>();

		for (String a : selectedProId) {
			
		    Map<String, String> codeAndType = new HashMap<>();
		    
		    codeAndType.put("code", a);
		    codeAndType.put("type", a.substring(0,1));
		    codeAndTypeList.add(codeAndType);
		}
		
		return Boolean.toString(productService.productDelete(codeAndTypeList));
	}
}
