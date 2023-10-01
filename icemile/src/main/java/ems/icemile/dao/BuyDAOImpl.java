package ems.icemile.dao;

import java.util.List;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ems.icemile.dto.BuyDTO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class BuyDAOImpl implements BuyDAO {
	
	@Inject // 마이바티스 객체 의존성 주입
	private SqlSession sqlSession;
	// 네임 스페이스 사용을 위한 변수 선언
	private static final String namespace = "ems.icemile.mappers.buyMapper";
	
	@Override
	public List<BuyDTO> getBuyList() {
		log.debug("BuyService getBuyList()");
		return sqlSession.selectList(namespace+".getBuyList");
	}
	
	@Override
	public int getBuyCode() {
		log.debug("BuyService getBuyCode() 구매처 고유코드");
		return sqlSession.selectOne(namespace+".getBuyCode");
	}

	@Override
	public void buyInsert(BuyDTO buyDTO) {
		log.debug("BuyService buyInsert()");
		
		sqlSession.insert(namespace+".buyInsert", buyDTO);
	}
	}


