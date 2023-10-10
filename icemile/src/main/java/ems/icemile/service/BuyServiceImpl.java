package ems.icemile.service;

import java.util.HashMap;
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
		
		String getCode = buyDAO.getBuyCode();
		
		int codeNum = 0;
		
		// DB에 데이터가 없다면 초기값 1 이 되고
		if (getCode == null) {
			codeNum = 1;
		
		// 그것이 아니면 +1을 한다.
		}else {
			codeNum = Integer.parseInt(getCode.replaceAll("[^0-9]", ""))+1;
		}
		
		// 구매처 코드 부여
		buyDTO.setBuy_code(Integer.toString(codeNum));
		
//		buyDTO.setBuy_code(Integer.toString(buyDAO.getBuyCode()));
//		
		buyDAO.buyInsert(buyDTO);
		
	}

	@Override
	public BuyDTO getBuyInfo(String buy_code) {
		
		log.debug("구매처 정보 가져오기 서비스");
		
		return buyDAO.getBuyInfo(buy_code);
	}
	
	@Override
	public boolean buyUpdate(BuyDTO buyDTO) {
		
		log.debug("구매처 업데이트 서비스");
		
		return buyDAO.buyUpdate(buyDTO);
	}
	
	@Override
	public boolean buyDelete(String buy_code) {
	
		log.debug("구매처 딜리트 서비스");
		
		return buyDAO.buyDelete(buy_code);
	}


	@Override
	public List<BuyDTO> buySearch(HashMap<String, Object> json) {
		
		log.debug("구매처 검색 서비스");
		
		return buyDAO.buySearch(json);
	}

	@Override
	public boolean searchEmail(String buy_email) {
		log.debug("구매처 이메일 중복 검사 서비스");
		return buyDAO.searchEmail(buy_email);
	}

	@Override
	public boolean searchPhone(String buy_phone) {
		log.debug("구매처 번호 중복 검사 서비스");
		return buyDAO.searchPhone(buy_phone);
	}
	
	
	
}
