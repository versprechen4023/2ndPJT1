package ems.icemile.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InMaterialDTO {
	
	// 입고 코드
	private String in_code;
	// 입고 창고 코드
	private String in_wh_code;
	// 발주 코드
	private String raw_order_code;
	// 입고 담당자
	private String emp_num;
	// 입고 현황
	private String in_status;
	// 수정일
//	private String updatedate;
	
}