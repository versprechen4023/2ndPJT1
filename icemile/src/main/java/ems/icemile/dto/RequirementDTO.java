package ems.icemile.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RequirementDTO {
	
	// 소요량 코드
	private String req_code;
	// 완제품 코드
	private String prod_code;
	// 완제품명
	private String prod_name;
	// 원자재 코드
	private String raw_code;
	// 원자재명
	private String raw_name;
	// 소요량 등록일
	private String req_insertDATE;
	// 소요량
	private int req_amount;
	// 소요량 수정일
	private String req_upDATEDATE;
	// 소요량 비고
	private String req_note;
	
}
