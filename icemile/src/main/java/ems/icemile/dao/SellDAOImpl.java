package ems.icemile.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ems.icemile.dto.SellDTO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class SellDAOImpl implements SellDAO{
	
	@Inject // 마이바티스 객체 의존성 주입
	private SqlSession sqlSession;
	
	// 네임 스페이스 사용을 위한 변수 선언
	private static final String namespace = "mes.icemile.mappers.sellMapper.";
	
	@Override
	public int getNewBranchCode() {
		return sqlSession.selectOne(namespace+"getNewBranchCode");
	}
	@Override
	public boolean branchReg(SellDTO sellDTO) {
		log.debug("DAO| 지점 추가");
		return sqlSession.insert(namespace+"branchReg",sellDTO) > 0;
	}

	@Override
	public List<SellDTO> getBranchList() {
		log.debug("DAO| 지점 목록");
		return sqlSession.selectList(namespace+"branch");
	}
	
	@Override
	public SellDTO getBranchInfo(String branch_code) {
		log.debug("DAO| 지점 정보");
		return sqlSession.selectOne(namespace+"getBranchInfo", branch_code);
	}

	@Override
	public boolean branchUpdate(SellDTO sellDTO) {
		log.debug("DAO| 지점 정보 수정");
		return sqlSession.update(namespace+"branchUpdate",sellDTO) > 0;
	}
	
	@Override
	public boolean branchDelete(String branch_code) {
		log.debug("DAO| 지점 삭제");
		return sqlSession.delete(namespace+"branchDelete", branch_code) > 0;
	}
	
	@Override
	public List<SellDTO> branchSearch(HashMap<String, Object> json) {
		log.debug("DAO| 지점 검색");
		return sqlSession.selectList(namespace+"branchSearch", json);
	}

	
	

}
