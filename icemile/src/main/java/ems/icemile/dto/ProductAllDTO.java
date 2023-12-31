package ems.icemile.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductAllDTO {
	
	// 완제품와 원자재 코드
	private String prod_code;
	// 완제품와 원자재 이름
	private String prod_name;
	// 완제품와 원자재 종류
	private String prod_type;
	// 완제품와 원자재 가격
	private int prod_price;
	// 완제품와 원자재 비고
	private String prod_note;
	
}
