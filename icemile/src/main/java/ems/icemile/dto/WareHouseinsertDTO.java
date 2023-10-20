package ems.icemile.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WareHouseinsertDTO {
	  //창고 코드
	  private String wh_code;
	  
	  //창고 이름
	  private String wh_name;
	  
	  //창고 종류
	  private String wh_type;
	  
	  //창고위치
	  private String wh_location;
	  
	  //창고 우편번호 
	//  private String wh_post
	  
	  //창고 주소 
	//  private String wh_add
	  
	  //창고 전화번호
	  private String wh_phone;
	  
	  //창고 가용 상태
	  private String wh_status;
	  
	  //완제품 코드 
	  private String prod_code;
	  
	  //완제품 이름 
	  private String prod_name;
	  
	  //원자재 코드 
	  private String raw_code;
	  	
	  //원자재 이름 
	  private String raw_name;
	  
	  //창고 담당자 
	  private String emp_num;
	  
	  //창고 비고 
	  private String wh_note;
	  
	  //원자재or완재품 구분
	  private String type;
	   
	}

