package ems.icemile.dto;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class outMaterialInsertDTO {
  //출고 코드 
  private String out_code;
  
  //출고 창고 코드 
  private String out_wh_code;
  
  //수주 코드
  private String order_code;
  
  //출고 담당자
  private String emp_num;
  
  //출고 현황
  private String out_status;
  
  //지점코드
  private String branch_code;
  
  //지점코드의 숫자
  private String trBranchNumber;
  
  //출고일자
  private LocalDate out_date;
  
  // 재고 코드
  private String stock_code;
  
  //출고량 
  private int out_amount;
}
