package ems.icemile.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ems.icemile.dto.ProOrderDTO;
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
	public String getNewBranchCode() {
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

	@Override
	public boolean searchEmail(String branch_email) {
		log.debug("DAO| 지점 이메일 중복 검사");
		String result = sqlSession.selectOne(namespace+"searchEmail", branch_email);
		return (result == null) ? false : true;
	}

	@Override
	public boolean searchPhone(String branch_phone) {
		log.debug("DAO| 지점 번호 중복 검사");
		String result = sqlSession.selectOne(namespace+"searchPhone", branch_phone);
		return (result == null) ? false : true;
	}
	
	@Override
	public List<HashMap<String, Object>> proOrderList() {
		log.debug("DAO| 수주 리스트");
		return sqlSession.selectList(namespace+"proOrderList");
	}
	
	@Override
	public boolean proOrderInsert(ProOrderDTO proOrderDTO) {
		log.debug("DAO| 수주 등록");
		return sqlSession.insert(namespace+"proOrderInsert", proOrderDTO) > 0;
	}
	
	@Override
	public String getNewProOrderCode(String searchCode) {
		log.debug("DAO| 수주 고유 번호 얻기");
		return sqlSession.selectOne(namespace+"getNewProOrderCode", searchCode);
	}
	
	@Override
	public boolean proOrderUpdate(ProOrderDTO proOrderDTO) {
		log.debug("DAO| 수주 수정");
		return sqlSession.update(namespace+"proOrderUpdate", proOrderDTO) > 0;
	}
	
	@Override
	public boolean proOrderDelete(List<String> deleteProList) {
		log.debug("DAO| 수주 삭제");
		return sqlSession.delete(namespace+"proOrderDelete", deleteProList) > 0;
	}
	
	@Override
	public List<HashMap<String, Object>> proOrderSearch(HashMap<String, Object> json) {
		log.debug("DAO| 수주 검색");
		return sqlSession.selectList(namespace+"proOrderSearch", json);
	}
    
	@Override
	public List<ProOrderDTO> getorderList() {
		log.debug("DAO| 수주 목록");
		return sqlSession.selectList(namespace+"orderList");
	}
    
	@Override
	public List<ProOrderDTO> orderListSearch(HashMap<String, Object> json) {
		log.debug("DAO| 수주완료 도달");

		return sqlSession.selectList(namespace + "orderListSearch", json);
	}
	
	@Override
	public Integer proOrderResult(ProOrderDTO proOrderDTO) {
		
		log.debug("DAO| 수주 원자재재고 결과 검색 도달");
		
		Integer result = sqlSession.selectOne(namespace + "proOrderResult", proOrderDTO);
		
		// 연게에 문제가 있다면 null 이 반환될 것이므로 그거에 대한 예외처리
		if(result == null) {
			result = -1;
		}
		
		return result;
	}


}
