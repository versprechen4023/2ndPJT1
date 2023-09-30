package ems.icemile.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//lombok 사용 - get,set메서드 자동 생성 -> @Getter, @Setter
//           - 문자열 표현 toString()메서드 자동 생성 -> @ToString
public class FacilityDTO {
	

	

	//라인 코드
	private String line_code;

	//라인 이름
	private String line_name;
	
	//라인(설비) 전화번호
	private String line_phone;
	
	//생산 공장
	private int line_process;
	
	//가동 상태
	private int line_status;
	
	//라인 담당자
	private String emp_num;
	
	//비고
	private String line_note;
	







}//FacilityDTO
