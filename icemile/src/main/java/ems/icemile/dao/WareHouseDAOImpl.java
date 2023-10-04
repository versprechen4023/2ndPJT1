package ems.icemile.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ems.icemile.dto.WareHouseDTO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class WareHouseDAOImpl implements WareHouseDAO {

	@Inject
	private SqlSession sqlSession;

	// 네임 스페이스 사용을 위한 변수 선언
	private static final String namespace = "mes.icemile.mappers.wareHouseMapper.";
    
	//창고 list 가져오기
	@Override
	public List<WareHouseDTO> getHouseList() {
		log.debug("getHouseList DAO");

		return sqlSession.selectList(namespace + "houseList");
	}

	
	// 창고 추가 시 code값 가져가기
	@Override
	public String getWhcode() {
		 //code변수 선언
         String code = "WH0000";
		
		if(sqlSession.selectOne(namespace+".getWhCode") == null) {
		//데이터베이스에서 창고 코드를 조회하는 쿼리를 실행한다 이떄 데이터베이스에서 창고 코드를 조회하는 쿼리를 실행한 결과를 반환한다 만약 조회 결과
		//null이면 위에서 선언한 코드를 반환한다.
			return code;
		}else {
			return sqlSession.selectOne(namespace+".getWhCode");
       	}
	}
    
	//창고 추가
	@Override
	public void houseInsert(WareHouseDTO warehouseDTO){
		log.debug("wareHousDAO houseInsert()");
		
		// 네임 스페이스에 이미 .이붙어있으므로 2번째 id값호출에서는 .을 뺴주셔야합니다
		// mes.icemile.mappers.wareHouseMapper.
		// .houseInsert에서 .을빼서 수정했습니다
		
		sqlSession.insert(namespace+"houseInsert",warehouseDTO);
	}
    
	//창고 코드 중복 검사
    @Override
	public boolean searchwhcode(String wh_code) {
		
        log.debug("searchwhcode DAO 도달");
		
		String result = sqlSession.selectOne(namespace+"searchwhcode", wh_code);
		
		// result.isEmpty()는 result가 비어 있으면 true를 반환하고,
		// 비어 있지 않으면 false를 반환합니다.
		return result.isEmpty();
	}
	
}


