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

	@Override
	public BuyDTO getBuyInfo(String buy_code) {
		
		log.debug("겟 바이 인포 서비스");
		
		return buyDAO.getBuyInfo(buy_code);
	}
	
	@Override
	public void buyUpdate(BuyDTO buyDTO) {
		
		log.debug("겟 바이 업데이트 서비스");
		
		buyDAO.buyUpdate(buyDTO);
	}

	public boolean buyDelete(String buy_code) {
	
		log.debug("바이 딜리트 서비스");
		
		return buyDAO.buyDelete(buy_code);
	}
	
	
	
}
