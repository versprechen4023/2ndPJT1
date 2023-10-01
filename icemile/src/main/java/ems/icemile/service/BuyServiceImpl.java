package ems.icemile.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.BuyDAOImpl;
import ems.icemile.dto.BuyDTO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BuyServiceImpl implements BuyService{

	// DAO 의존성 주입
	@Inject
	private BuyDAOImpl buyDAO;
	
	@Override
	public List<BuyDTO> getBuyList(){
		
		log.debug("BuyService getBuyList()");
		
		return buyDAO.getBuyList();
		
	}

	@Override
	public void buyInsert(BuyDTO buyDTO) {
		
		log.debug("BuyService buyIntsert()");
		
		buyDTO.setBuy_code(Integer.toString(buyDAO.getBuyCode()));
		
		buyDAO.buyInsert(buyDTO);
		
	}
	
}
