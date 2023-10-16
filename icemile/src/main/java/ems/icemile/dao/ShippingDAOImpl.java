package ems.icemile.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import ems.icemile.dto.InMaterialDTO;
import ems.icemile.dto.MemberDTO;
import ems.icemile.dto.ProOrderDTO;
import ems.icemile.dto.WareHouseDTO;
import ems.icemile.dto.WorkOrderDTO;
import ems.icemile.dto.outMaterialDTO;
import ems.icemile.dto.outMaterialInsertDTO;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ShippingDAOImpl implements ShippingDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Inject
	private static final String namespace = "mes.icemile.mappers.inMaterialMapper.";
	
	// 입고 리스트
	@Override
	public List<InMaterialDTO> getInMaterialList(){
		log.debug("ShippingDAO getInMaterialList");
		return sqlSession.selectList(namespace+"getInMaterialList");
	}// getInMaterialList()
	 
	// 입고 목록 삭제
	@Override
	public void deleteInMaterial(InMaterialDTO inMaterialDTO) {
		log.debug("ShippingDAO deleteInMaterial");
		sqlSession.delete(namespace+"deleteInMaterial", inMaterialDTO);
	}// deleteInMaterial
	
	// 입고코드 자동등록
	@Override
	public String getNewIn_code(InMaterialDTO inMaterialDTO) {
		return sqlSession.selectOne(namespace+"getNewIn_code", inMaterialDTO);
	}
	
//	@Override
//	public String getBuy_code() {
//		return sqlSession.selectOne(namespace+"getBuy_code");
//	}
	
	// 입고 등록
	@Override
	public boolean inMaterialInsert(InMaterialDTO inMaterialDTO) {
		log.debug("ShippingDAO inMaterialInsert");
		return sqlSession.insert(namespace+"inMaterialInsert", inMaterialDTO) >0;
	}// inMaterialInsert
	
	// in_code 값 받아서
	@Override
	public InMaterialDTO getInMaterial(String in_code) {
		log.debug("ShippingDAO getInMaterial");
		return sqlSession.selectOne(namespace+"getInMaterial",in_code);
	}
	
	// 입고 수정
	@Override
	public void updateInMaterial(InMaterialDTO inMaterialDTO) {
		log.debug("ShippingDAO updateInMaterial");
		sqlSession.update(namespace+"updateInMaterial", inMaterialDTO);
	}
	
	// 입고 검색
	@Override
	public List<InMaterialDTO> inMateSearch(HashMap<String, Object> json) {
		log.debug("ShippingDAO inMateSearch");
		return sqlSession.selectList(namespace+"inMateSearch", json);
	}
	
	@Override
	public String getBuy_code(InMaterialDTO inMaterialDTO) {
		
		return sqlSession.selectOne(namespace+"getBuy_code", inMaterialDTO);
	}

////////////////////////////////////////////출고 ////////////////////////////////////////////////////////////
	
	// 네임 스페이스 사용을 위한 변수 선언
	private static final String namespace2 = "mes.icemile.mappers.outMaterialMapper.";
	
    //출고 리스트 가져오기
	@Override
	public List<outMaterialDTO> getoutMaterialList(){
		
		log.debug("getoutMaterialList DAO");

		return sqlSession.selectList(namespace2 + "outMaterialList");
		
	}
    
    // 출고 코드 중복검사
	@Override
	public boolean searchOutCode(String out_code) {
		
		log.debug("searchOutCode DAO");
		
		return sqlSession.selectOne(namespace2 + "searchOutCode");
		
	}
    
	@Override
	//출고 수정
	public boolean mtUpdate(outMaterialInsertDTO outmaterialInsertDTO) {
		log.debug("mtUpdate DAO 도달");

		// >0; 한행이라도 업데이트가 되었는가를 말하는 것이다.
		return sqlSession.update(namespace2 + "mtUpdate", outmaterialInsertDTO) > 0;
	}
	
	@Override
	//출고 코드 자동 부여 
	public String getNewmtId(outMaterialInsertDTO outmaterialInsertDTO) {
		log.debug("getNewmtId DAO 도달");

		return sqlSession.selectOne(namespace2 + "getNewmtId", outmaterialInsertDTO);
	}
     
	@Override
	//출고 추가
	public boolean mtInsert(outMaterialInsertDTO outmaterialInsertDTO) {
		log.debug("mtInsert DAO 도달");

		return sqlSession.insert(namespace2 + "mtInsert",outmaterialInsertDTO ) > 0;
	}
    
	@Override
	//출고 삭제
	public boolean mtDelete(List<Map<String, String>> codeAndBranchList) {
		log.debug("mtDelete DAO 도달");

		return sqlSession.delete(namespace2 + "mtDelete", codeAndBranchList ) > 0;
	}
    
	@Override
	//출고 검색 
	public List<outMaterialDTO> mtSearch(HashMap<String, Object> json) {
		log.debug("mtSearch DAO 도달");

		return sqlSession.selectList(namespace2 + "mtSearch", json);		
	}
    
	//modal
	@Override	
	public WareHouseDTO searchModalwh(String wh_code) {
		log.debug("searchModalwh DAO 도달");

		return sqlSession.selectOne(namespace2 + "searchModalwh", wh_code);

	}
    
	//OSmodal
    @Override
	public ProOrderDTO searchOSModal(String order_code) {
    	log.debug("searchOSModal DAO 도달");

		return sqlSession.selectOne(namespace2 + "searchOSModal", order_code );
    	
	}
    
    //EPmodal
    @Override
	public MemberDTO searchEPModal(String emp_num) {
    	log.debug("searchOSModal DAO 도달");

		return sqlSession.selectOne(namespace2 + "searchEPModal", emp_num );
    	
	}
	

}
