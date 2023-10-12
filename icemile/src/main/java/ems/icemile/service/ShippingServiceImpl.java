package ems.icemile.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.ShippingDAOImpl;
import ems.icemile.dto.InMaterialDTO;
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
	public boolean inMaterialInsert(InMaterialDTO inMaterialDTO) {
		log.debug("ShippingService inMaterialInsert");
		inMaterialDTO.setIn_status(1);
		
		// 코드 자동 부여 
		// buy_code(거래처코드) 들고오기
		String buy_code=inMaterialDTO.getBuy_code();
		log.debug("buy값은 {} ",buy_code);
		
		String buy_codeNum = buy_code.replaceAll("[^0-9]", "");
		String trBuy_codeNum = buy_codeNum.replaceFirst("^0+(?!$)", "");
		
		inMaterialDTO.setTrBuy_codeNum(trBuy_codeNum);
		
		log.debug("trBuy_codeNum : "+inMaterialDTO);
		
		String getNum=shippingDAO.getNewIn_code(inMaterialDTO);
		
		log.debug(getNum);
		
		int codeNum = 0;
		if(getNum==null) {
			codeNum = 1;
		}else {
			log.debug("실행됨");
//			codeNum = Integer.parseInt(getNum.replaceAll("[^0-9]", ""))+1;
			String[] parts = getNum.split("_");
			String lastPart = parts[parts.length-1];
			codeNum=Integer.parseInt(lastPart);
			codeNum++;
		}
		
		String numStr = String.format("%04d", codeNum);
		
		// 현재 날짜 가져오기
		LocalDate currentDate = LocalDate.now();
		
		// 원하는 날짜 포맷 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");
		
		// 날짜를 문자열로
		String formattedDate = currentDate.format(formatter);
		
		// 문자열을 숫자로
		int dateNum = Integer.parseInt(formattedDate);
		
		String in_code = "IN"+dateNum+"_"+inMaterialDTO.getTrBuy_codeNum()+"_"+numStr;
		inMaterialDTO.setIn_code(in_code);
		log.debug("{}값은: ",in_code);
		
		return shippingDAO.inMaterialInsert(inMaterialDTO);
	} // inMaterialInsert

	// 입고 수정 페이지 in_code 값 받아서
	@Override
	public InMaterialDTO getInMaterial(String in_code) {
		log.debug("ShippingService getInMaterial");
		return shippingDAO.getInMaterial(in_code);
	}

	// 입고 수정
	@Override
	public void updateInMaterial(InMaterialDTO inMaterialDTO) {
		log.debug("ShippingService updateInMaterial");
		shippingDAO.updateInMaterial(inMaterialDTO);
	}
	
	// 입고 검색
	@Override
	public List<InMaterialDTO> inMateSearch(HashMap<String, Object> json) {
		log.debug("ShippingService inMateSearch");
		return shippingDAO.inMateSearch(json);
	}

	
	//////////////////////////////////////////// 출고
	//////////////////////////////////////////// ////////////////////////////////////////////////////////////

	// outMaterial List 가져오기
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
	// 출고 수정
	public boolean mtUpdate(outMaterialInsertDTO outmaterialInsertDTO) {

		log.debug("출고 업데이트 서비스");

		// 지점코드 분류
		outmaterialInsertDTO.setBranch(outmaterialInsertDTO.getOut_code().substring(10, 11));

		return shippingDAO.mtUpdate(outmaterialInsertDTO);
	}

	@Override
	// 출고 추가
	public boolean mtInsert(outMaterialInsertDTO outmaterialInsertDTO) {

		log.debug("출고 인서트 서비스");

		// 현재 코드에서 branch 값을 가져오고
		String branch = outmaterialInsertDTO.getBranch();

		// "BR" 부분을 제외하고 뒤의 숫자 부분만 추출
		// 설명
		// branchNumber 문자열에서 0의 값을 제외하고 숫자 부분만 추출하는 부분은 정규 표현식을 사용하고 있습니다.

		// 여기서 사용된 정규 표현식은 다음과 같습니다: "^0+(?!$)"

		// ^ : 문자열의 시작을 나타냅니다.
		// 0+ : 하나 이상의 0을 나타냅니다. 즉, 0이 하나 이상 연속되는 부분을 의미합니다.
		// (?!$) : 부정적 전방 탐색(lookahead)입니다. 이 부분은 문자열의 끝($)이 아닌 부분을 찾는 것을 의미합니다.
		// 즉, 이 정규 표현식은 문자열의 시작부터 0이 하나 이상 연속되는 부분을 찾되, 문자열의 끝이 아닌 경우에만 해당 부분을 선택합니다.
		// 따라서 이를 통해 0의 값을 제외한 숫자 부분만 추출할 수 있습니다.

		// 예를 들어, "BR0003"이라는 문자열이 주어진다면,
		// 이 정규 표현식은 "0003"에서 0을 제외한 "3"을 추출하게 됩니다. 결과적으로 trimmedBranchNumber 변수에는 "3"이
		// 저장됩니다.
		String branchNumber = branch.replaceAll("[^0-9]", "");

		// 0의 값을 제외하고 숫자 부분만 추출
		// 설명
		// replaceFirst:이 메서드는 문자열에서 특정 패턴을 찾아 해당 패턴을 새로운 문자열로 대체하는 역할을 합니다.
		// 그러나 replaceFirst는 첫 번째로 일치하는 패턴만 대체하고, 나머지는 변경하지 않습니다.
		// branchNumber 문자열에서 0의 값을 제외하고 숫자 부분만 추출하는 부분은 정규 표현식을 사용하고 있습니다.

		// 여기서 사용된 정규 표현식은 다음과 같습니다: "^0+(?!$)"

		// ^ : 문자열의 시작을 나타냅니다.
		// 0+ : 하나 이상의 0을 나타냅니다. 즉, 0이 하나 이상 연속되는 부분을 의미합니다.
		// (?!$) : 부정적 전방 탐색(lookahead)입니다. 이 부분은 문자열의 끝($)이 아닌 부분을 찾는 것을 의미합니다.
		// 즉, 이 정규 표현식은 문자열의 시작부터 0이 하나 이상 연속되는 부분을 찾되, 문자열의 끝이 아닌 경우에만 해당 부분을 선택합니다.
		// 따라서 이를 통해 0의 값을 제외한 숫자 부분만 추출할 수 있습니다.

		// 예를 들어, "BR0003"이라는 문자열이 주어진다면,
		// 이 정규 표현식은 "0003"에서 0을 제외한 "3"을 추출하게 됩니다. 결과적으로 trimmedBranchNumber 변수에는 "3"이
		// 저장됩니다.
		String trBranchNumber = branchNumber.replaceFirst("^0+(?!$)", "");
		
		// trBranchNumber 값을 outmaterialInsertDTO 객체의 필드에 설정
		outmaterialInsertDTO.setTrBranchNumber(trBranchNumber);
		
		log.debug("trBranchNumber: " + outmaterialInsertDTO);

		String getNum = shippingDAO.getNewmtId(outmaterialInsertDTO);
       
		log.debug(getNum);

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

		// 출고 코드에서 이게 지점으로 보내는건 맞는데 이게 한지점에서 한개만 출고 될리 없으므로 뒤에 출고 번호를 넣어서 출고 번호도 넣을 필요가
		// 있을거 같아서
		// numstr을 통해서 출고 번호를 나타낼수 있게 해보았다.
		String out_Code = "OUT" + dateNum + "_" + outmaterialInsertDTO.getTrBranchNumber() + "_" + numStr;
		outmaterialInsertDTO.setOut_code(out_Code);

		log.debug("출고 테스트 출력" + outmaterialInsertDTO.toString());

		return shippingDAO.mtInsert(outmaterialInsertDTO);
	}

	@Override
	// 출고 삭제
	public boolean mtDelete(List<Map<String, String>> codeAndBranchList) {
		log.debug("웨어하우스 딜리트 서비스");

		return shippingDAO.mtDelete(codeAndBranchList);
	}

	@Override
	// 출고 검색
	public List<outMaterialDTO> mtSearch(HashMap<String, Object> json) {

		log.debug("출고 서치 서비스");

		return shippingDAO.mtSearch(json);

	}

}
