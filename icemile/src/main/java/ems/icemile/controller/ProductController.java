package ems.icemile.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ems.icemile.dto.ProductAllDTO;
import ems.icemile.service.ProductServiceImpl;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/product/*")
public class ProductController {
	
	@Inject // 프로덕트 서비스 의존성 주입
	private ProductServiceImpl productService;
	
	@GetMapping("/productList")
	public String productList(Model model) {
		
		log.debug("product/productList.jsp");
		
		// 품목리스트를 가져오기위한 품목리스트 객체생성
		List<ProductAllDTO> productList = new ArrayList<ProductAllDTO>();
		productList = productService.getProductList();
				
		// 모델에 멤버 DTO값 저장
		model.addAttribute("productList", productList);
		
		return "product/productList";
	}
	
	@GetMapping("/productAdd")
	public String productAdd(Model model) {
		
		log.debug("product/productAdd.jsp");
		
		return "product/productAdd";
	}
}
