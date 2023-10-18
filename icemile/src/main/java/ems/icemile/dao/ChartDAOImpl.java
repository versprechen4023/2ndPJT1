package ems.icemile.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ems.icemile.dto.ChartDTO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ChartDAOImpl implements ChartDAO{
	
	// 마이바티스 객체 의존성 주입
	@Inject
	private SqlSession sqlSession;
	
	// 네임스페이스 사용을 위한 변수 선언
	@Inject
	private static final String namespace = "ems.icemile.mappers.chartMapper.";
	
	@Override
	public List<ChartDTO> getMonthlySale() {
		
		log.debug("월별 판매 실적 DAO");
		
		return sqlSession.selectList(namespace+"getMonthlySale");
	}

	@Override
	public List<ChartDTO> getMonthlyProd() {
		
		log.debug("월별 생산 실적 DAO");
		
		return sqlSession.selectList(namespace+"getMonthlyProd");
	}
}
