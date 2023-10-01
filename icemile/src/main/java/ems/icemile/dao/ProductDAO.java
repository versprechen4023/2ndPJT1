package ems.icemile.dao;

import java.util.List;

import ems.icemile.dto.ProductAllDTO;
import ems.icemile.dto.ProductInsertDTO;

public interface ProductDAO {
	
	// 전체 품목리스트 정보 얻기
	public List<ProductAllDTO> getProductList();
	
	// 완제품 or 원자재 고유 번호 얻기
	public int getNewProductId(ProductInsertDTO productInsertDTO);
	
	// 품목 등록
	public boolean productInsert(ProductInsertDTO productInsertDTO);
	
}
