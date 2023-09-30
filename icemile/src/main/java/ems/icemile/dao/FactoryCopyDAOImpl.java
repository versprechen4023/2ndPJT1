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
	
	@Override
	public List<RequirementDTO> getRequirementList() {
		log.debug("FactoryDAO getRequirementList");
		return sqlSession.selectList(namespace+"getRequirementList");
	}
	
	@Override
	public void deleteRequirement(RequirementDTO requirementDTO) {
		log.debug("FactoryDAO deleteRequirement");
		sqlSession.delete(namespace+"deleteRequirement", requirementDTO);
	}
	
	@Override
	public int getNewReq_code() {
		return sqlSession.selectOne(namespace+"getNewReq_code");
	}
	
	@Override
	public boolean insertRequirement(RequirementDTO requirementDTO) {
		return sqlSession.insert(namespace+"insertRequirement",requirementDTO) > 0;
	}

}
