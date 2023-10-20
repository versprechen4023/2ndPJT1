package ems.icemile.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ems.icemile.dto.RequirementDTO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class FactoryCopyDAOImpl implements FactoryCopyDAO {
	
	@Inject 
	private SqlSession sqlSession;
	
	@Inject
	private static final String namespace = "mes.icemile.mappers.requirementMapper.";
	
	// 소요량 리스트
	@Override
	public List<RequirementDTO> getRequirementList() {
		log.debug("FactoryDAO getRequirementList");
		return sqlSession.selectList(namespace+"getRequirementList");
	}//getRequirementList() 
	
	// 소요량 삭제
	@Override
	public void deleteRequirement(RequirementDTO requirementDTO) {
		log.debug("FactoryDAO deleteRequirement");
		sqlSession.delete(namespace+"deleteRequirement", requirementDTO);
	}//deleteRequirement
	
	// 소요량 코드 자동부여
//	@Override
//	public int getNewReq_code() {
//		return sqlSession.selectOne(namespace+"getNewReq_code");
//	}// getNewReq_code() 
	
	@Override
	public String getNewReq_code() {
		return sqlSession.selectOne(namespace+"getNewReq_code");
	}
	
	// 소요량 등록
	@Override
	public boolean insertRequirement(RequirementDTO requirementDTO) {
		return sqlSession.insert(namespace+"insertRequirement",requirementDTO) > 0;
	}//insertRequirement
	
	@Override
	public boolean checkRawCode(String prod_code, String raw_code) {
		 Map<String, String> params = new HashMap<>();
		    params.put("prod_code", prod_code);
		    params.put("raw_code", raw_code);
		    boolean result = false;
		    String result2 = sqlSession.selectOne(namespace + "checkRawCode", params);
		    if(result2==null) {
		    	result=false;
		    }else {
		     result = true;
		    }
		    return result;
	}
	
	// 소요량 수정 페이지 req_code 값 받아서
	public RequirementDTO getRequirement(String req_code) {
	return sqlSession.selectOne(namespace+"getRequirement",req_code);
	}//  getRequirement
	
	// 소요량 수정
	@Override
	public void updateRequirement(RequirementDTO requirementDTO) {
	 sqlSession.update(namespace+"updateRequirement", requirementDTO);	
	}// updateRequirement
	
	@Override
	public List<RequirementDTO> requirementSearch(HashMap<String, Object> json) {
		log.debug("FactoryDAO requirementSearch");
		return sqlSession.selectList(namespace+"requirementSearch", json);
	}
	
}
