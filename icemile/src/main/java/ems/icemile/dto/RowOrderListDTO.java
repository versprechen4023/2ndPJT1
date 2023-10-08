package ems.icemile.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RowOrderListDTO {
	
	// 발주코드
	private String raw_order_code;
	// 원자재 코드
	private String raw_code;
	// 원자재 이름
	private String raw_name;
	// 원자재 종류
	private String raw_type;
	// 매입처 코드
	private String buy_code;
	// 매입처 이름
	private String buy_name;
	// 발주량
	private int raw_order_amount;
	// 단가
	private int raw_price;
	// 계산된 가격
	private int raw_fullprice;
	// 발주 일자
	private String raw_order_date;
	// 입고예정일
	private String in_plan_date;
	// 진행상황
	private int raw_status;
	// 담당자 번호
	private String emp_num;
	
}
