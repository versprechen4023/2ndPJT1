package ems.icemile.dao;

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
	public boolean branchInsert(SellDTO sellDTO) {
		log.debug("지점 추가 DAO도달");
		return sqlSession.insert(namespace+"branchInsert",sellDTO) > 0;
	}

	@Override
	public List<SellDTO> getBranchList() {
		log.debug("지점 목록 DAO 도달");
		return sqlSession.selectList(namespace+".branch");
	}


}
