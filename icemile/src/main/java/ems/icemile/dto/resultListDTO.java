package ems.icemile.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class resultListDTO {
	
	// 실적 코드
	private String result_code;
	// 완료 작업 목록
	private String ok_work_list;
	// 작업 지시 코드
	private String work_code;
	// 라인 코드
	private String line_code;
	// 품목 코드
	private String prod_code;
	// 양품
	private String good_prod;
	// 불량
	private String faulty_prod;
	// 불량 사유
	private String faulty_reason;
	// 비고
	private String remark;

	
}
