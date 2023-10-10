package ems.icemile.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ems.icemile.dto.outMaterialDTO;
import ems.icemile.dto.outMaterialInsertDTO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ShippingDAOImpl implements ShippingDAO {
	
	@Inject
	private SqlSession sqlSession;

	// 네임 스페이스 사용을 위한 변수 선언
	private static final String namespace = "mes.icemile.mappers.outMaterialMapper.";
	
    //출고 리스트 가져오기
	@Override
	public List<outMaterialDTO> getoutMaterialList(){
		
		log.debug("getoutMaterialList DAO");

		return sqlSession.selectList(namespace + "outMaterialList");
		
	}
    
    // 출고 코드 중복검사
	@Override
	public boolean searchOutCode(String out_code) {
		
		log.debug("searchOutCode DAO");
		
		return sqlSession.selectOne(namespace + "searchOutCode");
		
	}
    
	@Override
	//출고 수정
	public boolean mtUpdate(outMaterialInsertDTO outmaterialInsertDTO) {
		log.debug("mtUpdate DAO 도달");

		// >0; 한행이라도 업데이트가 되었는가를 말하는 것이다.
		return sqlSession.update(namespace + "mtUpdate", outmaterialInsertDTO) > 0;
	}
	
	@Override
	//출고 코드 자동 부여 
	public String getNewmtId(outMaterialInsertDTO outmaterialInsertDTO) {
		log.debug("getNewmtId DAO 도달");

		return sqlSession.selectOne(namespace + "getNewmtId", outmaterialInsertDTO);
	}
     
	@Override
	//출고 추가
	public boolean mtInsert(outMaterialInsertDTO outmaterialInsertDTO) {
		log.debug("mtInsert DAO 도달");

		return sqlSession.insert(namespace + "mtInsert",outmaterialInsertDTO ) > 0;
	}
    
	@Override
	//출고 삭제
	public boolean mtDelete(List<Map<String, String>> codeAndBranchList) {
		log.debug("mtDelete DAO 도달");

		return sqlSession.delete(namespace + "mtDelete", codeAndBranchList ) > 0;
	}
    
	@Override
	//출고 검색 
	public List<outMaterialDTO> mtSearch(HashMap<String, Object> json) {
		log.debug("mtSearch DAO 도달");

		return sqlSession.selectList(namespace + "mtSearch", json);		
	}
	
	

}
