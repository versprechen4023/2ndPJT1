package ems.icemile.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RawOrderDTO {
	
	// 발주코드
	private String raw_order_code;
	// 발주처
	private String buy_name;
	// 제품명
	private String raw_name;
	// 발주량
	private int raw_order_amount;
	// 발주일자
	private String raw_order_date;
	// 입고예정일
	private String in_plan_date;
	// 발주 진행 상황
	private int raw_status;
	// 발주 담당자
	private String emp_num;
	
}
