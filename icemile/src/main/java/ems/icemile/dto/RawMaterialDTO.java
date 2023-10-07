package ems.icemile.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RawMaterialDTO {
	
	private String raw_code;
	private String raw_name;
	private String raw_type;
	private int raw_price;

}
