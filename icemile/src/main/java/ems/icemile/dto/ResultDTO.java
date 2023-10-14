package ems.icemile.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ResultDTO {
	
	// 실적 코드
	private String result_code;
	//v 작업 지시 코드
	private String work_code;
	//v 작업 완료 날짜
	private String done_date;
	//v 라인 코드
	private String line_code;
	//v 품목 코드
	private String prod_code;
	//v 품목 이
	private String prod_name;
	//v 지시수량 = 전체수 - 불량 = 양품 
	private int order_amount;	
	// 양품
	private int good_prod;
	// 불량
	private int faulty_prod;
	// 불량 사유
	private String faulty_reason;
	//v 진행 사항
	private int rs_status;
	//v 진행 사항
	private int rs_process;
	// 비고
	private String remark;

	
}
