package ems.icemile.dao;

import java.util.List;

import ems.icemile.dto.ProductAllDTO;

public interface ProductDAO {
	
	// 전체 품목리스트 정보 얻기
	public List<ProductAllDTO> getProductList();
}
