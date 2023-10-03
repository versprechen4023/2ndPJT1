package ems.icemile.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.ShippingDAOImpl;
import ems.icemile.dto.InMaterialDTO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ShippingServiceImpl implements ShippingService {
	
	@Inject
	private ShippingDAOImpl shippingDAO;
	
	// 입고 리스트
	@Override
	public List<InMaterialDTO> getInMaterialList() {
		log.debug("ShippingService getInMaterialList()");
		return shippingDAO.getInMaterialList();
	}// getInMaterialList
	
	// 입고 삭제
	@Override
	public void deleteInMaterial(InMaterialDTO inMaterialDTO) {
		log.debug("ShippingService deleteInMaterial");
		shippingDAO.deleteInMaterial(inMaterialDTO);
	}// deleteInMaterial
	
	// 입고 등록
	@Override
	public void inMaterialInsert(InMaterialDTO inMaterialDTO) {
		log.debug("ShippingService inMaterialInsert");
		shippingDAO.inMaterialInsert(inMaterialDTO);		
	} // inMaterialInsert
	
	// 입고 수정 페이지 in_code 값 받아서
	@Override
	public InMaterialDTO getInMaterial(String in_code) {
		log.debug("ShippingService getInMaterial");
		return shippingDAO.getInMaterial(in_code);
	}
	
	//입고 수정
	@Override
	public void updateInMaterial(InMaterialDTO inMaterialDTO) {
		log.debug("ShippingService updateInMaterial");
		shippingDAO.updateInMaterial(inMaterialDTO);
	}

}
