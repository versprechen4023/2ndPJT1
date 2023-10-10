package ems.icemile.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ems.icemile.dto.StockDTO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class WareHouseCopyDAOImpl implements WareHouseCopyDAO {

	@Inject // 마이바티스 객체 의존성 주입(데이터베이스 연결 관리)
	private SqlSession sqlSession;

	// 네임 스페이스 사용을 위한 변수 선언
	private static final String namespace = "mes.icemile.mappers.wareHouseCopyMapper.";

	
	// 원자재 재고 리스트
	@Override
	public List<StockDTO> getRawStockList() {

		log.debug("WareHouseDAO getRawStockList()");
		
		// 네임페이스 변수 선언할 때 뒤에 .까지 붙여서 메서드명 앞에 .안 붙이는 것
		return sqlSession.selectList(namespace+"getRawStockList");
	}// getRawStockList()

	
	
	
	

}// class WareHouseDAOImpl
