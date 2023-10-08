package ems.icemile.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ems.icemile.dto.RawOrderDTO;
import ems.icemile.dto.RowOrderListDTO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class BuyOrderDAO {
	
	@Inject // 마이바티스 객체 의존성 주입
	private SqlSession sqlSession;
	
	// 네임 스페이스 사용을 위한 변수 선언
	private static final String namespace = "ems.icemile.mappers.buyOrderMapper.";
	
	public boolean rawOrderInsert(RawOrderDTO rawOrderDTO) {
		
		log.debug("rawOrderInsert DAO 도달");
		
		return sqlSession.insert(namespace+"rawOrderInsert", rawOrderDTO) > 0;
	}

	public String getNewRawOrderCode() {
		
		log.debug("getNewRawOrderCode DAO 도달");
		
		return sqlSession.selectOne(namespace+"getNewRawOrderCode");
	}

	public List<RowOrderListDTO> getRawOrderList() {
		
		log.debug("getRawOrderList DAO 도달");
		
		return sqlSession.selectList(namespace+"getRawOrderList");
	}

	public boolean rawOrderDelete(List<String> deleteRawList) {
		
		log.debug("rawOrderDelete DAO 도달");
		
		return sqlSession.delete(namespace+"rawOrderDelete", deleteRawList) > 0;
	}

	public boolean rawOrderUpdate(RawOrderDTO rawOrderDTO) {
		
		log.debug("rawOrderUpdate DAO 도달");
		
		return sqlSession.update(namespace+"rawOrderUpdate", rawOrderDTO) > 0;
	}

}
