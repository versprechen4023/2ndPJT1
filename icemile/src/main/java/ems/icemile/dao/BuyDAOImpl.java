package ems.icemile.dao;

import java.util.HashMap;
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
	public String getBuyCode() {
		log.debug("BuyService getBuyCode() 구매처 고유코드");
		return sqlSession.selectOne(namespace+".getBuyCode");
	}

	@Override
	public boolean buyInsert(BuyDTO buyDTO) {
		log.debug("BuyService buyInsert() 거래처 추가 되라");
		
		return sqlSession.insert(namespace+".buyInsert", buyDTO) > 0;
	}

	@Override
	public BuyDTO getBuyInfo(String buy_code) {
		log.debug("BuyService getBuyInfo()");
		return sqlSession.selectOne(namespace+".getBuyInfo", buy_code);
	}
	
	@Override
	public boolean buyUpdate(BuyDTO buyDTO) {
		log.debug("구매처 업데이트 DAO 도달");
		
		return sqlSession.update(namespace+".buyUpdate",buyDTO) > 0;
		
	}
	
	@Override
	public boolean buyDelete(String buy_code) {
		
		log.debug("구매처 딜리트 DAO 도달");
		
		return sqlSession.delete(namespace+".buyDelete", buy_code) > 0;
	}

	
	public List<BuyDTO> buySearch(HashMap<String, Object> json) {
		
		log.debug("구매처 서치 DAO 도달");
		
		return sqlSession.selectList(namespace+".buySearch", json);
	}

	@Override
	public boolean searchEmail(String buy_email) {
		log.debug("구매처 이메일 중복 검사 DAO 도달");
		String result = sqlSession.selectOne(namespace+"searchEmail", buy_email);
		return (result == null) ? false : true;
	}

	@Override
	public boolean searchPhone(String buy_phone) {
		log.debug("구매처 번호 중복 검사 DAO 도달");
		String result = sqlSession.selectOne(namespace+"searchPhone", buy_phone);
		return (result == null) ? false : true;
	}
	
	@Override
	public List<BuyDTO> getBuyListPopUp() {
		log.debug("구매처 팝업 리스트 DAO 도달");
		return sqlSession.selectList(namespace+".getBuyListPopUp");
	}
	
	}


