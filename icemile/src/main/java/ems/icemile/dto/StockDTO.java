package ems.icemile.dto;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StockDTO {
	
	  // 재고 코드
	  private String stock_code;
	  
	  // 원자재 코드
	  private String raw_code;
	  
	  // 원자재 이름
	  private String raw_name;
	  
	  // 재고 현황
	  private int stock_status;
	  
	  // 재고 종류
	  private String raw_type;
	  
	  // 재고 실사
	  private int stock_amount;
	  
	  // 재고 체크 날짜
	  private String stock_date;

	  // 재고 관리 담당자
	  private String emp_num;
	  
	  //창고 코드
	  private String wh_code;


	
	   
	}

