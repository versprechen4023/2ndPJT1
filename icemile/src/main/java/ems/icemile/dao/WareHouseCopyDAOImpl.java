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

	
	// 원자재 재고 삽입
	@Override
	public boolean insertRawStock(StockDTO stockDTO) {
		
		 log.debug("WareHouseDAO insertStock()");
		 
	     int result = sqlSession.insert(namespace + "insertRawStock", stockDTO);
	     // 삽입된 게 적어도 하나 이상일 때를 의미하며, true를 반환하는 것
	     return result > 0;
	}


	// 재고 코드 생성
	@Override
	public int getNewStockCode() {
		
		log.debug("WareHouseDAO getNewStockCode()");
		
		return sqlSession.selectOne(namespace+"getNewStockCode");
	}

	
	// 원자재 실수량 수정
	@Override
	public void updateRawStock(StockDTO stockDTO) {
		
		log.debug("WareHouseDAO updateRawStock()");
		
		sqlSession.update(namespace+"updateRawStock", stockDTO);
	}




	

}// class WareHouseDAOImpl
