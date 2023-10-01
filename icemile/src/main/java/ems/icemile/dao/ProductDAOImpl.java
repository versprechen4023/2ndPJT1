package ems.icemile.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ems.icemile.dto.ProductAllDTO;
import ems.icemile.dto.ProductInsertDTO;
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
	public int getNewProductId(ProductInsertDTO productInsertDTO) {
		
		log.debug("getNewProductId DAO 도달");
		
		return sqlSession.selectOne(namespace+"getNewProductId", productInsertDTO);
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
}
