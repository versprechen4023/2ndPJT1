package ems.icemile.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {
	
	private String id;
	private String pass;
	private String permission;
	private String birthdate;
}
