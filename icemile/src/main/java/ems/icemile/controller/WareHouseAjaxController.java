package ems.icemile.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ems.icemile.dto.ProductAllDTO;
import ems.icemile.dto.ProductInsertDTO;
import ems.icemile.dto.WareHouseDTO;
import ems.icemile.dto.WareHouseinsertDTO;
import ems.icemile.service.WareHouseServiceImpl;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/warehouse_ajax/*")
public class WareHouseAjaxController {

	@Inject // 웨어하우스 서비스 의존성 주입
	private WareHouseServiceImpl wareHouseService;

	@GetMapping("searchWhcode")
	// 이 부분은 Spring Framework에서 사용되는 어노테이션입니다.
	// Ajax 요청에서 "wh_code"이라는 파라미터를 받아서 이 메서드의 wh_code 매개변수에 할당합니다.
	public boolean searchProName(@RequestParam("wh_code") String wh_code) {

		log.debug("서치 웨어하우스 코드 AJAX 호출");

		return wareHouseService.searchwhcode(wh_code);
	}

	@PostMapping("/whUpdate")
	public String warehouseUpdate(WareHouseinsertDTO warehouseinsertDTO) {

		log.debug("값 잘 넘어오나" + warehouseinsertDTO);

		return Boolean.toString(wareHouseService.whUpdate(warehouseinsertDTO));
	}

	@PostMapping("/whInsert")
	public String warehouseInsert(WareHouseinsertDTO warehouseinsertDTO) {

		log.debug("값 잘 넘어오나" + warehouseinsertDTO);

		return Boolean.toString(wareHouseService.whInsert(warehouseinsertDTO));
	}

	@PostMapping("/whDelete")
	// @RequestParam을 사용하면, 클라이언트에서 서버로 전송한 데이터 중에서 원하는 값을 추출할 수 있습니다.
	public String warehouseDelete(@RequestParam("selectedProId") String[] selectedProId) {
		// 다중 삭제를 위한 스트 형식의 맵 타입 배열 변수선언

		// 설명
		// 이 코드는 Java에서 사용되는 `List`와 `Map`을 활용한 데이터 구조를 정의하는 예제입니다. 이 코드를 설명해보겠습니다.

		// 1. `List<Map<String, String>> codeAndTypeList = new ArrayList<>();` 라인은 다음과
		// 같은 작업을 수행합니다.

		// `List<Map<String, String>>`: 이 부분은 `List`라는 데이터 구조를 정의합니다.
		// `List`는 여러 항목을 저장하고 순서대로 관리하는 컬렉션(데이터 구조)입니다.
		// 이 `List`에는 `Map` 객체들을 저장할 것이며, 각 `Map` 객체는 문자열 키와 문자열 값으로 이루어진 데이터를 저장합니다.

		// `codeAndTypeList`: 이 변수는 위에서 정의한 `List` 타입의 데이터 구조를 참조하는 변수입니다.
		// 즉, `List<Map<String, String>>` 형태의 데이터를 저장할 수 있는 리스트입니다.

		// `= new ArrayList<>();`: `codeAndTypeList` 변수를 `ArrayList` 객체로 초기화합니다.
		// `ArrayList`는 `List` 인터페이스를 구현한 클래스 중 하나로, 동적으로 크기가 조절되는 배열처럼 동작합니다.
		// 이렇게 초기화된 `codeAndTypeList`는 비어 있는 리스트입니다.

		// 따라서, `codeAndTypeList`는 문자열 키와 값의 쌍을 가진 여러 데이터를 저장할 수 있는 리스트입니다. 예를 들어, 다음과
		// 같이 데이터를 추가할 수 있습니다:

		// ```java
		// Map<String, String> data1 = new HashMap<>();
		// data1.put("code", "001");
		// data1.put("type", "A");

		// Map<String, String> data2 = new HashMap<>();
		// data2.put("code", "002");
		// data2.put("type", "B");

		// codeAndTypeList.add(data1);
		// codeAndTypeList.add(data2);
		// ```

		// 위 코드를 실행하면 `codeAndTypeList`에는 두 개의 `Map` 객체가 포함되며,
		// 각 `Map` 객체는 "code"와 "type" 키를 가진 데이터를 저장하고 있습니다.
		// 이런 식으로 데이터를 유연하게 저장하고 관리할 수 있습니다.

		// 여기서 map을 사용한 이유가 뭔가?

		List<Map<String, String>> codeAndTypeList = new ArrayList<>();

		// DB에서 원자재와 완제품을 구분하기위해 맵형태 배열에 키값을 추가하고 조건문에 들어갈 품목번호를 입력한다

		// 설명 //
		// 이 코드는 선택된 품목 번호(`selectedProId`)를 기반으로 맵 형태의 배열(`codeAndTypeList`)을 생성하는 작업을
		// 수행합니다.
		// 각 맵은 "code"와 "type" 두 가지 키-값 쌍을 가집니다.
		// "code" 키에는 품목 번호가 할당되고, "type" 키에는 해당 품목의 종류를 나타내는 코드가 할당됩니다.

		// 여기서 코드를 단계별로 설명하겠습니다:

		// 1. `for (String a : selectedProId)` 루프: `selectedProId`라는 문자열 배열에서 각 품목
		// 번호(`a`)를 반복적으로 가져옵니다.

		// 2. `Map<String, String> codeAndType = new HashMap<>();`: 각 품목 번호에 대한 맵
		// 객체(`codeAndType`)를 생성합니다.
		// 이 맵은 문자열 키와 값으로 이루어져 있습니다.

		// 3. `codeAndType.put("code", a);`: "code" 키에 현재 품목 번호(`a`)를 할당합니다. 이것은 품목 번호를
		// 나타내는 역할을 합니다.

		// 4. `codeAndType.put("type", a.substring(0,1));`: "type" 키에는 현재 품목 번호의 첫 번째
		// 문자(`a.substring(0,1)`)를 할당합니다.
		// 이 부분은 품목의 종류를 나타내는 코드를 생성하는 역할을 합니다. 예를 들어, "R0001"의 경우 "R"로 원자재를 나타내고,
		// "F0001"의 경우 "F"로 완제품을 나타냅니다.

		// 5. `codeAndTypeList.add(codeAndType);`: 생성된 맵 객체(`codeAndType`)를 맵
		// 배열(`codeAndTypeList`)에 추가합니다.
		// 이렇게 하면 각 품목 번호와 해당 품목의 종류가 포함된 데이터가 리스트에 저장됩니다.

		// 이 코드를 실행하면 `codeAndTypeList`에 여러 품목에 대한 정보가 포함된 맵들이 저장됩니다.
		// 각 맵은 "code"와 "type" 키를 가지며, "code"는 품목 번호를, "type"은 품목의 종류를 나타냅니다.
		// 이렇게 데이터를 구조화하여 저장하면 나중에 데이터를 검색하고 분석하는 데 유용합니다.

		for (String a : selectedProId) {

			// 맵 타입 배열 객체생성
			Map<String, String> codeAndType = new HashMap<>();

			// 품목번호를 삽입한다
			codeAndType.put("code", a);
			// 원자재와 완제품을 구분하기위한 코드를 삽입한다 = R0001 = R(원자재)
			codeAndType.put("type", a.substring(7, 8));
			// 리스트 배열에 맵 배열을 삽입한다
			codeAndTypeList.add(codeAndType);
		}
		// Boolean.toString
		// Boolean을 문자열로 변환하는것
		return Boolean.toString(wareHouseService.whDelete(codeAndTypeList));
	}

	@PostMapping("search")
	public List<WareHouseDTO> whSearch(@RequestBody HashMap<String, Object> json) {

     // `@PostMapping("search")`: 이 메서드는 `/search` 엔드포인트에 대한 POST 요청을 처리합니다.
		
     // `public List<WareHouseDTO> whSearch(@RequestBody HashMap<String, Object> json)` 

     // `@RequestBody`: 이 어노테이션은 HTTP 요청의 본문(body)에 있는 데이터를 읽어서 메서드의 매개변수 `json`에 매핑합니다.
     //  즉, 클라이언트가 보낸 JSON 데이터가 이 메서드의 `json` 매개변수에 자동으로 매핑됩니다.

     // `HashMap<String, Object> json`: 이 매개변수는 클라이언트가 POST 요청 본문에 담아 보낸 JSON 데이터를 자바 객체로 변환하기 위한 용도로 사용됩니다.
     //  JSON 데이터는 키-값 형식으로 구성되며, 이를 자바에서 처리하기 위해 `HashMap`을 사용하고, 값의 형식을 `Object`로 지정했습니다.

     // 메서드 내용: 이 메서드는 받은 JSON 데이터를 처리하는 로직을 구현해야 합니다.
	 // 코드 내용은 주어진 코드 스니펫에서는 생략되어 있습니다.
	 // 클라이언트가 보낸 JSON 데이터를 활용하여 원하는 작업을 수행한 후, 그 결과로 `List<WareHouseDTO>` 형태의 데이터를 반환합니다. 
	 // 반환된 데이터는 클라이언트에게 응답으로 전송됩니다.

     // 이 메서드는 클라이언트의 요청을 받아 JSON 데이터를 처리하고,
	 // 처리 결과를 JSON 형태로 응답하는 컨트롤러 역할을 합니다.
	 // 클라이언트로부터 받은 JSON 데이터를 활용하여 필요한 비즈니스 로직을 수행하고, 그 결과를 클라이언트에게 반환하는 데 사용됩니다.

		log.debug("프로덕트 서치 AJAX 호출");

		// 물품리스트를 가져오기위한 물품리스트 객체생성
		List<WareHouseDTO> warehouseList = new ArrayList<WareHouseDTO>();
		// 결과값에 따라 물품 리스트를 가져온다
		warehouseList = wareHouseService.whSearch(json);

		// 콜백 함수에 결과값 리턴
		return warehouseList;
	}

}
