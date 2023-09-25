package ems.icemile.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.MemberDAOImpl;
import ems.icemile.dao.SellDAOImpl;
import ems.icemile.dto.MemberDTO;
import ems.icemile.dto.SellDTO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SellServiceImpl implements SellService{

	@Inject //DAO 의존성 주입
	private SellDAOImpl sellDAO;
	
	@Override
	public boolean branchInsert(SellDTO sellDTO){
		
		log.debug("지점 인서트");
		// 주소 API 가져오
		
		return sellDAO.branchInsert(sellDTO);
	}
}
