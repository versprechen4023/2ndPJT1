package ems.icemile.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ems.icemile.dto.ProductAllDTO;
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
		
		log.debug("겟 프로덕트 리스트 DAO 도달");
		return sqlSession.selectList(namespace+"getProductList");
	}
}
