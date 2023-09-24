package ems.icemile.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SellDTO {

	private String branch_code;
	private String branch_name;
	private int branch_num;
	private String branch_ceo;
	private String emp_num;
	private int branch_tel;
	private String branch_add;
	private int branch_post;
	private String branch_email;
}
