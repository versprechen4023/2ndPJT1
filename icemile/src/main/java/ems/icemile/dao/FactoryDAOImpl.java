package ems.icemile.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ems.icemile.dto.FacilityDTO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class FactoryDAOImpl implements FactoryDAO {
	
	
	@Inject // 마이바티스 객체 의존성 주입(데이터베이스 연결 관리)
	private SqlSession sqlSession;
	
	// 네임스페이스 사용을 위한 변수 선언
	private static final String namespace = "mes.icemile.mappers.factoryMapper.";
	
	
	
	@Override
	public List<FacilityDTO> getFacilityList() {
		
		log.debug("FactoryDAO getFacilityList()");
		
		// 네임페이스 변수 선언할 때 뒤에 .까지 붙여서 메서드명 앞에 .안 붙이는 것
		return sqlSession.selectList(namespace+"getFacilityList");
	}// getFacilityList


	@Override
	public int getNewFacilityCode() {

		return sqlSession.selectOne(namespace+"getNewFacilityCode");
	}


	@Override
	public void insertFacility(FacilityDTO facilityDTO) {
		
		log.debug("FactoryDAO insertFacility()");
		
		sqlSession.insert(namespace+"insertFacility", facilityDTO);
	}// insertFacility


	@Override
	public void updateFacility(FacilityDTO facilityDTO) {
		
		log.debug("FactoryDAO updateFacility()");
		
		sqlSession.update(namespace+"updateFacility", facilityDTO);
	}// updateFacility


	@Override
	public boolean deleteFacility(List<String> deleteList) {

		log.debug("FactoryDAO deleteFacility()");
		
		return sqlSession.delete(namespace+"deleteFacility", deleteList) > 0;
	}// deleteFacility


	@Override
	public boolean searchLineName(String line_name) {
		
		log.debug("FactoryDAO searchLineName()");
		
		String result = sqlSession.selectOne(namespace+"searchLineName", line_name);
		
		return result.isEmpty();
	}


	@Override
	public List<FacilityDTO> facilitySearch(HashMap<String, Object> json) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	
	
	
	
	

}//FactoryDAOImpl
