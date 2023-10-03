package ems.icemile.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.WareHouseDAOImpl;
import ems.icemile.dto.WareHouseDTO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class WareHouseServiceImpl implements WareHouseService {

	@Inject //DAO 의존성 주입
	private WareHouseDAOImpl wareHouseDAO;
	
	//창고 list 가져오기
	@Override
	public List<WareHouseDTO> gethouseList(){
		
		log.debug("gethouseList");
		
	    return wareHouseDAO.getHouseList();	
	}
    
	//창고 추가 선택 시 코드 가져오기
	@Override
	public String getWhCode() {
		
		return wareHouseDAO.getWhcode();
	}

	
    // 창고 추가
	@Override
	public void houseInsert(WareHouseDTO warehouseDTO) {
			
			log.debug("하우스 인서트 서비스");
			
			wareHouseDAO.houseInsert(warehouseDTO);
		}
	
   
	


}
