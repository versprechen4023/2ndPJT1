package ems.icemile.service;

import java.util.List;

import ems.icemile.dto.ProductAllDTO;
import ems.icemile.dto.ProductInsertDTO;

public interface ProductService {
	
	// 전체 품목리스트 정보 얻기
	public List<ProductAllDTO> getProductList();
	
	// 품목 등록
	public boolean productInsert(ProductInsertDTO productInsertDTO);
}
