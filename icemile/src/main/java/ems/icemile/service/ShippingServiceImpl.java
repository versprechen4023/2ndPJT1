package ems.icemile.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.ShippingDAOImpl;
import ems.icemile.dto.outMaterialDTO;
import ems.icemile.dto.outMaterialInsertDTO;
import lombok.extern.slf4j.Slf4j;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Service
@Slf4j
public class ShippingServiceImpl implements ShippingService {
	
	@Inject
	private ShippingDAOImpl shippingDAO;
	
	
	//outMaterial List 가져오기
	@Override
	public List<outMaterialDTO> getoutMaterialList() {
		
		log.debug("getoutMaterialList");
		
		return shippingDAO.getoutMaterialList();
	}

    // 출고 코드 중복검사
	@Override
	public boolean searchOutCode(String out_code) {
		
		log.debug("searchOutCode");
		
		return shippingDAO.searchOutCode(out_code);
	}
    
	@Override
	//출고 수정 
	public boolean mtUpdate(outMaterialInsertDTO outmaterialInsertDTO) {
		
		log.debug("출고 업데이트 서비스");

		//지점코드 분류
		outmaterialInsertDTO.setBranch(outmaterialInsertDTO.getOut_code().substring(10,11));

		return shippingDAO.mtUpdate(outmaterialInsertDTO);
	}
	
    @Override
	//출고 추가 
	public boolean mtInsert(outMaterialInsertDTO outmaterialInsertDTO) {
	   
		log.debug("출고 인서트 서비스");
	    
		
		String getNum = shippingDAO.getNewmtId(outmaterialInsertDTO);

		int idNum = 0;
		
		if (getNum == null) {
			
			idNum = 1;
			
		} else {
			
//		   idNum = Integer.parseInt(getNum.replaceAll("[^0-9]", "")) + 1;
		   String[] parts = getNum.split("_"); // '_'를 구분자로 문자열을 나눕니다
		   String lastPart = parts[parts.length - 1]; // 마지막 부분을 가져옵니다

		   idNum = Integer.parseInt(lastPart); // 문자열을 정수로 변환합니다
		   idNum++; // 1을 더합니다
		   
		}
        
		String numStr = String.format("%04d", idNum);
		
		// 현재 날짜를 가져옵니다.
	    LocalDate currentDate = LocalDate.now();

	    // 원하는 날짜 포맷을 정의합니다. (예: "yyMMdd")
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");

	    // 날짜를 포맷에 맞게 문자열로 변환합니다.
	    String formattedDate = currentDate.format(formatter);

	    // 문자열을 숫자로 변환합니다.
	    int dateNum = Integer.parseInt(formattedDate);
        
	    // 출고 코드에서 이게 지점으로 보내는건 맞는데 이게 한지점에서 한개만 출고 될리 없으므로 뒤에 출고 번호를 넣어서 출고 번호도 넣을 필요가 있을거 같아서
	    // numstr을 통해서 출고 번호를 나타낼수 있게 해보았다.
	    String out_Code = "OUT" + dateNum + "_" + outmaterialInsertDTO.getBranch() + "_" + numStr;
	    outmaterialInsertDTO.setOut_code(out_Code);

	    log.debug("출고 테스트 출력" + outmaterialInsertDTO.toString());
				
		return shippingDAO.mtInsert(outmaterialInsertDTO);
	}
    
    @Override
   	//출고 삭제
	public boolean mtDelete(List<Map<String, String>> codeAndBranchList) {
    	log.debug("웨어하우스 딜리트 서비스");

		return shippingDAO.mtDelete(codeAndBranchList);
	}
     
    @Override
    //출고 검색
	public List<outMaterialDTO> mtSearch(HashMap<String, Object> json) {
		
		log.debug("출고 서치 서비스");

		return shippingDAO.mtSearch(json);
		
	}
	
	

}
