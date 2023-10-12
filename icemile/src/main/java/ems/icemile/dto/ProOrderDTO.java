package ems.icemile.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProOrderDTO {
	// 수주 코드
	private String order_code;
	// 지점코드
	private String branch_code;
	// 제품명
	private String prod_name;
	// 주문량
	private int order_amount;
	// 수주일자
	private String order_date;
	// 수주 변환 날짜
	private String myDate;
	// 납품예정일
	private String out_plan_date;
	// 진행상황
	private int order_status;
	// 수주 담당자
	private String emp_num;
	
}
