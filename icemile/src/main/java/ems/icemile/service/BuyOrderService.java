package ems.icemile.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.BuyOrderDAO;
import ems.icemile.dto.RawOrderDTO;
import ems.icemile.dto.RowOrderListDTO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BuyOrderService {
	
	@Inject // DAO 의존성 주입
	private BuyOrderDAO buyOrderDAO;
	
	public boolean rawOrderInsert(RawOrderDTO rawOrderDTO) {
		
		log.debug("rawOrderInsert 서비스");
		
		// 고유 번호를 위한 번호 얻기
		String getCode = buyOrderDAO.getNewRawOrderCode();
		
		int codeNum = 0;
		
		// DB에 데이터가없다면 초기값(1)이되고
		if(getCode == null) {
			codeNum = 1;
		// 아니라면 +1을 더한다
		} else {
			codeNum = Integer.parseInt(getCode.replaceAll(".+_", ""))+1;
		}
		
		// 고유번호를 위한 날짜 재조정
		String myDate = rawOrderDTO.getRaw_order_date().substring(2).replace("-", "");
				
		// 고유번호를 설정
		rawOrderDTO.setRaw_order_code("OB"+myDate+"_"+codeNum);
		log.debug("코드값 확인 {}", rawOrderDTO.getRaw_order_code());
		
		// 상태를 발주중으로 설정
		rawOrderDTO.setRaw_status(1);
		
		return buyOrderDAO.rawOrderInsert(rawOrderDTO);
		
	}

	public List<RowOrderListDTO> getRawOrderList() {
		
		log.debug("getRawOrderList 서비스");
		
		return buyOrderDAO.getRawOrderList();
	}

	public boolean rawOrderDelete(List<String> deleteRawList) {
		
		log.debug("rawOrderDelete 서비스");
		
		return buyOrderDAO.rawOrderDelete(deleteRawList);
	}

	public boolean rawOrderUpdate(RawOrderDTO rawOrderDTO) {
		
		log.debug("rawOrderDelete 서비스");
		
		return buyOrderDAO.rawOrderUpdate(rawOrderDTO);
	}

	public List<RowOrderListDTO> rawOrderSearch(HashMap<String, Object> json) {
		
		log.debug("rawOrderSearch 서비스");
		
		return buyOrderDAO.rawOrderSearch(json);
	}

}
