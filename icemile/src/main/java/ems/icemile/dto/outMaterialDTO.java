package ems.icemile.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class outMaterialDTO {
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
  
}