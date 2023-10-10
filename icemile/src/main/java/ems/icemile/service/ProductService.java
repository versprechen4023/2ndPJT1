package ems.icemile.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ems.icemile.dto.ProductAllDTO;
import ems.icemile.dto.ProductDTO;
import ems.icemile.dto.ProductInsertDTO;
import ems.icemile.dto.RawMaterialDTO;

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
	
	// 품목 이름 중복검사
	public boolean searchProName(String prod_name);
	
	// 팝업창에서 사용할 원자재 리스트 출력
	public List<RawMaterialDTO> getRawList();
	
	// 원자재 검색
	public List<RawMaterialDTO> rowSearch(HashMap<String, Object> json);
	
	// 팝업창에서 사용할 완제품 리스트 출력
	public List<ProductDTO> getProductListPopUp();
}
