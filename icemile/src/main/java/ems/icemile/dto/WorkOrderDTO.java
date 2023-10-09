package ems.icemile.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WorkOrderDTO {

	// 작업 지시 코드
	private String work_code;
	// 작업 지시자
	private String emp_num;
	// 라인 코드
	private String line_code;
	// 라인 이름
	private String line_name;
	// 수주 코드
	private String order_code;
	// 제품명
	private String prod_name;
	// 지시량
	private String order_amount;
	// 생산 공정
	private String line_process;
	// 작업 지시 날짜
	private String work_order_date;
	// 지점명
	private String branch_name;
}
