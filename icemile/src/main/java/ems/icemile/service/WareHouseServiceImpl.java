package ems.icemile.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.WareHouseDAOImpl;
import ems.icemile.dto.WareHouseDTO;
import ems.icemile.dto.WareHouseinsertDTO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class WareHouseServiceImpl implements WareHouseService {

	@Inject // DAO 의존성 주입
	private WareHouseDAOImpl wareHouseDAO;

	// 창고 list 가져오기
	@Override
	public List<WareHouseDTO> gethouseList() {

		log.debug("gethouseList");

		return wareHouseDAO.getHouseList();
	}

	// 창고 추가 선택 시 코드 가져오기
	@Override
	public String getWhCode() {

		return wareHouseDAO.getWhcode();
	}

	// 창고 코드 중복 검사
	@Override
	public boolean searchwhcode(String wh_code) {

		log.debug("서치 프로 네임 서비스");

		return wareHouseDAO.searchwhcode(wh_code);
	}
    
	@Override
	//창고 수정
	public boolean whUpdate(WareHouseinsertDTO warehouseinsertDTO) {
		
        log.debug("웨어하우스 업데이트 서비스");
		
		// 원자재인지 완제품인지 구분한다
        warehouseinsertDTO.setType(warehouseinsertDTO.getWh_code().substring(7,8));
		
		return wareHouseDAO.whUpdate(warehouseinsertDTO);
		
	}
    
	@Override
	//창고 추가
	public boolean whInsert(WareHouseinsertDTO warehouseinsertDTO) {
		
		log.debug("웨어하우스 인서트 서비스");
		// 창고 번호 부여를 위한 변수 선언
		String getNum = wareHouseDAO.getNewwhId(warehouseinsertDTO);
		
		int idNum = 0;
		
		// DB에 데이터가없다면 초기값(1)이되고
		if(getNum == null) {
			idNum = 1;
		// 아니라면 +1을 더한다
		} else {
			// 주어진 코드는 Java에서 문자열에서 숫자만 추출하고, 그 숫자를 정수로 변환한 뒤 1을 더하는 코드입니다

			// getNum: 이것은 어떤 문자열에서 숫자를 추출하려는 원본 문자열입니다.

			// getNum.replaceAll("[^0-9]", ""): 이 부분은 getNum 문자열에서 숫자를 제외한 모든 문자를 빈 문자열로 대체합니다. 
			// 정규식 [0-9]는 0에서 9까지의 숫자를 의미하고 ^는 부정을 나타냅니다.
			// 따라서 이 정규식은 숫자가 아닌 모든 문자를 매칭하고 빈 문자열로 대체합니다. 결과적으로 이 부분은 숫자만을 남긴 문자열을 생성합니다.

			// Integer.parseInt(...): 이 부분은 문자열을 정수로 변환합니다. 앞서 생성된 숫자만 있는 문자열을 정수로 변환합니다.

			// +1: 변환된 정수에 1을 더합니다.
			idNum = Integer.parseInt(getNum.replaceAll("[^0-9]", ""))+1;
		}
		
		// 숫자를 4자리 문자열로 포맷팅하고, 앞에 0을 채우기
		////////////////////////////////////////////////////////////////////// 설명 
		// 주어진 코드는 idNum이라는 정수를 4자리로 포맷팅하여 문자열로 변환하는 Java 코드입니다.

        // String numStr: numStr은 문자열을 저장하기 위한 변수입니다.

        // String.format("%04d", idNum): 이 부분은 문자열 포맷을 사용하여 idNum 값을 4자리 숫자로 변환합니다.
		// 여기에서 사용된 포맷 문자열 "%04d"는 다음과 같이 해석됩니다:

        // %: 포맷 문자열의 시작을 나타냅니다.
		
        // 0: 포맷된 결과에서 빈 자리를 0으로 채우라는 지시자입니다.
		
        // 4: 최소 너비를 4자리로 설정합니다.
		
        // d: 정수 값을 나타냅니다.
        // 예를 들어, idNum이 5라면 포맷팅된 결과는 "0005"가 됩니다. 
		// idNum이 123이라면 "0123"으로 포맷됩니다.
		////////////////////////////////////////////////////////////////////// 설명 

		String numStr = String.format("%05d", idNum);

		// 고유 번호 저장
		////////////////////////////////////////////////////////////////////// 설명 
		// warehouseinsertDTO.getType(): 이 부분은 warehouseinsertDTO 객체에서 getType() 메서드를 호출하여 type 속성을 가져옵니다.
		// 이 값은 이전에 설정한 문자열 중 하나일 것으로 예상됩니다.

		// numStr: 이 부분은 이전에 생성한 numStr 문자열입니다. 이 문자열은 숫자를 4자리로 포맷한 문자열입니다.

		// warehouseinsertDTO.getType()+numStr: 이 부분은 warehouseinsertDTO 객체의 type과 numStr을 연결하여 prod_code 속성을 설정합니다.
		// getType()에서 가져온 문자열과 numStr이 합쳐져서 prod_code 값이 생성됩니다.

		// 예를 들어, getType()에서 "A"를 가져오고 numStr이 "0123"이라면, prod_code 값은 "A0123"이 됩니다.
		// 이렇게 prod_code를 설정하는 코드는 보통 데이터베이스에서 고유한 값을 가진 열에 대한 값을 생성할 때 사용됩니다.
		warehouseinsertDTO.setWh_code("WH"+numStr+warehouseinsertDTO.getType());
		
		//값을 한번다 호출해 본다.
		log.debug("프로덕트 테스트 출력" + warehouseinsertDTO.toString());
		
		return wareHouseDAO.whInsert(warehouseinsertDTO);	
	}

	
    
	

}
