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
	// 원자재명
	private String raw_name;
	// 발주량
	private int raw_order_amount;
	// 입고량
	private int in_amount;
	// 입고 담당자
	private String emp_num;
	// 입고 현황
	private int in_status;
	// 수정일
//	private String updatedate;
	// 매입처코드
	private String buy_code;
	// 매입처명
	private String buy_name;
	// 매입처코드를 따와서 입고코드를 자동 부여하기 위해 숫자만 남겨놓기 위함
	private String trBuy_codeNum;
	
}
