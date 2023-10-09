package ems.icemile.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ems.icemile.dto.InMaterialDTO;
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
	
	// 입고 등록
	@Override
	public void inMaterialInsert(InMaterialDTO inMaterialDTO) {
		log.debug("ShippingDAO inMaterialInsert");
		sqlSession.insert(namespace+"inMaterialInsert", inMaterialDTO);
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

}
