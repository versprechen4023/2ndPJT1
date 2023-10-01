package ems.icemile.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BuyDTO {

	// 매입처 코드
	private String buy_code;
	// 매입처 상호명
	private String buy_name;
	// 매입처 사업자등록번호
	private String buy_reg;
	// 매입처 대표자
	private String buy_ceo;
	// 매입처 담당자
	private String buy_emp;
	// 구매담당자(본사직원)
	private String emp_num;
	// 매입처 업종유형
	private String buy_type;
	// 매입처 연락처
	private String buy_phone;
	// 매입처 주소
	private String buy_add;
	// 매입처 메일
	private String buy_email;
	// 매입처 우편번호
	private String buy_post;
}
