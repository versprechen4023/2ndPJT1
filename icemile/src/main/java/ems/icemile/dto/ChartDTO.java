package ems.icemile.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//lombok 사용 - get,set메서드 자동 생성 -> @Getter, @Setter
//- 문자열 표현 toString()메서드 자동 생성 -> @ToString
public class ChartDTO {
	
	private String label;
	private int data;
	private int data1;

}
