package ems.icemile.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ems.icemile.dto.ProductAllDTO;
import ems.icemile.dto.ProductInsertDTO;

public interface ProductService {
	
	// 전체 품목리스트 정보 얻기
	public List<ProductAllDTO> getProductList();
	
	// 품목 등록
	public boolean productInsert(ProductInsertDTO productInsertDTO);
	
	// 품목 수정
	public boolean productUpdate(ProductInsertDTO ProductInsertDTO);
	
	// 품목 삭제
	public boolean productDelete(List<Map<String, String>> codeAndTypeList);
	
	// 품목 검색
	public List<ProductAllDTO> productSearch(HashMap<String, Object> json);
}
