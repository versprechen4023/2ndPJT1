package ems.icemile.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductInsertDTO {
	
	// 완제품와 원자재 코드
	private String prod_code;
	// 완제품와 원자재 이름
	private String prod_name;
	// 완제품와 원자재 종류
	private String prod_type;
	// 완제품와 원자재 단위
	private int prod_unit;
	// 완제품와 원자재 수량
	private int prod_amount;
	// 완제품와 원자재 가격
	private int prod_price;
	// 완제품와 원자재 유통기한
	private String prod_exp;
	// 완제품와 원자재 비고
	private String prod_note;
	// 완제품와 원자재에 대한 매입처/지점코드
	private String deal_code;
	// 완제품와 원자재 코드 창고코드
	private String wh_code;
	// 완제품 원자재 구분 타입
	private String type;
}
