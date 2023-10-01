package ems.icemile.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
