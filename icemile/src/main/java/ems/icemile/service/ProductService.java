package ems.icemile.service;

import java.util.List;

import ems.icemile.dto.ProductAllDTO;

public interface ProductService {
	
	// 전체 품목리스트 정보 얻기
	public List<ProductAllDTO> getProductList();
}
