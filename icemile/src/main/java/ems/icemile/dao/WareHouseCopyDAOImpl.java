package ems.icemile.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ems.icemile.dto.InMaterialDTO;
import ems.icemile.dto.ResultDTO;
import ems.icemile.dto.StockDTO;
import ems.icemile.dto.WareHouseinsertDTO;
import ems.icemile.dto.WorkOrderDTO;
import ems.icemile.dto.outMaterialInsertDTO;
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
	}// insertRawStock


	// 재고 코드 생성
	@Override
	public String getNewStockCode() {
		
		log.debug("WareHouseDAO getNewStockCode()");
		
		return sqlSession.selectOne(namespace+"getNewStockCode");
	}

	
	// 원자재 실수량 수정
	@Override
	public void updateRawStock(StockDTO stockDTO) {
		
		log.debug("WareHouseDAO updateRawStock()");
		
		sqlSession.update(namespace+"updateRawStock", stockDTO);
	}// updateRawStock


	// 원자재 재고 검색
	@Override
	public List<StockDTO> rawStockSearch(HashMap<String, Object> json) {
		
		log.debug("WareHouseDAO rawStockSearch()");
		
		return sqlSession.selectList(namespace+"rawStockSearch", json);
	}// rawStockSearch


	// 완제품 재고 리스트
	@Override
	public List<StockDTO> getProdStockList() {

		log.debug("WareHouseDAO getProdStockList()");
		
		// 네임페이스 변수 선언할 때 뒤에 .까지 붙여서 메서드명 앞에 .안 붙이는 것
		return sqlSession.selectList(namespace+"getProdStockList");
	}// getProdStockList


	// 완제품 실수량 수정
	@Override
	public void updateProdStock(StockDTO stockDTO) {
		
		log.debug("WareHouseDAO updateProdStock()");
		
		sqlSession.update(namespace+"updateProdStock", stockDTO);
	}// updateProdStock


	// 완제품 재고 검색
	@Override
	public List<StockDTO> prodStockSearch(HashMap<String, Object> json) {
		
		log.debug("WareHouseDAO prodStockSearch()");
		
		return sqlSession.selectList(namespace+"prodStockSearch", json);
	}


	// 원자재 재고 수량 수정
	@Override
	public void updateRawAmount(InMaterialDTO inMaterialDTO) {
		
		log.debug("WareHouseDAO updateRawAmount()");
		
		sqlSession.update(namespace+"updateRawAmount", inMaterialDTO);
	}


	// 완제품 재고 수량 수정
	@Override
	public boolean updateProdAmount(ResultDTO resultDTO) {
		
		log.debug("WareHouseDAO updateProdAmount()");
		
		return sqlSession.update(namespace+"updateProdAmount", resultDTO) > 0;
	}


	// 원자재 재고 감하는 수정
	@Override
	public void updateRawSubtract(WorkOrderDTO workOrderDTO) {
		
		log.debug("WareHouseDAO updateRawSubtract()");
		
		sqlSession.update(namespace+"updateRawSubtract", workOrderDTO);
	}


	// 완제품 감하는 수정
	public void updateProdSubtract(outMaterialInsertDTO outmaterialInsertDTO) {
		
		log.debug("WareHouseDAO updateProdSubtract()");
		
		sqlSession.update(namespace+"updateProdSubtract", outmaterialInsertDTO);
	}







	

}// class WareHouseDAOImpl
