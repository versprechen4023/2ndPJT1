package ems.icemile.dao;

import java.util.List;

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
	@Override
	public int getNewReq_code() {
		return sqlSession.selectOne(namespace+"getNewReq_code");
	}// getNewReq_code() 
	
	// 소요량 등록
	@Override
	public boolean insertRequirement(RequirementDTO requirementDTO) {
		return sqlSession.insert(namespace+"insertRequirement",requirementDTO) > 0;
	}//insertRequirement
	
	// 소요량 수정 페이지 req_code 값 받아서
	public RequirementDTO getRequirement(String req_code) {
	return sqlSession.selectOne(namespace+"getRequirement",req_code);
	}//  getRequirement
	
	// 소요량 수정
	@Override
	public void updateRequirement(RequirementDTO requirementDTO) {
	 sqlSession.update(namespace+"updateRequirement", requirementDTO);	
	}// updateRequirement

}
