package ems.icemile.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ems.icemile.dto.ProductAllDTO;
import ems.icemile.dto.ProductDTO;
import ems.icemile.dto.ProductInsertDTO;
import ems.icemile.dto.RawMaterialDTO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ProductDAOImpl implements ProductDAO {
	
	@Inject // 마이바티스 객체 의존성 주입
	private SqlSession sqlSession;
	
	// 네임 스페이스 사용을 위한 변수 선언
	private static final String namespace = "mes.icemile.mappers.productMapper.";
	
	@Override
	public List<ProductAllDTO> getProductList() {
		
		log.debug("getProductList DAO 도달");
		
		return sqlSession.selectList(namespace+"getProductList");
	}
	
	@Override
	public String getNewProductId(ProductInsertDTO productInsertDTO) {
		
		log.debug("getNewProductId DAO 도달");
		
		return sqlSession.selectOne(namespace+"getNewProductId",productInsertDTO);
	}
	
	@Override
	public boolean productInsert(ProductInsertDTO productInsertDTO) {
		
		log.debug("productInsert DAO 도달");

		return sqlSession.insert(namespace+"productInsert", productInsertDTO) > 0;
	}
	
	@Override
	public boolean productUpdate(ProductInsertDTO ProductInsertDTO) {
		
		log.debug("productUpdate DAO 도달");
		
		return sqlSession.update(namespace+"productUpdate", ProductInsertDTO) > 0;
	}
	
	@Override
	public boolean productDelete(List<Map<String, String>> codeAndTypeList) {
		
		log.debug("productDelete DAO 도달");
		
		return sqlSession.delete(namespace+"productDelete", codeAndTypeList) > 0;
	}
	
	@Override
	public List<ProductAllDTO> productSearch(HashMap<String, Object> json) {
		
		log.debug("productSearch DAO 도달");
		
		return sqlSession.selectList(namespace+"productSearch", json);
	}
	
	@Override
	public boolean searchProName(String prod_name) {
		
		log.debug("searchProName DAO 도달");
		
		String result = sqlSession.selectOne(namespace+"searchProName", prod_name);
		
		return (result == null) ? true : false;
	}
	
	@Override
	public List<RawMaterialDTO> getRawList() {

		log.debug("getRawList DAO 도달");
		
		return sqlSession.selectList(namespace+"getRawList");
	}
	
	@Override
	public List<RawMaterialDTO> rowSearch(HashMap<String, Object> json) {
		
		log.debug("rowSearch DAO 도달");
		
		return sqlSession.selectList(namespace+"rowSearch", json);
	}
	
	@Override
	public List<ProductDTO> getProductListPopUp() {
		
		log.debug("getProductListPopUp DAO 도달");
		
		return sqlSession.selectList(namespace+"getProductListPopUp");
	}

	public boolean rawStockDelete(String prod_code) {
        log.debug("rawStockDelete DAO 도달");

        // Product 테이블에서 삭제
        boolean rawStockDelete = sqlSession.delete(namespace+"rawStockDelete", prod_code) > 0;

        if (rawStockDelete) {
            // Stock 테이블에서 삭제
            boolean rStockDelete = sqlSession.delete(namespace+"rStockDelete", prod_code) > 0;

            return rStockDelete;
        }
		return false;
	}

}
