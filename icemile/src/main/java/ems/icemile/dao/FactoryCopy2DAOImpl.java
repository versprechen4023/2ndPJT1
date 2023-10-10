package ems.icemile.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ems.icemile.dto.WorkOrderDTO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class FactoryCopy2DAOImpl implements FactoryCopy2DAO {
	
	// 마이바티스 객체 의존성 주입
	@Inject 
	private SqlSession sqlSession;
	
	// 네임스페이스 사용을 위한 변수 선언
	@Inject
	private static final String namespace = "ems.icemile.mappers.workOrderMapper";

	@Override
	public List<WorkOrderDTO> workOrderList() {
		
		log.debug("작업 지시 리스트 DAO");
		
		return sqlSession.selectList(namespace+".workOrderList");
	}


	@Override
	public String getWorkCode() {
		log.debug("작업 지시 코드 부여 DAO");
		return sqlSession.selectOne(namespace+".getWorkCode");
	}
	
	@Override
	public void workOrderAdd(WorkOrderDTO workOrderDTO) {
		log.debug("작업 지시 추가 DAO");
		 sqlSession.insert(namespace+".workOrderAdd", workOrderDTO);
		
		
	}

	@Override
	public WorkOrderDTO getWorkOrderInfo(String work_code) {
		log.debug("작업 지시 정보 얻기 DAO");
		return sqlSession.selectOne(namespace+".getWorkOrderInfo", work_code);
	}

	@Override
	public void workOrderUpdate(WorkOrderDTO workOrderDTO) {
		log.debug("작업 지시 수정 DAO");
		sqlSession.update(namespace+".workOrderUpdate", workOrderDTO);
		
	}

	@Override
	public boolean workOrderDelete(String work_code) {
		log.debug("작업 지시 삭제 DAO");		
		return sqlSession.delete(namespace+".workOrderDelete", work_code) > 0;
	}

	@Override
	public List<WorkOrderDTO> workOrderSearch(HashMap<String, Object> json) {
		log.debug("작업 지시 서치 DAO 도달");
		return sqlSession.selectList(namespace+".workOrderSearch", json);
	}

}
